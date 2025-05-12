# Digiledger Application

This is a simple Django application that allows users to create and vote on polls. It's built following the official Django tutorial.

## Installation

1.  **Clone the Repository:**
    ```bash
    git clone https://github.com/Kenneth10112/sad_stuff.git
    ```
2.  **Create a Virtual Environment:**
    navigate to `/path/to/your/sad_stuff/` then run this command.
        ```bash
        python -m venv venv
        ```
3.  **Activate the Virtual Environment:**
    * **macOS/Linux:**
        ```bash
        source venv/bin/activate
        ```
        or
        ```bash
        . venv/bin/activate
        ```

    * **Windows:**
        ```bash
        venv\Scripts\activate
        ```
    * **If you have an error of "Unauthorized access"**
         ```bash
        Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
        ```
        then try again 
4.  **Install Dependencies:**
    ```bash
    pip install -r requirements.txt
    ```

5.  **Database Setup:**
    * This project uses MySQL. Make sure you have MySQL installed and running.
    * Create a database for your project (e.g., `sad_project_db`).
    * Import the latest sql dump file from `/sad_stuff/!misc/sql_dumps/` based on the date to the created database
    * Create a `.env` file and add the following `DB_NAME` `DB_USER` `DB_PASSWORD` `DB_HOST` and fill with your own details
    

6.  **Run the Development Server:**
    ```bash
    python manage.py runserver
    ```

## Usage
* Entries are automatically generated from integrated systems such as the `POS (Point of sale) system` and `Expenses Management system`
* Entries are automatically posted to journals and ledgers.
* Posted Entries are automatically compiled and processed to generate Financial Statements.

## Main Author
Vanessa10112