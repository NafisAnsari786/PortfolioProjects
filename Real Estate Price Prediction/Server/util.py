import json
import pickle
import numpy as np
import warnings

# Suppress warnings
warnings.filterwarnings('ignore')

# Global variables to store location names, column names, and the model
__locations = None
__data_columns = None
__model = None


def get_estimated_price(location, sqft, bhk, bath):
    """
    Predicts the estimated price of a property based on location, square feet,
    number of bedrooms (bhk), and number of bathrooms (bath).
    """
    try:
        # Normalize the location name to match column names
        loc_index = __data_columns.index(location.strip().lower()) if location.strip().lower() in __data_columns else -1
    except Exception as e:
        loc_index = -1

    # Create an input array of zeros with the same size as data columns
    x = np.zeros(len(__data_columns))
    x[0] = sqft  # Assign square feet to the first feature
    x[1] = bath  # Assign number of bathrooms to the second feature
    x[2] = bhk   # Assign number of bedrooms to the third feature
    if loc_index >= 0:
        # If the location is found, set its corresponding index to 1
        x[loc_index] = 1

    # Use the trained model to predict the price and return the result
    return round(__model.predict([x])[0], 2)


def load_saved_artifacts():
    """
    Loads the saved model and data columns from the artifacts folder.
    """
    global __data_columns
    global __locations
    global __model

    if __data_columns is None or __model is None:
        # Paths to the saved JSON file (columns) and the trained model
        columns_file_path = r"C:\Users\Nafis Ansari\Desktop\BHP\server\artifacts\columns.json"
        model_file_path = r"C:\Users\Nafis Ansari\Desktop\BHP\server\artifacts\bangalore_home_prices_model.pickle"

        with open(columns_file_path, "r") as f:
            # Load data columns and locations
            __data_columns = json.load(f)['data_columns']
            __locations = __data_columns[3:]  # Skip the first 3 columns (sqft, bath, bhk)

        # Load the trained model if not already loaded
        with open(model_file_path, "rb") as f:
            __model = pickle.load(f)


def get_location_names():
    """
    Returns the list of all location names.
    """
    return __locations


def get_data_columns():
    """
    Returns the list of all data columns (features).
    """
    return __data_columns


if __name__ == "__main__":
    # Testing code to run util.py independently
    print("Loading artifacts...")
    load_saved_artifacts()
    print("Model loaded successfully.")
    print("Available Locations:", get_location_names())
    print(get_estimated_price('1st Phase JP Nagar', 1000, 3, 3))
    print(get_estimated_price('1st Phase JP Nagar', 1000, 2, 2))
    print(get_estimated_price('Kalhalli', 1000, 2, 2)) # other location
    print(get_estimated_price('Ejipura', 1000, 2, 2))  # other location
