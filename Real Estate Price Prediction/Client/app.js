window.onload = () => {
    console.log("Website Loaded!");
  
    // Populate location names via API
    //fetch("http://127.0.0.1:5000/get_location_names") //Use this if your are running the server on your local computer
    fetch("/api/get_location_names")
      .then((response) => response.json())
      .then((data) => {
        const locationDropdown = document.getElementById("location");
        data.locations.forEach((loc) => {
          const option = document.createElement("option");
          option.value = loc;
          option.textContent = loc;
          locationDropdown.appendChild(option);
        });
      })
      .catch((error) => console.error("Error fetching locations:", error));
  
    // Predict button event listener
    const predictButton = document.getElementById("predictButton");
    predictButton.addEventListener("click", () => {
      const totalSqft = document.getElementById("total_sqft").value;
      const bhk = document.getElementById("bhk").value;
      const bath = document.getElementById("bath").value;
      const location = document.getElementById("location").value;
  
      // Validate inputs
      if (!totalSqft || !bhk || !bath || !location) {
        alert("Please fill all the fields!");
        return;
      }
  
      // Prepare request data
      const formData = new FormData();
      formData.append("total_sqft", totalSqft);
      formData.append("bhk", bhk);
      formData.append("bath", bath);
      formData.append("location", location);
  
      // API call for prediction
      //fetch("http://127.0.0.1:5000/predict_home_price", { //Use this if your are running the server on your local computer
        fetch("/api/predict_home_price", {
        method: "POST",
        body: formData,
      })
        .then((response) => response.json())
        .then((data) => {
          const resultElement = document.getElementById("result");
          if (data.estimated_price) {
            resultElement.textContent = `Estimated Price: ₹${data.estimated_price} Lacs`;
          } else {
            resultElement.textContent = "Error: Could not fetch prediction.";
          }
        })
        .catch((error) => {
          console.error("Error predicting price:", error);
        });
    });
  };
      