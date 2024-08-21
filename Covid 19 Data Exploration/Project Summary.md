# COVID-19 Data Exploration 

This repository contains SQL scripts for exploring COVID-19 data. The data exploration involves various SQL techniques such as Joins, Common Table Expressions (CTEs), Temporary Tables, Window Functions, Aggregate Functions, Creating Views, and Converting Data Types. The main focus is on understanding the impact of COVID-19 across different countries and continents through various metrics.

### Database 

The data is stored in a database named `PortfolioProject` and contains the following tables:

- `CovidDeaths`: Contains data related to COVID-19 deaths. 
- `CovidVaccinations`: Contains data related to COVID-19 vaccinations. 

### SQL Queries

The SQL scripts include the following queries:

#### 1. Data Retrieval and Selection

- Retrieve all data from `CovidDeaths` and `CovidVaccinations` where the continent is not `NULL`. 
- Select relevant columns for further analysis.

#### 2. Analysis and Metrics

- **Total Cases vs Total Deaths**: Calculate the likelihood of dying if infected with COVID-19 for specific countries.
- **Total Cases vs Population**: Calculate the percentage of the population infected with COVID-19 for each country.
- **Highest Infection Rate**: Identify countries with the highest infection rate compared to their population.
- **Highest Death Count**: Identify countries and continents with the highest death count per population.

#### 3. Global Numbers

- Calculate global metrics such as total cases, total deaths, and death percentage.

#### 4. Vaccination Analysis

- **Population vs Vaccinations**: Calculate the percentage of the population that has received at least one COVID-19 vaccine.
- **Using CTE and Temporary Table**: Perform calculations on the percentage of people vaccinated using CTEs and temporary tables.

#### 5. Creating Views for Visualization

- **PercentPopulationVaccinated**: Store data for the percentage of the population vaccinated.
- **GlobalCovicImpact**: Store global impact metrics.
- **TotalDeathCount**: Store continent-wise death count.

### How to Use

#### 1. Setup Database

- Ensure you have a database named `PortfolioProject` with tables `CovidDeaths` and `CovidVaccinations`.

#### 2. Run SQL Scripts

- Execute the SQL scripts in the provided order to perform data exploration and create views for visualization.

### SQL Techniques Used

- **Joins**: To combine data from `CovidDeaths` and `CovidVaccinations`.
- **Common Table Expressions (CTEs)**: For organizing and simplifying complex queries.
- **Temporary Tables**: For storing intermediate results.
- **Window Functions**: For cumulative calculations such as rolling sums.
- **Aggregate Functions**: For summarizing data, such as `MAX` and `SUM`.
- **Views**: For creating reusable query results.
- **Data Type Conversion**: For ensuring accurate calculations and comparisons.

### Conclusion

This project demonstrates the use of various SQL techniques to explore and analyze COVID-19 data. The insights derived from these queries can help in understanding the spread and impact of the pandemic across different regions.
