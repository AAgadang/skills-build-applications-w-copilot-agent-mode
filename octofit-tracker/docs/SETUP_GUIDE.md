# OctoFit Tracker App - Setup Guide

## Prerequisites

- **Python 3.8+** installed on your system
- **Git** installed
- Terminal/Command Prompt access

### Verify Python Installation

```bash
python3 --version
```

Should output: `Python 3.8.x` or higher

---

## Installation Steps

### Option 1: Automated Setup (Recommended)

#### macOS/Linux:
```bash
cd octofit-tracker
chmod +x setup.sh
./setup.sh
```

#### Windows PowerShell:
```powershell
cd octofit-tracker
.\setup.ps1
```

The script will:
- ✅ Check Python installation
- ✅ Create virtual environment
- ✅ Upgrade pip
- ✅ Install all dependencies from requirements.txt

### Option 2: Manual Setup

#### Step 1: Create Virtual Environment
```bash
cd octofit-tracker
python3 -m venv venv
```

#### Step 2: Activate Virtual Environment

**macOS/Linux:**
```bash
source venv/bin/activate
```

**Windows (Command Prompt):**
```cmd
venv\Scripts\activate
```

**Windows (PowerShell):**
```powershell
.\venv\Scripts\Activate.ps1
```

#### Step 3: Upgrade pip
```bash
pip install --upgrade pip
```

#### Step 4: Install Dependencies
```bash
pip install -r requirements.txt
```

---

## Running the Application

### Start the Flask Server
```bash
python backend/src/app.py
```

You should see output similar to:
```
 * Serving Flask app 'app'
 * Debug mode: on
 * Running on http://0.0.0.0:5000
```

### Test the API

Open a new terminal and run:

```bash
# Test health check endpoint
curl http://localhost:5000/health

# Test API info endpoint
curl http://localhost:5000/api/v1
```

**Expected Response:**
```json
{
  "status": "healthy",
  "message": "OctoFit Tracker API is running"
}
```

---

## Deactivating Virtual Environment

When you're done working:
```bash
deactivate
```

---

## Troubleshooting

### Python Not Found
**Problem:** `python3: command not found`
**Solution:** 
- Install Python 3 from [python.org](https://www.python.org)
- On macOS, use Homebrew: `brew install python3`
- On Linux: `sudo apt-get install python3`

### Permission Denied (macOS/Linux)
**Problem:** `Permission denied: ./setup.sh`
**Solution:**
```bash
chmod +x setup.sh
./setup.sh
```

### Virtual Environment Not Activating
**Problem:** Virtual environment doesn't activate
**Solution:**
- Try the manual setup steps above
- Ensure you're in the correct directory (`octofit-tracker`)

### Import Error: No module named 'flask'
**Problem:** `ModuleNotFoundError: No module named 'flask'`
**Solution:**
- Ensure virtual environment is activated
- Reinstall requirements: `pip install -r requirements.txt`

### Port 5000 Already in Use
**Problem:** `Address already in use`
**Solution:**
- Kill the process using port 5000 or change the port in `app.py`
- On macOS/Linux: `lsof -i :5000` then `kill -9 <PID>`
- On Windows: `netstat -ano | findstr :5000` then `taskkill /PID <PID> /F`

---

## Project Structure

```
octofit-tracker/
├── README.md                    # Project overview
├── requirements.txt             # Python dependencies
├── .gitignore                   # Git ignore rules
├── setup.sh                     # macOS/Linux setup script
├── setup.ps1                    # Windows setup script
├── backend/
│   ├── src/
│   │   ├── __init__.py         # Package initialization
│   │   ├── app.py              # Main Flask application
│   │   ├── controllers/        # Business logic layer
│   │   ├── models/             # Database models
│   │   ├── routes/             # API routes
│   │   └── utils/              # Utility functions
│   └── tests/                  # Test suite
├── mobile/
│   ├── src/                    # Mobile app source
│   ├── android/                # Android-specific code
│   └── ios/                    # iOS-specific code
└── docs/
    ├── SETUP_GUIDE.md          # This file
    └── API_REFERENCE.md        # API documentation
```

---

## Next Steps

1. **Create API Endpoints:** Add endpoints in `backend/src/routes/`
2. **Setup Database:** Configure SQLAlchemy in `backend/src/models/`
3. **Add Business Logic:** Implement controllers in `backend/src/controllers/`
4. **Write Tests:** Add tests in `backend/tests/`
5. **Deploy:** Prepare for production deployment

---

## Additional Resources

- [Flask Documentation](https://flask.palletsprojects.com)
- [SQLAlchemy Documentation](https://docs.sqlalchemy.org)
- [Python Virtual Environments](https://docs.python.org/3/tutorial/venv.html)

---

## Support

For issues or questions, please refer to the documentation or create an issue in the repository.

Happy coding! 🚀