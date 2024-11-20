## **1. Classification Report** 
```python   
print("Classification Report:\n", classification_report(y_test, y_pred))
``` 
* This report gives detailed statistics on the performance of your classification model. It includes the following metrics for each class (0 and 1) as well as average metrics for the model:

* **Precision:** The percentage of true positive predictions (correct defaulters) out of all positive predictions (predicted defaulters).

  * **Precision for class 0 (Non-Defaulters):** 0.89 – This means that when the model predicts non-default, 89% of the time it is correct.
  * **Precision for class 1 (Defaulters):** 0.62 – This means that when the model predicts default, 62% of the time it is correct.

* **Recall:** The percentage of true positive predictions (correct defaulters) out of all actual positives (actual defaulters).
  * **Recall for class 0 (Non-Defaulters):** 1.00 – This means that all actual non-defaulters were correctly predicted by the model.
  * **Recall for class 1 (Defaulters):** 0.03 – This is very low, indicating that only 3% of the actual defaulters were correctly identified by the model.

* **F1-Score:** The harmonic mean of precision and recall. It’s a combined measure that considers both false positives and false negatives.
  * **F1-Score for class 0 (Non-Defaulters):** 0.94 – A good F1 score, meaning that for non-defaulters, the model is quite accurate.
  * **F1-Score for class 1 (Defaulters):** 0.06 – A very poor F1 score for defaulters, meaning the model has difficulty predicting defaulters accurately.

* **Support:** The number of occurrences of each class in the test set.
  * **Support for class 0 (Non-Defaulters):** 67,681
  * **Support for class 1 (Defaulters):** 8,924
 
* **Overall accuracy:** 0.89 – This means that 89% of the total predictions are correct, but accuracy alone doesn’t tell the whole story in imbalanced datasets like this one (where defaulters are much less frequent).

* **Macro Average:**
  * **Precision:** 0.75
  * **Recall:** 0.52
  * **F1-Score:** 0.50
  * These averages are computed for both classes (0 and 1), without considering class imbalance, and give a general overview of the model’s performance.

* **Weighted Average:** The weighted average takes into account the number of samples in each class:
  * **Precision:** 0.86
  * **Recall:** 0.89
  * **F1-Score:** 0.84
This suggests that the model performs better on class 0 (non-defaulters), which is likely because it has many more instances in the dataset.

## **2. Confusion Matrix**
```python
print("Confusion Matrix:\n", confusion_matrix(y_test, y_pred))
```
The confusion matrix provides a detailed breakdown of the model’s performance by showing how many samples were classified into each of the four categories:

  * **True Negatives (TN): 67,492** – These are the non-defaulters who were correctly predicted as non-defaulters.
  * **False Positives (FP): 189**– These are non-defaulters who were incorrectly predicted as defaulters (Type I error).
  * **False Negatives (FN): 8,618** – These are defaulters who were incorrectly predicted as non-defaulters (Type II error).
  * **True Positives (TP): 306** – These are defaulters who were correctly predicted as defaulters.
This highlights a severe issue with classifying defaulters, as the model only identified 306 defaulters out of 8,924 actual defaulters (indicating poor recall for the default class).

## **3. ROC-AUC Score**
```python
auc_score = roc_auc_score(y_test, y_pred_proba)
print("Test ROC-AUC Score:", auc_score)
```
* **ROC-AUC stands for the Receiver Operating Characteristic - Area Under the Curve.** It is a measure of how well the model distinguishes between the classes (non-default and default). The higher the ROC-AUC score, the better the model.

  * **Test ROC-AUC Score: 0.7492** – This means that the model has a good ability to distinguish between defaulters and non-defaulters, but it is not perfect. A score above 0.7 is generally considered decent, and a score close to 1.0 would indicate a near-perfect model.

 
## **Key Insights:**
* **Class Imbalance Problem:** The model has difficulty identifying defaulters because there are far fewer defaulters than non-defaulters in the dataset. This is reflected in the low recall for class 1 (defaulters), where only 3% of actual defaulters are correctly predicted.

* **Precision vs Recall:** The model has good precision for predicting non-defaulters, but its recall for defaulters is very poor. This suggests that the model is conservative when predicting defaulters and misses most of them.

* **Improvement Areas:** The model’s ability to identify defaulters can be improved by addressing the class imbalance. Techniques like:

  * **Oversampling the minority class (defaulters)**
  * **Undersampling the majority class (non-defaulters)**
  * **Using algorithms like Random Forest or XGBoost** that handle class imbalance better
  * **Adjusting class weights** in the model could help improve the recall and F1 score for the defaulter class.
