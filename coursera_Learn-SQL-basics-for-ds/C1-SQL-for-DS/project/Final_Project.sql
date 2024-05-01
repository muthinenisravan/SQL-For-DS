



/*
1.
Question 1
Can you find out the total milk production for 2023? Your manager wants this information for the yearly report.

What is the total milk production for 2023?
*/

SELECT SUM(Value) FROM milk_production mp where Year=2023;

/*
Question 2
Which states had cheese production greater than 100 million in April 2023? The Cheese Department wants to focus their marketing efforts there. 

How many states are there?
*/ 





/*
 * Q3:Your manager wants to know how coffee production has changed over the years. 

	What is the total value of coffee production for 2011?
 * 
 */

SELECT YEAR,SUM(VAlue) From coffee_production cp GROUP BY "Year" ;


/*
 * There's a meeting with the Honey Council next week. Find the average honey production for 2022 so you're prepared.
 * 
 * 
 * */



SELECT AVG(Value) FROM honey_production hp  WHERE  "Year"=2022;


/*
 * 
 * The State Relations team wants a list of all states names with their corresponding ANSI codes. Can you generate that list?

What is the State_ANSI code for Florida?
 * 
 * 
 * */


SELECT * FROM state_lookup sl WHERE State ='FLORIDA' ;




/*
 * Question 6
For a cross-commodity report, can you list all states with their cheese production values, even if they didn't produce any cheese in April of 2023?

What is the total for NEW JERSEY?
 * 
 */

SELECT sl.State , cp.YEAR, cp.Period, cp.Value
FROM state_lookup sl 
LEFT JOIN
(SELECT * FROM cheese_production WHERE "Year"=2023 AND Period='APR') as cp ON sl.State_ANSI = cp.State_ANSI ;


/*
 * 
 * Can you find the total yogurt production for states in the year 2022 which also have cheese production data from 2023? This will help the Dairy Division in their planning.
 * 
 * 377,839,000
793,256,000
 * */

SELECT SUM(Value) FROM
(SELECT * FROM yogurt_production yp where "Year"=2022);
INNER JOIN
(SELECT * FROM cheese_production cp where "Year"=2023) on yp.State_ANSI=cp.State_ANSI ;



/*
 * Question 8
List all states from state_lookup that are missing from milk_production in 2023.

How many states are there?


 */


SELECT COUNT(s.State) as Count
FROM state_lookup s
LEFT JOIN milk_production m ON s.State_ANSI = m.State_ANSI AND m.Year = 2023
WHERE m.State_ANSI IS NULL;


/*
 * List all states with their cheese production values, including states that didn't produce any cheese in April 2023.

Did Delaware produce any cheese in April 2023?
 */
 */



SELECT s.State, c.Value
FROM state_lookup s
LEFT JOIN cheese_production c ON s.State_ANSI = c.State_ANSI AND c.Year = 2023 AND c.Period = 'APR';

/*
 * 
Question 10
Find the average coffee production for all years where the honey production exceeded 1 million.
 */






