SELECT min("weight") --минимальный вес
FROM "users";

SELECT avg("height") --средний рост 
FROM "users";

SELECT avg("weight") AS "Average weight", 
"is_male"
FROM "users"
GROUP BY "is_male";

SELECT count("id"), 
"is_male"
FROM "users"
WHERE "is_male"=true
GROUP BY "is_male";

SELECT count("id"),
EXTRACT('year' FROM "birthday")
FROM "users"
WHERE EXTRACT('year' FROM "birthday")=1982
GROUP BY EXTRACT('year' FROM "birthday");

SELECT sum("weight"), "first_name"
FROM "users";
WHERE "first_name"='Anna'
GROUP BY "first_name";

SELECT count("id"), "last_name"
FROM "users";
WHERE "last_name" IN ('Andersen', 'Anderson', 'Musk')
GROUP BY "last_name";