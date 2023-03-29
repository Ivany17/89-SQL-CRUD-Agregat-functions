CREATE TABLE "team"(
    "id" bigserial PRIMARY KEY,
    "name" VARCHAR(256) NOT NULL CHECK ("name" != '')
);

CREATE TABLE "coach"(
    "id" bigserial PRIMARY KEY,
    "name" VARCHAR(256) NOT NULL CHECK ("name" != ''),
    "teamId" INT REFERENCES "team"("id")
);
ALTER TABLE "team"
ADD COLUMN "coachId" INT REFERENCES "coach"("id")

