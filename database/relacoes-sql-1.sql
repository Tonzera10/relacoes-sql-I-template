-- Active: 1679955875088@@127.0.0.1@3306


-- Práticas 1 e 2
DROP TABLE phones;
DROP TABLE users;

CREATE TABLE phones(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    phone_number TEXT UNIQUE NOT NULL,
    user_id TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
);

INSERT INTO users (id, name, email, password) 
VALUES
("243325", "Everton", 'everton@gmail.com', '12345'),
("876835", "Notreve", 'Notreve@gmail.com', '12345');

INSERT INTO phones (id, phone_number, user_id)
VALUES
('1', "(51)98743-000", "243325"),
('2', "(51)98743-430", "243325"),
('3', "(51)98743-760", "876835");

SELECT * FROM phones
INNER JOIN users
ON phones.user_id = users.id;

SELECT * FROM users
INNER JOIN phones
ON phones.user_id = users.id;

--Prática 3

CREATE TABLE licenses (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    register_number TEXT UNIQUE NOT NULL,
    category TEXT NOT NULL 
);

CREATE TABLE drivers (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    license_id TEXT UNIQUE NOT NULL,
    FOREIGN KEY (license_id) REFERENCES licenses(id)
);

INSERT INTO drivers (id, name, email, password, license_id)
VALUES 
("32124", "Rogerinho", "rogerinhodoingá@email.com", "123456", "412412412412"),
("321324", "Renan", "renandasilva@email.com",  "123456","1484811616151"),
("124341", "Maurilio", "mauriliodosanjos@email.com", "123456", "848116.49484"),
("57612", "Julinho", "julinhodavan@email.com",  "123456","818616161611");

INSERT INTO licenses (id, register_number, category)
VALUES 
("412412412412", "3123123", "B" ),
("1484811616151", "32143123", "B" ),
("848116.49484", "675676", "B"),
("818616161611", "3143253", "B");

SELECT * FROM licenses
INNER JOIN drivers
ON drivers.license_id = licenses.id;

SELECT name, email, register_number, category FROM licenses
INNER JOIN drivers
ON drivers.license_id = licenses.id;

CREATE TABLE pokemons (
    id INTEGER UNIQUE PRIMARY KEY NOT NULL,
    name TEXT UNIQUE NOT NULL,
    type TEXT NOT null,
    trainer_id TEXT NOT NULL,
    FOREIGN KEY (trainer_id) REFERENCES trainers(id)
);

CREATE TABLE trainers (
    id INTEGER UNIQUE PRIMARY KEY NOT NULL,
    name TEXT UNIQUE NOT NULL,
    age INTEGER NOT NULL,
    category TEXT NOT NULL
);

INSERT INTO trainers (id, name, age, category)
VALUES
(281, "Tonzera", 28, "Mestre"),
(321, "Melzera", 23, "Novato");

INSERT INTO pokemons (id, name, type, trainer_id)
VALUES
(1, "Pikachu", "Thunder", 281),
(2, "Bulbasaur", "Grass", 321),
(3, "Charizard", "Fire", 281),
(4, "Squirtle", "Water", 321),
(5, "Snorlax", "Normal", 281);

SELECT pokemons.id, trainers.name, category, pokemons.name FROM trainers
INNER JOIN pokemons
ON pokemons.trainer_id = trainers.id;