Technical Specifications for Animal Routes
# Overview
This document outlines the specifications for developing a Flask application that provides routes for different animals. Each route will return a JSON object representing a different animal.

## Application Requirements
- Framework: Flask
- Language: Python
- Port: 5000 (default Flask port)
- Debug Mode: Enabled

## Routes
### Cat Route
- URL: /201/cat
- Method: GET
- Response:
```json
{
  "name": "Whiskers",
  "breed": "Maine Coon",
  "age": 5,
  "color": "Brown"
        }
```

### Dog Route
- URL: /201/dog
- Method: GET
- Response:
```json
{
  "name": "Buddy",
  "age": 5,
  "breed": "Golden Retriever",
  "color": "Golden"
}
```

### Rabbit Route
- URL: /201/rabbit
- Method: GET
- Response:
```json
{
  "name": "Thumper",
  "age": 2,
  "breed": "Holland Lop",
  "color": "Brown"
}
```


## Implementation Details
### Project Structure:
- The main application file should be named app201.py.
- The Flask application should be created using the Flask class.
- Routes should be defined within a function named build_routes.

### Flask Application Setup:
- The application should be created and configured in a function named create_app.
- The application should run in debug mode.