-- Data Cleaning

-- 1. Remove Duplicates
-- 2. Standardize the data
-- 3. Null Values or blank values
-- 4. Remove any columns or rows

select*
from layoffs;
drop table layoffs;

create  table layoffs_2
like layoffs;
insert layoffs_2
select*
from layoffs;

select * from layoffs_2;

with duplicate_cte as
(
select *,row_number() over(
partition by company,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions)
as row_num
from layoffs_2
) select *
from duplicate_cte
where row_num > 1;

select * from layoffs_2
where company = 'Beat';

CREATE TABLE `layoffs_2_3` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select * from layoffs_2_3;

insert into layoffs_2_3
select *,row_number() over(
partition by company,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions)
as row_num
from layoffs_2;

select * from layoffs_2_3
where row_num > 1;

delete 
from layoffs_2_3
where row_num > 1;

select *
from layoffs_2_3;

-- Standardizing data

select company,trim(company)
from layoffs_2_3; 

update layoffs_2_3
set company = trim(company);

update layoffs_2_3
set industry = 'crypto'
where industry like 'crypto%';

update layoffs_2_3
set country = trim(trailing '.' from country)
where country like 'United states%'; 
 select `date`,
 str_to_date(`date`, '%m/%d/%Y')
 from layoffs_2_3;
 
 update layoffs_2_3
 set `date` =  str_to_date(`date`, '%m/%d/%Y');
 
 alter table layoffs_2_3
 modify column `date` date;
 
 select *
 from layoffs_2_3 t1
 join layoffs_2_3 t2
     on t1.company = t2.company
where (t1.industry is null or t1.industry = '')
and t2.industry is not null;

update layoffs_2_3 t1   
join layoffs_2_3 t2
     on t1.company = t2.company
set t1.industry = t2.industry
where t1.industry is null 
and t2.industry is not null;

update layoffs_2_3
set industry = null
where industry = '';

delete
from layoffs_2_3
where total_laid_off is null
and percentage_laid_off is null;

alter table layoffs_2_3
drop column row_num;

select* from layoffs_2_3;



























