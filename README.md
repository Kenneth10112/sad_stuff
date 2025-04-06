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
    (Ensure you have a `requirements.txt` file listing your project's dependencies.)

5.  **Database Setup:**
    * This project uses MySQL. Make sure you have MySQL installed and running.
    * Create a database for your project (e.g., `polls_db`).
    * Update the `DATABASES` setting in your `settings.py` file with your MySQL connection details.

6.  **Run Migrations:**
    ```bash
    python manage.py migrate
    ```

7.  **Run the Development Server:**
    ```bash
    python manage.py runserver
    ```

8.  **View the Application:**
    * Open your web browser and go to `http://127.0.0.1:8000/polls/`.

## Usage

* Users can create new polls with questions and choices.
* Users can vote on choices in existing polls.
* The application displays poll results.

## Contributing

Contributions are welcome! If you find any issues or would like to add new features, please submit a pull request.

## License

This project is licensed under the [Your License] License. (Replace `[Your License]` with your project's license, e.g., MIT, GPL, etc.)

## Author

[Your Name/GitHub Username]