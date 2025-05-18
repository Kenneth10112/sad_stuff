import subprocess
import sys

def run_command(command):
    try:
        subprocess.run(command, check=True, shell=True)
    except subprocess.CalledProcessError as e:
        print(f"Error executing command: {e}")
        sys.exit(1)

print("Updating Database...")

# Example commands (replace with your actual setup commands)
run_command("python manage.py makemigrations")
run_command("python manage.py migrate")

print("Updating complete!")