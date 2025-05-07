# Task Manager CRUD API using FastAPI and MySQL

from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import Optional, List
import sqlite3

# FastAPI instance
app = FastAPI()

# Database Connection
DATABASE = ':memory:'
conn = sqlite3.connect(DATABASE)
cursor = conn.cursor()

# Create Tables
cursor.execute('''
CREATE TABLE user (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
);
''')

cursor.execute('''
CREATE TABLE task (
    task_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    description TEXT,
    completed BOOLEAN NOT NULL DEFAULT 0,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);
''')

# Sample Data
cursor.executemany('INSERT INTO user (name, email) VALUES (?, ?)', [
    ('Amahle Mathebula', 'ama@taskmanager.com'),
    ('Awande Lushozi', 'awa@taskmanager.com')
])

cursor.executemany('INSERT INTO task (title, description, completed, user_id) VALUES (?, ?, ?, ?)', [
    ('Complete SQL Assignment', 'Finish the boutique system assignment', 0, 1),
    ('Plan Fashion Blog Post', 'Create a new fashion blog post outline', 0, 2)
])

conn.commit()

# Pydantic Models
class Task(BaseModel):
    title: str
    description: Optional[str] = None
    completed: Optional[bool] = False
    user_id: int

# Create Task
@app.post('/tasks/')
def create_task(task: Task):
    cursor.execute(
        'INSERT INTO task (title, description, completed, user_id) VALUES (?, ?, ?, ?)',
        (task.title, task.description, task.completed, task.user_id)
    )
    conn.commit()
    return {'message': 'Task created successfully'}

# Get All Tasks
@app.get('/tasks/', response_model=List[Task])
def get_tasks():
    cursor.execute('SELECT title, description, completed, user_id FROM task')
    tasks = cursor.fetchall()
    return [{'title': t[0], 'description': t[1], 'completed': bool(t[2]), 'user_id': t[3]} for t in tasks]

# Update Task
@app.put('/tasks/{task_id}')
def update_task(task_id: int, task: Task):
    cursor.execute('UPDATE task SET title = ?, description = ?, completed = ?, user_id = ? WHERE task_id = ?',
                   (task.title, task.description, task.completed, task.user_id, task_id))
    conn.commit()
    return {'message': 'Task updated successfully'}

# Delete Task
@app.delete('/tasks/{task_id}')
def delete_task(task_id: int):
    cursor.execute('DELETE FROM task WHERE task_id = ?', (task_id,))
    conn.commit()
    return {'message': 'Task deleted successfully'}

# Run the application

