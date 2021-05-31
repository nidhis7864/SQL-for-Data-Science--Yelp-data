--Part 1: Yelp Dataset Profiling and Understanding

CODE=>
Select *  (--to select all the columns in a table)
from Attribute   (--Table_name)

1. Profile the data by finding the total number of records for each of the tables below:
	
i. Attribute table = 10000
ii. Business table =  10000
iii. Category table = 10000
iv. Checkin table = 10000
v. elite_years table = 10000
vi. friend table = 10000
vii. hours table =  10000 
viii. photo table = 10000 
ix. review table = 10000 
x. tip table = 10000
xi. user table = 10000
	


2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

i. Business = 10000 (Primary key= id)
ii. Hours = 1562 (Foreign key = business_id)
iii. Category = 2643 (Foreign key = business_id)
iv. Attribute = 1115 (Foreign key = business_id)
v. Review = 8090 (Foreign key=business_id), -- with Primary Key= got the record-10000
vi. Checkin = 493 (Foreign key = business_id)
vii. Photo = 6493 (Foreign key = business_id) ,-- with Primary Key= got the record-10000
viii. Tip = 537 (Foreign key = user_id), 3979 if (Foreign key = business_id)
ix. User = 10000 (Primary key= id)
x. Friend = 11 (Foreign key = user_id)
xi. Elite_years = 2780 (Foreign key = user_id)


Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: no
	
	
	SQL code used to arrive at answer:
	   
		SELECT COUNT(*)
		FROM user
		WHERE id IS NULL OR 
		  name IS NULL OR 
		  review_count IS NULL OR 
		  yelping_since IS NULL OR
		  useful IS NULL OR 
		  funny IS NULL OR 
		  cool IS NULL OR 
		  fans IS NULL OR 
		  average_stars IS NULL OR 
		  compliment_hot IS NULL OR 
		  compliment_more IS NULL OR 
		  compliment_profile IS NULL OR 
		  compliment_cute IS NULL OR 
		  compliment_list IS NULL OR 
		  compliment_note IS NULL OR 
		  compliment_plain IS NULL OR 
		  compliment_cool IS NULL OR 
		  compliment_funny IS NULL OR 
		  compliment_writer IS NULL OR 
		  compliment_photos IS NULL 
	

	
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	i. Table: Review, Column: Stars
	
		min:		max:		avg:
		1            5           3.7082 
	
	ii. Table: Business, Column: Stars
	
		min:		max:		avg:
		1.0          5.0        3.6549 
	
	iii. Table: Tip, Column: Likes
	
		min:		max:		avg:
		0           2          0.0144 
	
	iv. Table: Checkin, Column: Count
	
		min:		max:		avg:
		1           53          1.9414 
	
	v. Table: User, Column: Review_count
	
		min:		max:		avg:
		0           2000        24.2995 


5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:
	SELECT city,SUM(review_count) AS rev_count
FROM business
GROUP BY city
ORDER BY rev_count DESC
	
	Copy and Paste the Result Below:
	     ----------------+-----------+
| city            | rev_count |
+-----------------+-----------+
| Las Vegas       |     82854 |
| Phoenix         |     34503 |
| Toronto         |     24113 |
| Scottsdale      |     20614 |
| Charlotte       |     12523 |
| Henderson       |     10871 |
| Tempe           |     10504 |
| Pittsburgh      |      9798 |
| Montréal        |      9448 |
| Chandler        |      8112 |
| Mesa            |      6875 |
| Gilbert         |      6380 |
| Cleveland       |      5593 |
| Madison         |      5265 |
| Glendale        |      4406 |
| Mississauga     |      3814 |
| Edinburgh       |      2792 |
| Peoria          |      2624 |
| North Las Vegas |      2438 |
| Markham         |      2352 |
| Champaign       |      2029 |
| Stuttgart       |      1849 |
| Surprise        |      1520 |
| Lakewood        |      1465 |
| Goodyear        |      1155 |
+-----------------+-----------+
(Output limit exceeded, 25 of 362 total rows shown)     

	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:
select stars, count(id) as number_of_businesses
from business
where city = 'Avon'
group by stars;

Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
+-------+----------------------+
| stars | number_of_businesses |
+-------+----------------------+
|   1.5 |                    1 |
|   2.5 |                    2 |
|   3.5 |                    3 |
|   4.0 |                    2 |
|   4.5 |                    1 |
|   5.0 |                    1 |
+-------+----------------------+

ii. Beachwood

SQL code used to arrive at answer:
select stars, count(id) as number_of_businesses
from business
where city = 'Beachwood'
group by stars

Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
+-------+----------------------+
| stars | number_of_businesses |
+-------+----------------------+
|   2.0 |                    1 |
|   2.5 |                    1 |
|   3.0 |                    2 |
|   3.5 |                    2 |
|   4.0 |                    1 |
|   4.5 |                    2 |
|   5.0 |                    5 |
+-------+----------------------+		


