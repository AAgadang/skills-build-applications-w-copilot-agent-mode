"""
OctoFit Tracker App - Main Flask Application
"""

from flask import Flask, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

# Health check endpoint
@app.route('/health', methods=['GET'])
def health_check():
    """Health check endpoint"""
    return jsonify({
        'status': 'healthy',
        'message': 'OctoFit Tracker API is running'
    }), 200

# API info endpoint
@app.route('/api/v1', methods=['GET'])
def api_info():
    """API information endpoint"""
    return jsonify({
        'api_name': 'OctoFit Tracker API',
        'version': '1.0.0',
        'description': 'Fitness tracking application backend',
        'endpoints': {
            'health': '/health',
            'users': '/api/v1/users',
            'workouts': '/api/v1/workouts',
            'exercises': '/api/v1/exercises'
        }
    }), 200

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
