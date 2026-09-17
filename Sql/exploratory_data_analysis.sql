-- LAYOFFS DATA ANALYSIS - EXPLORATORY DATA ANALYSIS
-- Database: MySQL

-- 1. Maximum Layoffs
-- 2. 100% Layoffs
-- 3. Layoffs by Company
-- 4. Layoffs by Industry
-- 5. Layoffs by Year
-- 6. Layoffs by Stage
-- 7. Monthly Layoffs
-- 8. Rolling Total
-- 9. Company-wise Yearly Analysis
-- 10. Top 5 Companies by Year

select* from layoffs_2_3;

select max(total_laid_off),max(percentage_laid_off)
from layoffs_2_3;

select* 
from layoffs_2_3
where percentage_laid_off = 1
order by funds_raised_millions desc;

select company, sum(total_laid_off)
from layoffs_2_3
group by company
order by 2 desc;

select min(`date`), max(`date`)
from layoffs_2_3;  

select industry, sum(total_laid_off)
from layoffs_2_3
group by industry
order by 2 desc;

select year(`date`), sum(total_laid_off)
from layoffs_2_3
group by year(`date`)
order by 1 desc;

select stage, sum(total_laid_off)
from layoffs_2_3
group by stage
order by 2 desc;

select company, sum(percentage_laid_off)
from layoffs_2_3
group by company
order by 2 desc;

select substring(`date`,1,7) as `month`,sum(total_laid_off)
from layoffs_2_3
where substring(`date`,1,7) is not null
group by `month`
order by 1 asc;

with rolling_total as
(
select substring(`date`,1,7) as `month`,sum(total_laid_off) as total_off
from layoffs_2_3
where substring(`date`,1,7) is not null
group by `month`
order by 1 asc
)
select `month`,total_off,
sum(total_off) over(order by `month`) as rolling_total
from rolling_total;

select company,year(`date`), sum(total_laid_off)
from layoffs_2_3
group by company,year(`date`)
order by 3 asc;

with company_year (company, years,total_laid_off) as
(
select company,year(`date`), sum(total_laid_off)
from layoffs_2_3
group by company,year(`date`)
), company_year_rank as
(select* ,dense_rank() over (partition by years order by total_laid_off desc) as ranking
from company_year
where years is not null
)
select*
from company_year_rank
where ranking <= 5
;

SELECT *
FROM layoffs_2_3
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

SELECT industry, SUM(total_laid_off)
FROM layoffs_2_3
GROUP BY industry
ORDER BY 2 DESC;









