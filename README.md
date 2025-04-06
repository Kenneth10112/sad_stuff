# Django Polls Application

This is a simple Django application that allows users to create and vote on polls. It's built following the official Django tutorial.

## Installation

1.  **Clone the Repository:**
2.  **Create a Virtual Environment:**
    python -m venv venv
3.  **Activate the Virtual Environment:**
    * **macOS/Linux:**
        ```bash
        source venv/bin/activate
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
    * Create a `.env` file and add the following `DB_NAME` `DB_USER` `DB_PASSWORD` `DB_HOST` and fill with your own details
    * Run the `update.py` python file

6.  **Run the Development Server:**
    ```bash
    python manage.py runserver
    ```

## Usage
* Users can create new polls with questions and choices.
* Users can vote on choices in existing polls.
* The application displays poll results.

## Author
Vanessa10112