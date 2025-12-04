# Coal Blend Frontend

The frontend for the Coal Blend Optimization System is a modern single-page application built with React and Vite. It provides an interactive interface for managing simulations, viewing optimization results, and analyzing coal data.

## Setup

### Prerequisites
- Node.js (v16+)
- npm or yarn

### Installation

1.  **Navigate to the frontend directory:**
    ```bash
    cd frontend
    ```

2.  **Install Dependencies:**
    ```bash
    npm install
    # or
    yarn install
    ```

### Running the Application

**Development Mode:**
Start the development server with hot module replacement:
```bash
npm run dev
```
The application will be accessible at `http://localhost:5173`.

**Production Build:**
To build the application for production:
```bash
npm run build
```
To preview the production build locally:
```bash
npm run preview
```

## Configuration

The API connection is configured in `src/config.js`.
-   **Development**: Defaults to `http://localhost:8000`.
-   **Production**: Defaults to the configured production server IP.

## Key Technologies
-   **React**: UI library.
-   **Vite**: Build tool and development server.
-   **Tailwind CSS**: Utility-first CSS framework for styling.
-   **Redux Toolkit**: State management.
-   **Recharts**: Charting library for data visualization.
-   **Axios**: HTTP client for API requests.
