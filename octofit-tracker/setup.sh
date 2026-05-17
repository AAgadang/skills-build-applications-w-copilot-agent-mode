#!/bin/bash

# OctoFit Tracker App - Virtual Environment Setup (macOS/Linux)

set -e  # Exit on error

echo "🚀 Setting up OctoFit Tracker App..."
echo "=================================="

# Check if Python 3 is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 is not installed. Please install Python 3 and try again."
    exit 1
fi

PYTHON_VERSION=$(python3 --version)
echo "✅ Found: $PYTHON_VERSION"

# Create virtual environment
echo ""
echo "📦 Creating virtual environment..."
if [ -d "venv" ]; then
    echo "⚠️  Virtual environment already exists. Removing old one..."
    rm -rf venv
fi

python3 -m venv venv
echo "✅ Virtual environment created"

# Activate virtual environment
echo ""
echo "🔌 Activating virtual environment..."
source venv/bin/activate
echo "✅ Virtual environment activated"

# Upgrade pip
echo ""
echo "📦 Upgrading pip..."
pip install --upgrade pip
echo "✅ pip upgraded"

# Install requirements
echo ""
echo "📦 Installing Python requirements..."
if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt
    echo "✅ All dependencies installed successfully!"
else
    echo "❌ requirements.txt not found in current directory"
    exit 1
fi

echo ""
echo "=================================="
echo "✨ Setup completed successfully!"
echo ""
echo "To activate the virtual environment, run:"
echo "   source venv/bin/activate"
echo ""
echo "To deactivate, run:"
echo "   deactivate"