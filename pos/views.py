from django.shortcuts import render
from django.db import transaction
from django.http import HttpResponse
from django.utils import timezone
from .models import (
    ItemGroup,
    Item
)
from digiledger.models import (
    Transaction,
    TransactionSource,
    RecordAccount,
    RecordStatementGroup,
    RecordType,
    LatestRefId,
    Section,
    DigiledgerUser
)


def index(request):
    context = {
        'Items': Item.objects.all(),
        'ItemGroups': ItemGroup.objects.all()
    }
    return render(request, 'pos/pos.html', context=context)

def addTransact(request):
    if request.method == "POST":

        cartItems = []
        for item in request.POST.getlist('cartItem'):
            _ = {}
            _["name"], _["price"] = item.split("_")
            cartItems.append(_)

        with transaction.atomic(): # Ensures all operations succeed or fail together
            totalCartCost = request.POST['cartTotal']
            current_user_id = request.session.get('current_user_id')
            current_user = DigiledgerUser.objects.get(id=current_user_id)

            new_transaction = Transaction.objects.create(
                ref_id=getPosLatestRefID(),
                mon_val=totalCartCost,
                ent_date=timezone.now(), # Use current time
                dsc=f"Sold {totalCartCost} worth of item",
                destination=RecordAccount.objects.get(account_name="Cash"),
                section=Section.objects.get(pk=1),
                ent_by=current_user # Assign the logged-in user
            )

            TransactionSource.objects.create(
                mon_val=totalCartCost,
                transaction=new_transaction,  # Link to the newly created transaction
                source_account=RecordAccount.objects.get(account_name="Sales revenue")
            )

            incPosRefID()
            totalInvCost = getInvCostFromItemList(cartItems)
            new_transaction2 = Transaction.objects.create(
                ref_id=getPosLatestRefID(),
                mon_val=totalInvCost,
                ent_date=timezone.now(), # Use current time
                dsc=f"Used {totalInvCost} worth of supplies",
                destination=RecordAccount.objects.get(account_name="Cost of Goods Sold"),
                section=Section.objects.get(pk=1),
                ent_by=current_user # Assign the logged-in user
            )

            TransactionSource.objects.create(
                mon_val=totalInvCost,
                transaction=new_transaction2,  # Link to the newly created transaction
                source_account=RecordAccount.objects.get(account_name="Inventory")
            )
            incPosRefID()

        context = {
            "cartSubtotal": request.POST['cartSubtotal'],
            "cartTax": request.POST['cartTax'],
            "cartDicount": request.POST['cartDicount'],
            "cartTotal": request.POST['cartTotal'],
            "cartItems": cartItems
        }

        return render(request, 'pos/printPage.html', context=context)

def getPosLatestRefID():
    try:
        latestRefId_obj = LatestRefId.objects.get(pk=1)
        sysAcrnym, idNum_str = latestRefId_obj.posRefId.split("_")
        next_id_num = int(idNum_str) + 1
        new_pos_id = f"{sysAcrnym}_{next_id_num}"
        return new_pos_id
        
    except LatestRefId.DoesNotExist:
        newRefID = LatestRefId.objects.create(
            posRefId="TXN_1"
        )
        return "TXN_1"

def incPosRefIDAtomic(currentID):
    sysAcrnym, idNum_str = currentID.split("_")
    next_id_num = int(idNum_str) + 1
    newRefID = f"{sysAcrnym}_{next_id_num}"
    return newRefID

def incPosRefID():
    try:
        latestRefId_obj = LatestRefId.objects.get(pk=1)
        sysAcrnym, idNum_str = latestRefId_obj.posRefId.split("_")
        next_id_num = int(idNum_str) + 1
        latestRefId_obj.posRefId = f"{sysAcrnym}_{next_id_num}"
        latestRefId_obj.save()

    except LatestRefId.DoesNotExist:
        pass

def getInvCostFromItemList(itemList):
    total_inventory_cost = 0

    if (itemList):
        for item in itemList:
            itemInfo = Item.objects.get(name=item["name"], salePrice=item["price"])
            total_inventory_cost += int(itemInfo.invPrice)

    return total_inventory_cost
