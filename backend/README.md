# Coal Blend Backend

The backend for the Coal Blend Optimization System is built with Python and FastAPI. It handles data management, simulation logic, genetic algorithm optimization, and serves the REST API.

## Setup

### Prerequisites
- Python 3.8+
- PostgreSQL

### Installation

1.  **Create a Virtual Environment:**
    ```bash
    python -m venv .venv
    # Windows
    .venv\Scripts\activate
    # Linux/Mac
    source .venv/bin/activate
    ```

2.  **Install Dependencies:**
    ```bash
    pip install -r requirements.txt
    ```

3.  **Environment Configuration:**
    Create a `.env` file in the `backend` directory. You can use `env.example` as a template.
    
    **Required Variables:**
    - `DATABASE_URL`: Connection string for PostgreSQL (e.g., `postgresql://user:pass@localhost:5432/db_name`).
    - `SECRET_KEY`: Secret key for JWT token generation.
    - `GEMINI_API_KEY`: API key for Google Gemini (required for PDF extraction).

4.  **Database Setup:**
    Ensure your PostgreSQL server is running and the database exists. The application uses SQLAlchemy for ORM. Tables are created automatically on startup if they don't exist (via `create_tables.py` or `main.py` startup logic).

### Running the Application

Start the development server with hot reload:
```bash
uvicorn main:app --reload
```
The API will be available at `http://localhost:8000`.

## Architecture

-   **`main.py`**: The entry point of the application. Defines API routes, dependency injection, and startup logic.
-   **`genetic_algorithm.py`**: Contains the `VectorizedGA` class and `FastCoalPredictor`. This is the core engine for optimizing coal blends.
-   **`inference_engine.py`**: Manages the loading and execution of machine learning models for property prediction.
-   **`models.py`**: SQLAlchemy database models.
-   **`schemas.py`**: Pydantic models for request/response validation.
-   **`auth.py`**: Handles user authentication and JWT token management.

## API Documentation

Once the server is running, you can access the interactive API documentation (Swagger UI) at:
`http://localhost:8000/docs`
