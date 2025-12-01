-- Data cleaning

select *
from layoffs;

-- staging the database so that the real raw data is available in the database all the time
-- 1. Remove duplicates
-- 2. Standardize the dat
-- 3. Null values or blank values
-- 4. Remove any columns

create table layoffs_staging
like layoffs; -- copying the data(column name only) of layoffs table into the layoff_staging table in case we need it later

select * 
from layoffs_staging;

insert layoffs_staging
select *
from layoffs;

select *
from layoffs_staging;

-- removing the duplicates

select *,
row_number() over(partition by company, industry, total_laid_off, percentage_laid_off, `date`)
as row_num
-- since date is a keyword in mysql so it's easier if we just include it within the backtick
from layoffs_staging;
-- It gives the value 1 for the unique row and 2 and vice versa for duplicate values

with duplicate_cte as 
(
select *,
row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, `date`
,stage, country, funds_raised_millions)
as row_num
from layoffs_staging
)
select *
from duplicate_cte
where row_num > 1;

-- checking if the values are actually duplicates or not
select *
from layoffs_staging
where company = 'Oda'; -- found out that those rows are not exactly duplicates (not all the columns)
-- so we have to partition all the column

-- from layoffs_staging copying to the clipboard, and then creating the statement i.e pasting it
-- creating new table but using different way, that's all
CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select *
from layoffs_staging2;

insert into layoffs_staging2
select *,
row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, `date`
,stage, country, funds_raised_millions)
as row_num
from layoffs_staging;

select * 
from layoffs_staging2
where row_num >1;

-- deleting
delete 
from layoffs_staging2
where row_num > 1;

select * 
from layoffs_staging2
where row_num >1;

select *
from layoffs_staging2;

-- standardizing data
-- like there is a space at the start of Included Health in a company column which weare gonna remove

select company, trim(company)
from layoffs_staging2;

update layoffs_staging2
set company = trim(company);

-- standardizing the industry column
select distinct industry 
from layoffs_staging2
order by 1;

-- there is a null value and blank space in that column and some refer to same industry like crypto, crypto currrency and cryptocurrency
select *
from layoffs_staging2
where industry like 'Crypto%';

update layoffs_staging2
set industry = 'Crypto'
where industry like 'Crypto%';

select distinct industry
from layoffs_staging2;

select distinct country
from layoffs_staging2;

