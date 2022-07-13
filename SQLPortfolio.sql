SELECT *
FROM CovidDeaths$
WHERE continent is not null
ORDER BY 3,4

SELECT location, date,  total_cases, new_cases, total_deaths, population
FROM CovidDeaths$
order by 1,2

--Looking at Total Cases vs Total Deaths
--Shows likelihood of dying once you have contracted Covid
SELECT location, date,  total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM CovidDeaths$
WHERE location like '%states%'
order by 1,2


--Looking at total cases vs population
--Shows what percentage of population got Covid
SELECT location, date, population, total_cases,  (total_cases/population)*100 as PercentPopulationInfected
FROM CovidDeaths$
WHERE location like '%states%'
order by 1,2

--Looking at countries with Highest infection rate compared to population
SELECT location, population, MAX(total_cases) as HighestInfectionCount,  MAX((total_cases/population))*100 as PercentPopulationInfected
FROM CovidDeaths$
--WHERE location like '%states%'
GROUP by Location, Population
order by PercentPopulationInfected desc


--Showing countries with highest death count per population
SELECT location, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM CovidDeaths$
WHERE continent is not null
GROUP by Location
order by TotalDeathCount desc

--Lets break things down by continent
SELECT continent, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM CovidDeaths$
WHERE continent is not null
GROUP by continent
order by TotalDeathCount desc

--Showing continent with the highest death count
SELECT continent, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM CovidDeaths$
WHERE continent is not null
GROUP by continent
order by TotalDeathCount desc


--Looking at Total Population vs Vaccination
SELECT *
FROM CovidDeaths$ 
JOIN CovidVaccination$ 
on  CovidDeaths$.location = CovidVaccination$.location
   and CovidDeaths$.date = CovidVaccination$.date


SELECT CovidDeaths$.continent, CovidDeaths$.location, CovidDeaths$.date, CovidDeaths$.population, 
FROM CovidDeaths$ 
JOIN CovidVaccination$  
on CovidDeaths$.location = CovidVaccination$.location
   and CovidDeaths$.date = CovidVaccination$.date
where CovidDeaths$.continent is not null
order by 1,2




