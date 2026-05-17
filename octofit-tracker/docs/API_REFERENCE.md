# OctoFit Tracker App - API Reference

## Base URL
```
http://localhost:5000
```

---

## Endpoints

### 1. Health Check

Check if the API is running.

**Endpoint:** `GET /health`

**Description:** Returns the health status of the API

**Request:**
```bash
curl http://localhost:5000/health
```

**Response (200 OK):**
```json
{
  "status": "healthy",
  "message": "OctoFit Tracker API is running"
}
```

---

### 2. API Information

Get information about the API and available endpoints.

**Endpoint:** `GET /api/v1`

**Description:** Returns API information and list of available endpoints

**Request:**
```bash
curl http://localhost:5000/api/v1
```

**Response (200 OK):**
```json
{
  "api_name": "OctoFit Tracker API",
  "version": "1.0.0",
  "description": "Fitness tracking application backend",
  "endpoints": {
    "health": "/health",
    "users": "/api/v1/users",
    "workouts": "/api/v1/workouts",
    "exercises": "/api/v1/exercises"
  }
}
```

---

## Coming Soon

The following endpoints are planned for future implementation:

### Users Management
- `GET /api/v1/users` - List all users
- `GET /api/v1/users/{id}` - Get user details
- `POST /api/v1/users` - Create new user
- `PUT /api/v1/users/{id}` - Update user
- `DELETE /api/v1/users/{id}` - Delete user

### Workouts
- `GET /api/v1/workouts` - List all workouts
- `GET /api/v1/workouts/{id}` - Get workout details
- `POST /api/v1/workouts` - Create new workout
- `PUT /api/v1/workouts/{id}` - Update workout
- `DELETE /api/v1/workouts/{id}` - Delete workout

### Exercises
- `GET /api/v1/exercises` - List all exercises
- `GET /api/v1/exercises/{id}` - Get exercise details
- `POST /api/v1/exercises` - Create new exercise
- `PUT /api/v1/exercises/{id}` - Update exercise
- `DELETE /api/v1/exercises/{id}` - Delete exercise

---

## Error Handling

All endpoints return appropriate HTTP status codes:

- `200 OK` - Request successful
- `201 Created` - Resource created successfully
- `400 Bad Request` - Invalid request parameters
- `401 Unauthorized` - Authentication required
- `404 Not Found` - Resource not found
- `500 Internal Server Error` - Server error

### Error Response Format:
```json
{
  "error": "Error message",
  "status_code": 400
}
```

---

## Authentication

Authentication endpoints are planned for future implementation:

- `POST /api/v1/auth/login` - User login
- `POST /api/v1/auth/register` - User registration
- `POST /api/v1/auth/logout` - User logout
- `POST /api/v1/auth/refresh` - Refresh authentication token

---

## Rate Limiting

Rate limiting will be implemented in future versions to prevent API abuse.

---

## Versioning

The API uses semantic versioning:
- **v1** - Current version (stable)

Future versions will be available as:
- `/api/v2` - Next major version
- `/api/v3` - Future major version

---

## Development

### Running the Development Server

```bash
python backend/src/app.py
```

The server will start on `http://localhost:5000` in debug mode.

### Hot Reload

Changes to the code will automatically reload the server when in debug mode.

---

## Testing Endpoints

### Using curl

```bash
# Test health endpoint
curl http://localhost:5000/health

# Test API info endpoint
curl http://localhost:5000/api/v1
```

### Using Python requests

```python
import requests

# Test health endpoint
response = requests.get('http://localhost:5000/health')
print(response.json())

# Test API info endpoint
response = requests.get('http://localhost:5000/api/v1')
print(response.json())
```

### Using Postman

1. Open Postman
2. Create a new GET request
3. Enter URL: `http://localhost:5000/health`
4. Click Send

---

## Database Models (Planned)

### User Model
```python
- id: Integer (Primary Key)
- username: String (Unique)
- email: String (Unique)
- password_hash: String
- created_at: DateTime
- updated_at: DateTime
```

### Workout Model
```python
- id: Integer (Primary Key)
- user_id: Integer (Foreign Key)
- name: String
- date: DateTime
- duration: Integer (minutes)
- calories_burned: Float
- created_at: DateTime
```

### Exercise Model
```python
- id: Integer (Primary Key)
- workout_id: Integer (Foreign Key)
- name: String
- sets: Integer
- reps: Integer
- weight: Float
- duration: Integer (seconds)
```

---

## Example Workflows

### Workflow 1: Check API Status
```bash
# Check if API is healthy
curl http://localhost:5000/health

# Get API information
curl http://localhost:5000/api/v1
```

### Workflow 2: User Registration and Login (Future)
```bash
# Register new user
curl -X POST http://localhost:5000/api/v1/auth/register \
  -H "Content-Type: application/json" \
  -d '{"username": "john_doe", "email": "john@example.com", "password": "secure_password"}'

# Login user
curl -X POST http://localhost:5000/api/v1/auth/login \
  -H "Content-Type: application/json" \
  -d '{"username": "john_doe", "password": "secure_password"}'
```

---

## Changelog

### Version 1.0.0 (Current)
- ✅ Health check endpoint
- ✅ API information endpoint
- ✅ Project structure setup
- ⏳ User management (planned)
- ⏳ Workout tracking (planned)
- ⏳ Exercise logging (planned)
- ⏳ Authentication (planned)

---

## Support

For issues, questions, or feature requests, please contact the development team or create an issue in the repository.

---

## License

This project is licensed under the MIT License. See the LICENSE file for details.

Happy tracking! 🏋️
