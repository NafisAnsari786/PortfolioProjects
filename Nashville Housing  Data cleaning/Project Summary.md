# Nashville Housing Data Cleaning Project

## Project Summary

This project involves cleaning the `NashvilleHousing` dataset within the `PortfolioProject` database. The data cleaning steps include:

1. **Standardizing Date Formats**:
   - Converted the `SaleDate` column to a standardized date format and stored it in a new column `SaleDateConverted`.

2. **Populating Missing Property Address Data**:
   - Populated `NULL` values in the `PropertyAddress` column by matching `ParcelID` with other rows in the table.

3. **Breaking Out Address into Individual Columns**:
   - Separated `PropertyAddress` into `Address` and `City` columns using string manipulation functions.
   - Separated `OwnerAddress` into `Owner_Address`, `Owner_City`, and `Owner_State` columns using the `PARSENAME` function.

4. **Standardizing Boolean Fields**:
   - Converted `Y` and `N` values in the `SoldAsVacant` column to `Yes` and `No`.

5. **Removing Duplicates**:
   - Identified and removed duplicate rows based on multiple columns to ensure data consistency.

6. **Deleting Unused Columns**:
   - Dropped unnecessary columns `OwnerAddress`, `PropertyAddress`, `TaxDistrict`, and `SaleDate` from the table to streamline the dataset.

## Conclusion

This project demonstrates various data cleaning techniques in SQL to ensure that the `NashvilleHousing` dataset is clean, consistent, and ready for analysis. By standardizing date formats, handling `NULL` values, separating concatenated fields, standardizing boolean values, removing duplicates, and dropping unused columns, the dataset has been significantly improved for further use in data analysis and reporting.

