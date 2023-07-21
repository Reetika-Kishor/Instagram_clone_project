 
--Data Analysis

--Q1) Find top 10 oldest users.

SELECT * FROM users
ORDER BY created_at DESC
LIMIT 10


--Q2) On which date we recieved maximum registration?

SELECT EXTRACT( DAY FROM created_at) AS day,
COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC
LIMIT 1;


--Q3) Find the  users who have'nt uploaded any photos.

SELECT username FROM users
LEFT JOIN photos
ON users.id = photos.user_id
WHERE photos.id IS NULL; 

--
4. List  names of the users with the most popular photo .

SELECT 
    username,
    photos.id,
    photos.image_url, 
    COUNT(*) AS total
FROM photos
INNER JOIN likes
    ON likes.photo_id = photos.id
INNER JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;

-- 5. Calculate average number of photos per user

SELECT (SELECT Count(*) 
        FROM   photos) / (SELECT Count(*) 
                          FROM   users) AS avg; 
						  
-- 6. Find the five most popular hashtags

SELECT tags.tag_name, 
       Count(*) AS total 
FROM   photo_tags 
       JOIN tags 
         ON photo_tags.tag_id = tags.id 
GROUP  BY tags.id 
ORDER  BY total DESC 
LIMIT  5; 

-- 7. Finding the bots - the users who have liked every single photo

SELECT username, 
       Count(*) AS num_likes 
FROM   users 
       INNER JOIN likes 
               ON users.id = likes.user_id 
GROUP  BY likes.user_id 
HAVING num_likes = (SELECT Count(*) 
                    FROM   photos);
					
					




 
