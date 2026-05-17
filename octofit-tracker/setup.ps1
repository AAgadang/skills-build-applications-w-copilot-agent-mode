# OctoFit Tracker App - Virtual Environment Setup (Windows PowerShell)

Write-Host "🚀 Setting up OctoFit Tracker App..." -ForegroundColor Green
Write-Host "==================================" -ForegroundColor Green
Write-Host ""

# Check if Python 3 is installed
try {
    $pythonVersion = python --version 2>&1
    Write-Host "✅ Found: $pythonVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Python 3 is not installed. Please install Python 3 and try again." -ForegroundColor Red
    exit 1
}

# Create virtual environment
Write-Host ""
Write-Host "📦 Creating virtual environment..." -ForegroundColor Cyan

if (Test-Path "venv") {
    Write-Host "⚠️  Virtual environment already exists. Removing old one..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force venv
}

python -m venv venv
Write-Host "✅ Virtual environment created" -ForegroundColor Green

# Activate virtual environment
Write-Host ""
Write-Host "🔌 Activating virtual environment..." -ForegroundColor Cyan
& ".\venv\Scripts\Activate.ps1"
Write-Host "✅ Virtual environment activated" -ForegroundColor Green

# Upgrade pip
Write-Host ""
Write-Host "📦 Upgrading pip..." -ForegroundColor Cyan
python -m pip install --upgrade pip
Write-Host "✅ pip upgraded" -ForegroundColor Green

# Install requirements
Write-Host ""
Write-Host "📦 Installing Python requirements..." -ForegroundColor Cyan

if (Test-Path "requirements.txt") {
    pip install -r requirements.txt
    Write-Host "✅ All dependencies installed successfully!" -ForegroundColor Green
} else {
    Write-Host "❌ requirements.txt not found in current directory" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "==================================" -ForegroundColor Green
Write-Host "✨ Setup completed successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "To activate the virtual environment, run:" -ForegroundColor Cyan
Write-Host "   .\venv\Scripts\Activate.ps1" -ForegroundColor Yellow
Write-Host ""
Write-Host "To deactivate, run:" -ForegroundColor Cyan
Write-Host "   deactivate" -ForegroundColor Yellow