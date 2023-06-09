-- 1. How many rows are in the names table?

-- SELECT *
-- FROM names;

-- Answer: 1,957,046

-- 2. How many total registered people appear in the dataset?

-- SELECT SUM(num_registered)
-- FROM names;

-- Answer: 351,653,025

-- 3. Which name had the most appearances in a single year in the dataset?

-- SELECT name, num_registered, year
-- FROM names
-- ORDER BY num_registered DESC;

-- ANSWER: Linda / 99689 / 1947

-- 4. What range of years are included?

-- SELECT MIN(year), MAX (year)
-- FROM names;

-- ANSWER: 1880 and 2018

-- 5. What year has the largest number of registrations?

-- SELECT year, SUM(num_registered) AS total_registered
-- FROM names
-- GROUP BY year
-- ORDER BY total_registered DESC;

-- ANSWER: 1957 / 4,200,022

-- 6. How many different (distinct) names are contained in the dataset?

-- SELECT COUNT(DISTINCT name)
-- FROM names;

-- ANSWER: 98,400

-- 7. Are there more males or more females registered?

-- SELECT gender, COUNT(gender) AS gender_count
-- FROM names
-- GROUP by gender;

-- ANSWER: Female, w/1,156,527 v. 800,519 Males

-- 8. What are the most popular male and female names overall (i.e., the most total registrations)?

-- SELECT name, gender, SUM(num_registered) AS register_count
-- FROM names
-- GROUP BY name, gender
-- ORDER BY register_count DESC;

-- Male = James(5,164,280) / Female = Mary(4,125,765)

-- 9. What are the most popular boy and girl names of the first decade of the 2000s (2000 - 2009)?

-- SELECT name, gender, SUM(num_registered) AS register_count
-- FROM names
-- WHERE year BETWEEN 2000 AND 2009
-- GROUP BY name, gender
-- ORDER BY register_count DESC;

-- Male = Jacob (273,844) / Female = Emily (223,690)

-- 10. Which year had the most variety in names (i.e. had the most distinct names)?

-- SELECT year, COUNT(DISTINCT name) AS unique_name_count
-- FROM names
-- GROUP BY year
-- ORDER BY unique_name_count DESC;

-- ANSWER: 2008 / 32,518

-- 11. What is the most popular name for a girl that starts with the letter X?

-- SELECT name, SUM(num_registered) AS reg_count
-- FROM names
-- WHERE name LIKE 'X%'
-- 	AND gender = 'F'
-- GROUP BY name
-- ORDER BY reg_count DESC;

-- ANSWER: Ximena (26,145)

-- 12. How many distinct names appear that start with a 'Q', but whose second letter is not 'u'?

-- SELECT COUNT(DISTINCT name)
-- FROM names
-- WHERE name LIKE 'Q%'
-- 	AND name NOT LIKE '_u%';
	
-- ANSWER: 46

-- 13. Which is the more popular spelling between "Stephen" and "Steven"? Use a single query to answer this question.

-- SELECT name, SUM(num_registered) as name_count
-- FROM names
-- WHERE name = 'Stephen'
-- 	OR name = 'Steven'
-- GROUP BY name
-- ORDER BY name_count DESC;

-- ANSWER: Steven w/1,286,951 vs. Stephen w/860,972

-- 14. What percentage of names are "unisex" - that is what percentage of names have been used both for boys and for girls?

SELECT name, COUNT(DISTINCT name) AS distinct_name_count, gender
FROM names
GROUP by gender

-- There are 98,400 distinct names.