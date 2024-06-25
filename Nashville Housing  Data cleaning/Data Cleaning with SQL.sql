/*

Cleaning Data in SQL Queries

*/

SELECT * FROM PortfolioProject..NashvilleHousing

--------------------------------------------------------------------------------------------------------------------------

-- Standardize Date Format

SELECT SaleDate, CONVERT(DATE, SaleDate) AS SaleDateConverted
FROM PortfolioProject..NashvilleHousing

ALTER TABLE PortfolioProject..NashvilleHousing
ADD SaleDateConverted DATE

Update PortfolioProject..NashvilleHousing
SET SaleDateConverted = SaleDate

 --------------------------------------------------------------------------------------------------------------------------

-- Populate Property Address data

SELECT *
FROM PortfolioProject..NashvilleHousing
--WHERE PropertyAddress IS NULL
ORDER BY ParcelID

SELECT A.ParcelID, A.PropertyAddress, B.ParcelID, B.PropertyAddress, ISNULL(A.PropertyAddress, B.PropertyAddress)
FROM PortfolioProject..NashvilleHousing A
INNER JOIN PortfolioProject..NashvilleHousing B
	ON A.ParcelID=B.ParcelID
	AND A.[UniqueID ]<>B.[UniqueID ]
WHERE A.PropertyAddress IS NULL

UPDATE A
SET A.PropertyAddress=ISNULL(A.PropertyAddress, B.PropertyAddress)
FROM PortfolioProject..NashvilleHousing A
INNER JOIN PortfolioProject..NashvilleHousing B
	ON A.ParcelID=B.ParcelID
	AND A.[UniqueID ]<>B.[UniqueID ]
WHERE A.PropertyAddress IS NULL

--------------------------------------------------------------------------------------------------------------------------

-- Breaking out Address into Individual Columns (Address, City, State) Using SUBSRING

SELECT PropertyAddress
FROM PortfolioProject..NashvilleHousing

SELECT
SUBSTRING(PropertyAddress,1, CHARINDEX(',', PropertyAddress)-1) AS Address,
SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress)+1, LEN(PropertyAddress)-CHARINDEX(',', PropertyAddress)) AS City
FROM PortfolioProject.dbo.NashvilleHousing

ALTER TABLE PortfolioProject..NashvilleHousing
ADD Address NVARCHAR(255)

UPDATE PortfolioProject..NashvilleHousing
SET Address= SUBSTRING(PropertyAddress,1, CHARINDEX(',', PropertyAddress)-1)



ALTER TABLE PortfolioProject..NashvilleHousing
ADD City NVARCHAR(255)

UPDATE PortfolioProject..NashvilleHousing
SET City= SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress)+1, LEN(PropertyAddress)-CHARINDEX(',', PropertyAddress))

SELECT * FROM PortfolioProject..NashvilleHousing


-- Breaking out Owner Address into Individual Columns (Address, City, State) Using PARSENAME


SELECT * FROM PortfolioProject..NashvilleHousing

SELECT 
PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3),
PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2),
PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1)
FROM PortfolioProject..NashvilleHousing

ALTER TABLE PortfolioProject..NashvilleHousing
ADD Owner_Address NVARCHAR(255)

UPDATE PortfolioProject..NashvilleHousing
SET Owner_Address=PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3) 

ALTER TABLE PortfolioProject..NashvilleHousing
ADD Owner_City NVARCHAR(255)

UPDATE PortfolioProject..NashvilleHousing
SET Owner_City=PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2)

ALTER TABLE PortfolioProject..NashvilleHousing
ADD Owner_State NVARCHAR(255)

UPDATE PortfolioProject..NashvilleHousing
SET Owner_State=PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1)

Select *
From PortfolioProject.dbo.NashvilleHousing

--------------------------------------------------------------------------------------------------------------------------


-- Change Y and N to Yes and No in "Sold as Vacant" field

SELECT DISTINCT(SoldAsVacant), COUNT(SoldAsVacant)
FROM PortfolioProject..NashvilleHousing
GROUP BY SoldAsVacant
ORDER BY COUNT(SoldAsVacant)


Select SoldAsVacant,
CASE
	WHEN SoldAsVacant='Y' THEN 'Yes'
	WHEN SoldAsVacant='N' THEN 'No'
	ELSE SoldAsVacant
END 
From PortfolioProject.dbo.NashvilleHousing

UPDATE PortfolioProject..NashvilleHousing
SET SoldAsVacant= CASE
	WHEN SoldAsVacant='Y' THEN 'Yes'
	WHEN SoldAsVacant='N' THEN 'No'
	ELSE SoldAsVacant
END 

SELECT * FROM PortfolioProject..NashvilleHousing
-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- Remove Duplicates

-- To identify the duplicates 

WITH RowNum_CTE AS (
SELECT * ,
	ROW_NUMBER() OVER (
	PARTITION BY ParcelID, 
	PropertyAddress,
	SalePrice, 
	SaleDateConverted, 
	LegalReference 
	ORDER BY UniqueID) RowNum
FROM PortfolioProject..NashvilleHousing
)
SELECT * FROM RowNum_CTE
WHERE RowNum>1
ORDER BY PropertyAddress

-- Now to delete the duplicates

WITH RowNum_CTE AS (
SELECT * ,
	ROW_NUMBER() OVER (
	PARTITION BY ParcelID, 
	PropertyAddress,
	SalePrice, 
	SaleDateConverted, 
	LegalReference 
	ORDER BY UniqueID) RowNum
FROM PortfolioProject..NashvilleHousing
)
DELETE FROM RowNum_CTE
WHERE RowNum>1

---------------------------------------------------------------------------------------------------------

-- Delete Unused Columns

SELECT * FROM PortfolioProject..NashvilleHousing

ALTER TABLE PortfolioProject..NashvilleHousing
DROP COLUMN OwnerAddress, PropertyAddress, TaxDistrict, SaleDate