7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:
	select id,name, review_count
from user
group by name
order by review_count desc
limit 3
		
	Copy and Paste the Result Below:
	+------------------------+--------+--------------+
| id                     | name   | review_count |
+------------------------+--------+--------------+
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald |         2000 |
| -K2Tcgh2EKX6e6HqqIrBIQ | .Hon   |         1246 |
| -gokwePdbXjfS0iF7NsUGA | eric   |         1116 |
+------------------------+--------+--------------+	


8. Does posing more reviews correlate with more fans?

	Please explain your findings and interpretation of the results:
	not necessarily per the below query we can see Amy has the fan count of 503 with review_count as 609 only. On the other hand, Yuri has just 76 fans with reviews over 1339. We need to consider other factors as well.

	SQL Query:
	select name, fans, review_count
from user
order by fans desc, review_count

Result:
+-----------+------+--------------+
| name      | fans | review_count |
+-----------+------+--------------+
| Amy       |  503 |          609 |
| Mimi      |  497 |          968 |
| Harald    |  311 |         1153 |
| Gerald    |  253 |         2000 |
| Christine |  173 |          930 |
| Lisa      |  159 |          813 |
| Cat       |  133 |          377 |
| William   |  126 |         1215 |
| Fran      |  124 |          862 |
| Lissa     |  120 |          834 |
| Mark      |  115 |          861 |
| Tiffany   |  111 |          408 |
| bernice   |  105 |          255 |
| Roanna    |  104 |         1039 |
| Angela    |  101 |          694 |
| .Hon      |  101 |         1246 |
| Ben       |   96 |          307 |
| Linda     |   89 |          584 |
| Christina |   85 |          842 |
| Jessica   |   84 |          220 |
| Greg      |   81 |          408 |
| Nieves    |   80 |          178 |
| Sui       |   78 |          754 |
| Yuri      |   76 |         1339 |
| Koizumi   |   73 |          160 |
+-----------+------+--------------+
(Output limit exceeded, 25 of 10000 total rows shown)
	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer: "love" word has more reviews- 1780, while the "hate" one has -232.
	
	SQL code used to arrive at answer:

	select count(id)
from review
where text like '%love%'

	select count(id)
from review
where text like '%hate%'
	
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
	select  name, fans
from user
order by fans desc
limit 10
	
	Copy and Paste the Result Below:
+-----------+------+
| name      | fans |
+-----------+------+
| Amy       |  503 |
| Mimi      |  497 |
| Harald    |  311 |
| Gerald    |  253 |
| Christine |  173 |
| Lisa      |  159 |
| Cat       |  133 |
| William   |  126 |
| Fran      |  124 |
| Lissa     |  120 |
+-----------+------+
	
		

Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
	
i. Do the two groups you chose to analyze have a different distribution of hours?
- I picked city 'Charlotte' and category 'Shopping'.  YES- It seems with 3.5 star ratings, none of the shops open on Sunday and onsaturday for just 8 hours, while with 4.0 star ratings, the shop does open on Sunday for 9 hours while on Saturday for 10 hours just like any other days.

SQL Query:
select b.city, c.category, b.stars,h.hours
from business b
join category c
on b.id= c.business_id
join hours h
on b.id=h.business_id
where b.city= 'Charlotte' and c.category = 'Shopping' 
order by stars desc

Result:

+-----------+----------+-------+-----------------------+
| city      | category | stars | hours                 |
+-----------+----------+-------+-----------------------+
| Charlotte | Shopping |   4.0 | Monday|12:00-22:00    |
| Charlotte | Shopping |   4.0 | Tuesday|12:00-22:00   |
| Charlotte | Shopping |   4.0 | Friday|12:00-22:00    |
| Charlotte | Shopping |   4.0 | Wednesday|12:00-22:00 |
| Charlotte | Shopping |   4.0 | Thursday|12:00-22:00  |
| Charlotte | Shopping |   4.0 | Sunday|12:00-21:00    |
| Charlotte | Shopping |   4.0 | Saturday|12:00-22:00  |
| Charlotte | Shopping |   3.5 | Monday|9:00-19:00     |
| Charlotte | Shopping |   3.5 | Tuesday|9:00-19:00    |
| Charlotte | Shopping |   3.5 | Friday|9:00-19:00     |
| Charlotte | Shopping |   3.5 | Wednesday|9:00-19:00  |
| Charlotte | Shopping |   3.5 | Thursday|9:00-19:00   |
| Charlotte | Shopping |   3.5 | Saturday|9:00-17:00   |
| Charlotte | Shopping |   3.5 | Tuesday|10:00-18:00   |
| Charlotte | Shopping |   3.5 | Friday|10:00-18:00    |
| Charlotte | Shopping |   3.5 | Wednesday|10:00-18:00 |
| Charlotte | Shopping |   3.5 | Thursday|10:00-18:00  |
| Charlotte | Shopping |   3.5 | Saturday|10:00-15:00  |
+-----------+----------+-------+-----------------------

