/*
*  Show the population per continent
*  Database: World
*  Table: Country
*/

SELECT distinct 
    continent,
    sum(population) over (
        partition by continent 
    ) as "Cumulative population"
from country 
order by continent

/*
*  To the previous query add on the ability to calculate the percentage of the world population
*  What that means is that you will divide the population of that continent by the total population and multiply by 100 to get a percentage.
*  Make sure you convert the population numbers to float using `population::float` otherwise you may see zero pop up
*  Try to use CONCAT AND ROUND to make the data look pretty
*
*  Database: World
*  Table: Country
*/

SELECT 
distinct
    continent,
    sum(population) over (
        partition by continent 
    ) as "Continent population",
    sum(population) over() as "World population",
    concat(
        round(
            (sum(population::bigint) over (partition by continent) / sum(population::bigint) over () ) * 100,
            2
        )
        , '%') as "Percentage population"
from country 
order by continent;

SELECT
  DISTINCT continent,
  SUM(population) OVER w1 as"continent population",
  CONCAT( 
      ROUND( 
          ( 
            SUM( population::float4 ) OVER w1 / 
            SUM( population::float4 ) OVER() 
          ) * 100    
      ),'%' ) as "percentage of population"
FROM country 
WINDOW w1 AS( PARTITION BY continent );


/*
*  Count the number of towns per region
*
*  Database: France
*  Table: Regions (Join + Window function)
*/

SELECT distinct
    r.id as "Region Id",
    r.name as "Region name",
    count(t.name) over (
        PARTITION by r.name
    ) as "Total towns"
from towns as t 
join departments as d on (t.department = d.code)
join regions as r on (d.region = r.code)
order by r.id;
