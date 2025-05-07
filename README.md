# Database-Management-System-Assignment
# Database Management System Assignment

This repository contains the implementation of an Online Boutique Inventory System as part of the Database Management Systems course assignment. The project includes a MySQL database schema, CRUD API using FastAPI, and a basic database structure visualization.

## 📁 Project Structure

```
📦 Database-Management-System-Assignment
├── __pycache__/
├── ERD.png                # Entity-Relationship Diagram
├── README.md              # Project Documentation
├── boutiqueBD.sql         # SQL script for database creation and data insertion
├── main.py                # CRUD API implementation using FastAPI
└── week 8 submission/     # Additional project files
```

## 🛠️ Installation and Setup

1. **Clone the repository:**  
```
git clone <repository-url>
```

2. **Navigate to the project directory:**  
```
cd Database-Management-System-Assignment
```

3. **Install required Python packages:**  
```
pip install -r requirements.txt
```

4. **Set up the database:**  
- Open MySQL and execute the SQL script:
```
mysql -u <username> -p < boutiqueBD.sql
```

5. **Run the FastAPI application:**  
```
uvicorn main:app --reload
```

## 🛠️ Database Design

- The database schema is visualized using the ERD available in `ERD.png`.
- The `boutiqueBD.sql` script creates the necessary tables and inserts sample data for testing.

## 🚀 Usage

- Start the FastAPI server and access the API documentation at `http://127.0.0.1:8000/docs`.
- Use the CRUD operations defined in `main.py` to interact with the Online Boutique Inventory database.

## 📜 License

This project is for educational purposes only.
