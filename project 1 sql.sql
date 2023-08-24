# qs 3.Run SQL command to see the structure of table
use ecommerce ;
select * from users_data;
describe users_data;

# qs 4.Run SQL command to select first 100 rows of the database
select * from users_data limit 100;

# 5. How many distinct values exist in table for field country and language
select count(distinct country),count(distinct language) from users_data;


# 6.Check whether male users are having maximum followers or female users.
select gender, max(socialNbFollowers) Followers from users_data group by gender;

/* 7. Calculate the total users those
 Uses Profile Picture in their Profile
 Uses Application for Ecommerce platform
 Uses Android app
 Uses ios app */
 # a. Uses Profile Picture in their Profile
 select hasProfilePicture Profile_Pic, count(hasProfilePicture) Total_Pic from users_data where hasProfilePicture = 'True';
 #b .Uses Application for Ecommerce platform
select count(hasAnyApp) Total_Application from users_data where hasAnyApp ='True';
 #c.Uses Android app 
 select count(*) hasAndroidApp from users_data;
 # d.Uses Android app 
 select count(hasIosApp) from users_data;
 
 
 /* 8.Calculate the total number of buyers for each country and sort
 the result in descending order of total number of buyers. (Hint: consider only those users having at least 1 product bought.)*/
 select country, sum(productsBought) from users_data where productsBought >= 1 group by country
 order by productsBought DESC ;
 
 
 /* 9.Calculate the total number of sellers for each country and sort the result in ascending order of total number of sellers. 
 (Hint: consider only those users having at least 1 product sold.)*/
 select country, sum(productsSold) total_numberof_sellers from users_data where productsSold >=1 
 group by country
 order by productsSold;
 
 # 10.Display name of top 10 countries having maximum products pass rate. 
 select distinct country, sum(productsPassRate) from users_data 
 group by country 
 order by sum(productsPassRate) desc limit 10;
 
 # 11.Calculate the number of users on an ecommerce platform for different language choices.
 select type, language, count(language) from users_data group by language;
 
 # 12.Check the choice of female users about putting the product in a wishlist or to like socially on an ecommerce platform.
 select sum(productsWished), sum(socialProductsLiked),gender from users_data  where gender = 'F';
 
 # 13. Check the choice of male users about being seller or buyer. (Hint: use UNION to solve this question.)
 SELECT SUM(productsSold),SUM(productsBought) FROM users_data WHERE gender='M';
 
 # 14. Which country is having maximum number of buyers?
 select country, sum(productsBought) from users_data group by country order by sum(productsBought) DESC;
 
 # 15. List the name of 10 countries having zero number of sellers.
 select country, productsSold from users_data where productsSold = 0 group by country limit 10;
 
 # 16. Display record of top 110 users who have used ecommerce platform recently.
 select * from users_data where daysSinceLastLogin order by daysSinceLastLogin limit 110;
 
 # 17. Calculate the number of female users those who have not logged in since last 100 days.
 select count(daysSinceLastLogin) from users_data
 where daysSinceLastLogin >= 100 and gender = 'F';
 
 # 18. Display the number of female users of each country at ecommerce platform.
 select country, count(gender), gender from users_data where gender = 'F' group by country;
 
 # 19. Display the number of male users of each country at ecommerce platform.
 select country, count(*) gender from users_data where gender = 'M' group by country;
 
 #20. Calculate the average number of products sold and bought on ecommerce platform by male users for each country.
 select country, avg(productsSold), avg(productsBought) from users_data where gender = 'M' group by country;