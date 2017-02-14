-- Write your queries here!
-- Who did Jon Stewart have on the Daily Show the most?
SELECT *
  FROM guests
  GROUP BY name
  ORDER BY COUNT(*) DESC LIMIT 1
  --- Fred Zakaria

--- What was the most popular profession of guest for each year Jon Stewart hosted the Daily Show?---
SELECT *
 FROM guests
 WHERE occupation = (SELECT occupation
	 FROM guests
	 GROUP BY occupation
	 ORDER BY COUNT(occupation) DESC LIMIT 1)
GROUP BY year
--- actor-----

----- Most popular profession overall----
SELECT *, COUNT(*)
FROM guests
GROUP BY occupation
ORDER BY COUNT(*) DESC LIMIT 1
---- actor------


---- How many people did Jon Stewart have on with the first name of Bill?----

SELECT COUNT(*),
FROM guests
WHERE name LIKE "%Bill%"
GROUP BY name

-------- 63--------------


---------What dates did Patrick Stewart appear on the show?---------
SELECT show_date
FROM guests
WHERE name = "Patrick Stewart"

---------"4/12/00" ---- "4/21/03" -----  "11/7/13"--------

------- Which year had the most guests?---------

SELECT year
FROM guests
GROUP BY year
ORDER BY COUNT(*) DESC LIMIT 1

----------------- 2000 -----------------------


---------- What was the most popular "Group" for each year Jon Stewart hosted? ---------


SELECT group_name
 FROM guests
 WHERE group_name = (SELECT group_name
	 FROM guests
	 GROUP BY group_name
	 ORDER BY COUNT(group_name) DESC LIMIT 1)
GROUP BY year

-------------------- ACTING -----------------------