ii. Do the two groups you chose to analyze have a different number of reviews?
  YES. Per the result displayed the shops with 3.5 star ratings have 8 and 6 reviews, while with 4.0 star rating, it has 5 reviews

  SQL Query:
  select b.city, c.category, b.stars,b.review_count
from business b
join category c
on b.id= c.business_id
where b.city= 'Charlotte' and c.category = 'Shopping' 
order by stars desc

Result:

+-----------+----------+-------+--------------+
| city      | category | stars | review_count |
+-----------+----------+-------+--------------+
| Charlotte | Shopping |   4.0 |            5 |
| Charlotte | Shopping |   3.5 |            8 |
| Charlotte | Shopping |   3.5 |            6 |
+-----------+----------+-------+--------------+
         
iii. Are you able to infer anything from the location data provided between these two groups? Explain.
- Not Really, all have different addresses and postal code.

SQL code used for analysis:
select b.city, c.category, b.stars, b.address, b.postal_code
from business b
join category c
on b.id= c.business_id
where b.city= 'Charlotte' and c.category = 'Shopping' 

Result:
+-----------+----------+-------+-------------------------+-------------+
| city      | category | stars | address                 | postal_code |
+-----------+----------+-------+-------------------------+-------------+
| Charlotte | Shopping |   3.5 | 4821 South Blvd         | 28217       |
| Charlotte | Shopping |   4.0 | 9605 N Tryon St, Ste C  | 28262       |
| Charlotte | Shopping |   3.5 | 125 Remount Rd, Ste C-2 | 28203       |
+-----------+----------+-------+-------------------------+-------------+
		
		
2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1:
   The businesses that are open tend to have more reviews than ones that
		are closed on average.
		
			Open:   AVG(review_count) = 31.757
			Closed: AVG(review_count) = 23.198
         
ii. Difference 2:
      
		The average star rating is higher for businesses that are open than
		businesses that are closed.
	
			Open:   AVG(stars) = 3.679
			Closed: AVG(stars) = 3.520
	   
         
         
SQL code used for analysis:

	SELECT COUNT(DISTINCT(id)), AVG(review_count), SUM(review_count), AVG(stars), is_open
FROM business
GROUP BY is_open

Result:
+---------------------+-------------------+-------------------+---------------+---------+
| COUNT(DISTINCT(id)) | AVG(review_count) | SUM(review_count) |    AVG(stars) | is_open |
+---------------------+-------------------+-------------------+---------------+---------+
|                1520 |     23.1980263158 |             35261 | 3.52039473684 |       0 |
|                8480 |     31.7570754717 |            269300 | 3.67900943396 |       1 |
+---------------------+-------------------+-------------------+---------------+---------+

	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:
    - I chose to study the preference among different types of food on yelp. 
  
         
ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
    - -I will pick several types of food including “Chinese”,”Mexican”,”Korean”,”French”,”Italian”,”Japanese” and “Indian”, "Sandwiches".Then I will analyze their star ratings and number of reviews so that I can get some insights on which type of food is popular on yelp.

                  
iii. Output of your finished dataset:

+------------+----------------------+---------------+-------------------+-----------+
| category   | Number_Of_Resturants |    AVG(stars) | AVG(review_count) | city      |
+------------+----------------------+---------------+-------------------+-----------+
| Korean     |                    7 |           4.5 |               8.0 | Toronto   |
| Sandwiches |                   40 |        4.0875 |             160.2 | Las Vegas |
| French     |                   12 |           4.0 |     135.083333333 | Las Vegas |
| Chinese    |                   13 | 3.76923076923 |     423.230769231 | Las Vegas |
| Mexican    |                   28 |         3.625 |              73.0 | Edinburgh |
| Italian    |                   13 | 3.53846153846 |     78.2307692308 | Montréal  |
| Indian     |                    6 |           3.5 |              32.0 | Aurora    |
| Japanese   |                   20 |         3.475 |             22.85 | Toronto   |
+------------+----------------------+---------------+-------------------+-----------+
         
         
iv. Provide the SQL code you used to create your final dataset:

SELECT c.category,COUNT(b.name) AS Number_Of_Resturants,AVG(stars),AVG(review_count),b.city
FROM (business b INNER JOIN hours h ON b.id = h.business_id)
INNER JOIN category c ON c.business_id = b.id
WHERE c.category IN
("Chinese","Mexican","French","Italian","Korean","Japanese","Indian", "Sandwiches")
GROUP BY c.category
ORDER BY AVG(stars) DESC
