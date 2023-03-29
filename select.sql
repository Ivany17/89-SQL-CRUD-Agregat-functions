SELECT * FROM "users"; --выбрать всё

SELECT "first_name", "email", "height" FROM "users"; --выбрать что-то определенное

SELECT * FROM "users" WHERE "is_male"=true; --выбрать всех мужчин

SELECT * FROM "users" WHERE "id"%2=0 AND "is_male"=false; --выбрать всех женщин с четным id

SELECT * FROM "users" WHERE "first_name"='Julia'; --выбрать пользователя с определенным именем

SELECT * FROM "users" WHERE "first_name" IN ('Julia', 'Lia', 'Anna', 'Elon'); --выбрать несколько имен

SELECT * FROM "users" WHERE "id" BETWEEN 1400 AND 1700; --выбрать диапазон (между-включая)

SELECT "id", age("birthday"), "birthday" FROM "users" WHERE age("birthday") make_interval(40); --интервал 

SELECT * FROM "users" WHERE "is_male"=true AND age("birthday") BETWEEN make_interval(40) AND make_interval(50);

SELECT * FROM "users" WHERE "height">1.9;

SELECT "id", "birthday", "is_male" FROM "users" WHERE EXTRACT('month' from "birthday")=5 AND "is_male"=false;

SELECT "id", "birthday", "is_male" FROM "users" WHERE EXTRACT('day' from "birthday")=31;

SELECT * FROM "users" WHERE "is_male"=true LIMIT 10 OFFSET 10; --LIMIT - ограничение, OFFSET - это сколько нужно отступить от начала

