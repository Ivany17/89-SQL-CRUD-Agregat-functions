ALTER TABLE "users"
ADD COLUMN "weight" INT CHECK ("weight">=0 AND "weight"<=250);

SELECT * FROM "users";
UPDATE "users" SET "weight" = ("height"-1)*100;
UPDATE "users" SET "weight" 55 WHERE "first_name"='Anna';

DELETE FROM "users" WHERE "id"=2112; --удаляет юзера с "id"=2112

UPDATE "users" SET "weight" = 55 WHERE "first_name"='Anna' RETURNING "id", "weight", "email", "height";

SELECT "id" AS "Number", concat("first_name", ' ', "last_name") AS "Full name", "email" FROM "users" WHERE length(concat("first_name", ' ', "last_name"))=9 LIMIT 10;

SELECT *
FROM (
    SELECT "id" AS "Number",
    concat("first_name", ' ', "last_name") AS "Full name",
    "email" 
    FROM "users"
    ) AS "tableFN"
WHERE "tableFN"."length"=9
LIMIT 10;