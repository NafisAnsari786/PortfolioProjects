from flask import Flask, request, jsonify
import util

app = Flask(__name__)

@app.route('/get_location_names', methods=['GET'])
def get_location_names():
    """
    Endpoint to fetch all available location names.
    """
    response = jsonify({
        'locations': util.get_location_names()
    })
    response.headers.add('Access-Control-Allow-Origin', '*')
    return response

@app.route('/predict_home_price', methods=['POST'])
def predict_home_price():
    """
    Endpoint to predict home price based on input parameters.
    """
    try:
        # Extract parameters from POST request form
        total_sqft = float(request.form['total_sqft'])
        location = request.form['location']
        bhk = int(request.form['bhk'])
        bath = int(request.form['bath'])

        # Get the estimated price using the utility function
        estimated_price = util.get_estimated_price(location, total_sqft, bhk, bath)

        # Return the prediction
        response = jsonify({
            'estimated_price': estimated_price
        })
    except Exception as e:
        # Handle errors gracefully
        response = jsonify({
            'error': f"An error occurred: {str(e)}"
        })

    response.headers.add('Access-Control-Allow-Origin', '*')
    return response

if __name__ == "__main__":
    print("Starting Python Flask Server for Home Price Prediction...")
    # Load artifacts before running the server
    util.load_saved_artifacts()
    app.run(debug=True)
