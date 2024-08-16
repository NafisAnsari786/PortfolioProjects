/* Covid 19 Data Exploration

Skills used: Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types

*/ 

SELECT * 
FROM [PortfolioProject]..[CovidDeaths]
WHERE continent IS NOT NULL
ORDER BY 3,4

SELECT * FROM PortfolioProject..CovidVaccinations 
WHERE continent IS NOT NULL
ORDER BY 3,4

--Select Data that we are going to work with 

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 1,2

--Total Cases VS  Total Deaths
-- Shows the likelyhood of dying if you contract covid in your country 

SELECT location, date, total_cases, total_deaths, ROUND((CAST(total_deaths AS float)/CAST(total_cases AS float))*100, 2)AS DeathPercentage
FROM PortfolioProject..CovidDeaths
WHERE location LIKE '%INDIA%'
AND continent IS NOT NULL
ORDER BY 1,2


-- Total Cases vs Population
-- Shows what percentage of population infected with Covid

SELECT location, date, total_cases, population, ROUND((CAST(total_cases AS float)/population)*100, 2) AS PercentPopulationInfected
FROM PortfolioProject..CovidDeaths
--WHERE location LIKE '%INDIA%'
--AND continent IS NOT NULL
ORDER BY 1,2


-- Countries with Highest Infection Rate compared to Population

SELECT location, population, MAX(total_cases) AS HighestInfectionCount, ROUND(MAX(total_cases/population)*100, 2) AS PercentPopulationInfected
FROM PortfolioProject..CovidDeaths
--WHERE location LIKE '%INDIA%'
GROUP BY LOCATION, population
ORDER BY PercentPopulationInfected DESC


-- Countries with Highest Death Count per Population

Select Location, MAX(cast(Total_deaths as float)) as TotalDeathCount
From PortfolioProject..CovidDeaths
WHERE continent is not null 
Group by Location
order by TotalDeathCount desc


-- BREAKING THINGS DOWN BY CONTINENT
-- Showing contintents with the highest death count per population

Select location AS Continent, MAX(cast(Total_deaths as float)) as TotalDeathCount
From PortfolioProject..CovidDeaths
WHERE continent is null 
Group by location
order by TotalDeathCount desc


-- GLOBAL NUMBERS

SELECT location, TotalCases, TotalDeaths, DeathPercentage
FROM (
  SELECT location, MAX(cast(total_cases as float)) as TotalCases, MAX(CAST(total_deaths AS FLOAT)) AS TotalDeaths,
  ROUND(MAX(CAST(total_deaths AS FLOAT))/MAX(cast(total_cases as float))*100,2) as DeathPercentage
  FROM PortfolioProject..CovidDeaths
  GROUP BY location
) AS world_totals
WHERE location = 'World';


-- Total Population vs Vaccinations
-- Shows Percentage of Population that has recieved at least one Covid Vaccine

SELECT  CD.continent, CD.location, CD.date, CD.population, CV.new_vaccinations,
SUM(CONVERT(bigint, CV.NEW_VACCINATIONS)) OVER (PARTITION BY CD.LOCATION ORDER BY CD.LOCATION, CD.DATE) AS RollingPeopleVaccinated
--,(RollingPeopleVaccinated/population)*100
FROM PortfolioProject..CovidDeaths AS CD
INNER JOIN PortfolioProject..CovidVaccinations AS CV
	ON CD.LOCATION=CV.LOCATION
	AND CD.DATE=CV.DATE
WHERE CD.continent IS NOT NULL
ORDER BY 2,3


--Using CTE to perform Calculation on Partition By in the previous query

WITH PoplvsVacc (CONTINENT, LOCATION, DATE, POPULATION, NEW_VACCINATIONS, RollingPeopleVaccinated)
AS 
( SELECT  CD.continent, CD.location, CD.date, CD.population, CV.new_vaccinations,
SUM(CONVERT(BIGINT, CV.new_vaccinations)) OVER (PARTITION BY CD.LOCATION ORDER BY CD.LOCATION, CD.DATE) AS RollingPeopleVaccinated
FROM PortfolioProject..CovidDeaths AS CD
INNER JOIN PortfolioProject..CovidVaccinations AS CV
	ON CD.location=CV.location
	AND CD.date=CV.date
WHERE CD.continent IS NOT NULL
)
SELECT *,(RollingPeopleVaccinated/POPULATION)*100 AS PercentPeopleVaccinated
FROM PoplvsVacc


--Using Temp table to perform calculation on Partition By in the previous query

DROP TABLE IF EXISTS #PercentPopulationVaccinated
CREATE TABLE #PercentPopulationVaccinated
(
continent NVARCHAR(255),
location NVARCHAR(255),
date DATETIME,
population NUMERIC,
new_vaccinations NUMERIC,
RollingPeopleVaccinated NUMERIC
)


INSERT INTO #PercentPopulationVaccinated
SELECT  CD.continent, CD.location, CD.date, CD.population, CV.new_vaccinations,
SUM(CONVERT(bigint, CV.NEW_VACCINATIONS)) OVER (PARTITION BY CD.LOCATION ORDER BY CD.LOCATION, CD.DATE) AS RollingPeopleVaccinated
--,(RollingPeopleVaccinated/population)*100
FROM PortfolioProject..CovidDeaths AS CD
INNER JOIN PortfolioProject..CovidVaccinations AS CV
	ON CD.LOCATION=CV.LOCATION
	AND CD.DATE=CV.DATE
WHERE CD.continent IS NOT NULL

SELECT *,(RollingPeopleVaccinated/POPULATION)*100 AS PercentPeopleVaccinated
FROM #PercentPopulationVaccinated


-- Creating View to store data for later visualizations
-- View for PercentPopulationVaccinated

USE PortfolioProject;   --To explicitly specify the database, where the view must be created
GO

CREATE VIEW PercentPopulationVaccinated AS
SELECT  CD.continent, CD.location, CD.date, CD.population, CV.new_vaccinations,
SUM(CONVERT(bigint, CV.NEW_VACCINATIONS)) OVER (PARTITION BY CD.LOCATION ORDER BY CD.LOCATION, CD.DATE) AS RollingPeopleVaccinated
--,(RollingPeopleVaccinated/population)*100
FROM PortfolioProject..CovidDeaths AS CD
INNER JOIN PortfolioProject..CovidVaccinations AS CV
	ON CD.LOCATION=CV.LOCATION
	AND CD.DATE=CV.DATE
WHERE CD.continent IS NOT NULL

SELECT * FROM PercentPopulationVaccinated


--View for Global Numbers

CREATE VIEW GlobalCovicImpact AS
SELECT location, TotalCases, TotalDeaths, DeathPercentage
FROM (
  SELECT location, MAX(cast(total_cases as float)) as TotalCases, MAX(CAST(total_deaths AS FLOAT)) AS TotalDeaths,
  ROUND(MAX(CAST(total_deaths AS FLOAT))/MAX(cast(total_cases as float))*100,2) as DeathPercentage
  FROM PortfolioProject..CovidDeaths
  GROUP BY location
) AS world_totals
WHERE location = 'World';

SELECT * FROM GlobalCovicImpact


-- View for contintents with the highest death count per population

CREATE VIEW TotalDeathCount AS

SELECT location AS Continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
Where continent is null 
Group by location

SELECT * FROM TotalDeathCount


