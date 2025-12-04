# Coal Blend Optimization System

## Overview
The Coal Blend Optimization System is a comprehensive application designed to optimize coal blending for industrial processes. It leverages advanced genetic algorithms and machine learning models to predict coke properties and recommend optimal coal blends that meet specific quality and cost constraints.

## Key Features
- **Coal Blend Optimization**: Uses a Vectorized Genetic Algorithm to find the most cost-effective coal blends while satisfying chemical and physical property constraints (CSR, CRI, Ash, etc.).
- **Simulation Management**: Create, run, and manage simulations to test different blending scenarios.
- **Prediction Engine**: Machine learning models (Random Forest) to predict resulting coke properties from input coal blends.
- **PDF Data Extraction**: Automated extraction of coal properties from vendor PDF reports using Gemini AI.
- **Interactive Dashboard**: A modern React-based frontend for visualizing data, managing simulations, and viewing recommendations.

## Tech Stack
- **Frontend**: React, Vite, Tailwind CSS, Redux Toolkit
- **Backend**: Python, FastAPI, SQLAlchemy, Pydantic
- **Database**: PostgreSQL
- **AI/ML**: Scikit-learn, Google Gemini API (for data extraction)
- **Containerization**: Docker, Docker Compose

## Quick Start (Docker)
The easiest way to run the application is using Docker Compose.

1.  **Clone the repository:**
    ```bash
    git clone <repository-url>
    cd coal_blend
    ```

2.  **Environment Setup:**
    - Create a `.env` file in the `backend` directory based on `backend/env.example`.
    - Ensure you have a valid `GEMINI_API_KEY` if you plan to use the PDF extraction feature.

3.  **Run with Docker Compose:**
    ```bash
    docker-compose up --build
    ```
    This will start the backend, frontend, and database services.

4.  **Access the Application:**
    - Frontend: `http://localhost:5173`
    - Backend API Docs: `http://localhost:8000/docs`

## Manual Setup

### Backend
1.  Navigate to the `backend` directory:
    ```bash
    cd backend
    ```
2.  Create a virtual environment:
    ```bash
    python -m venv .venv
    source .venv/bin/activate  # On Windows: .venv\Scripts\activate
    ```
3.  Install dependencies:
    ```bash
    pip install -r requirements.txt
    ```
4.  Run the application:
    ```bash
    uvicorn main:app --reload
    ```

### Frontend
1.  Navigate to the `frontend` directory:
    ```bash
    cd frontend
    ```
2.  Install dependencies:
    ```bash
    npm install
    ```
3.  Start the development server:
    ```bash
    npm run dev
    ```
