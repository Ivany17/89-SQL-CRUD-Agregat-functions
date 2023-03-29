DROP TABLE "users";
CREATE TABLE "users" {
    "id" bigserial PRIMARY KEY,
    "first_name" VARCHAR(64) NOT NULL CONSTRAINT "check_first_name" CHECK ("first_name" != ''),
    "last_name" VARCHAR(64) NOT NULL CHECK ("last_name" != ''),
    "email" VARCHAR(256) NOT NULL CHECK ("email" != ''),
    "is_male" BOOLEAN NOT NULL,
    "birthday" date NOT NULL CHECK ("birthday" < CURRENT_DATE),
    "height" NUMERIC(3,2) NOT NULL CHECK ("height" > 1.00 AND "height" < 2.50)
};

INSERT INTO "users" ("first_name", "last_name", "email", "is_male", "birthday", "height")
VALUES 
('Elon', 'Musk', 'musk@gmail.com', true, '1971-06-28', 1.88),
('Nazar', 'Ptushch', 'ptushch@gmail.com', true, '1998-09-12', 1.79),
('Ann', 'Lezed', 'lezed@gmail.com', false, '2001-07-28', 1.56);

ALTER TABLE "users"
AND UNIQUE ("email")

DROP TABLE "products";
CREATE TABLE "products"(
    "id" bigserial PRIMARY KEY,
    "name" VARCHAR(256) NOT NULL CHECK ("name" != ''),
    "category" VARCHAR(256) NOT NULL CHECK ("name" != ''),
    "price" DECIMAL(16, 2) CHECK ("price" > 0),
    "quantity" SMALLINT CHECK ("quantity" >= 0),
    CONSTRAINT "products_unique_name" UNIQUE ("name", "category")
);
DROP TABLE "orders";
CREATE TABLE "orders"(
    "id" bigserial PRIMARY KEY,
    "customerId" INT REFERENCES "users"("id"),
    "createdAt" TIMESTAMP NOT NULL DEFAULT current_timestamp
);

CREATE TABLE "products_to_orders"(
    "productId" INT REFERENCES "products"("id"),
    "orderId" INT REFERENCES "orders"("id"),
    "quantity" SMALLINT CHECK ("quantity" >= 0),
    PRIMARY KEY ("productId", "orderId")
);

INSERT INTO "products"("name", "category", "price", "quantity")
VALUES ('Sony', 'Phone', 10.10, 5),
('Sony2', 'Phone', 10.10, 5),
('Sony', 'Photo', 10.10, 5),

INSERT INTO "orders"("customerId")
VALUES (1), (2), (1);

INSERT INTO "products_to_orders"("productId", "orderId", "quantity")
VALUES (1,1,1), (2,2,1), (3,1,1);


DROP TABLE "chats";
CREATE TABLE "chats"(
    "id" bigserial PRIMARY KEY,
    "name" VARCHAR(256) NOT NULL CHECK ("name" != ''),
    "ownerId" INT REFERENCES "users"("id"),
    "createdAt" TIMESTAMP NOT NULL DEFAULT current_timestamp
);

INSERT INTO "chats"("name", "ownerId")
VALUES('js', 2), ('db', 1)

CREATE TABLE "user_to_chat"(
    "userId" INT REFERENCES "users"("id"),
    "chatId" INT REFERENCES "chats"("id"),
    PRIMARY KEY ("userId", "chatId")
);
INSERT INTO "user_to_chat"()
VALUES (3, 1), (3, 2), (2, 1), (1, 2);

CREATE TABLE "messages"(
    "id" bigserial PRIMARY KEY,
    "body" VARCHAR(256) NOT NULL CHECK ("body" != ''),
    "createdAt" TIMESTAMP NOT NULL DEFAULT current_timestamp,
    "userId" INT,
    "chatId" INT,
    FOREIGN KEY ("userId", "chatId") REFERENCES "user_to_chat"("userId", "chatId")
);
INSERT INTO "messages"("body", "userId", "chatId")
VALUES ('abcd', 3,1), ('efgh', 3,2), ('ijkl', 2,1), ('mnop', 1,2);
