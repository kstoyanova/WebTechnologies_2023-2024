#DROP  DATABASE phonebook_db;

CREATE DATABASE phonebook_db;
USE phonebook_db;

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    email VARCHAR(64) UNIQUE NOT NULL,
    password VARCHAR(356) NOT NULL
);

CREATE TABLE Contacts (
    contact_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    first_name VARCHAR(32) NOT NULL,
    last_name VARCHAR(32),
    company VARCHAR(64),
    email VARCHAR(64),
    url VARCHAR(64),
    address_id INT NOT NULL,
    birthday DATE,
    other_date_type ENUM('anniversary', 'other'),
    other_date DATE,
    note VARCHAR(256),
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Addresses (
    address_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    street VARCHAR(32),
    city VARCHAR(32),
    state VARCHAR(32),
    postal_code VARCHAR(16),
    country VARCHAR(32),
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Phones (
    phone_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    contact_id INT NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    phone_type ENUM('work', 'personal', 'home'),
    FOREIGN KEY (contact_id) REFERENCES Contacts(contact_id)
);

CREATE TABLE SocialMedia (
    social_media_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    contact_id INT NOT NULL,
    platform VARCHAR(32),
    username VARCHAR(64),
    user_id INT NOT NULL,
    FOREIGN KEY (contact_id) REFERENCES Contacts(contact_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO Users (email, password) VALUES
('user1@example.com', 'password1'),
('user2@example.com', 'password2'),
('user3@example.com', 'password3'),
('user4@example.com', 'password4'),
('user5@example.com', 'password5');

INSERT INTO Contacts (first_name, last_name, company, email, url, address_id, birthday, other_date_type, other_date, note, user_id) 
VALUES 
('Иван', 'Иванов', 'Фирма 1', 'ivan@example.com', 'http://ivan.example.com', 1, '1990-05-15', 'anniversary', '1990-05-15', 'Някаква бележка за Иван Иванов', 1),
('Петър', 'Петров', 'Фирма 2', 'peter@example.com', 'http://peter.example.com', 2, '1995-07-20', 'other', '1995-07-20', 'Някаква бележка за Петър Петров', 2),
('Мария', 'Маринова', 'Фирма 3', 'maria@example.com', 'http://maria.example.com', 3, '1988-12-10', 'anniversary', '1988-12-10', 'Някаква бележка за Мария Маринова', 3),
('Георги', 'Георгиев', 'Фирма 4', 'georgi@example.com', 'http://georgi.example.com', 4, '1985-03-25', 'anniversary', '1985-03-25', 'Някаква бележка за Георги Георгиев', 4),
('Анна', 'Анева', 'Фирма 5', 'anna@example.com', 'http://anna.example.com', 5, '1992-09-18', 'other', '1992-09-18', 'Някаква бележка за Анна Анева', 5);


INSERT INTO Addresses (street, city, state, postal_code, country, user_id) VALUES
('ул. Първа 1', 'София', 'София', '1000', 'България', 1),
('ул. Втора 2', 'Пловдив', 'Пловдив', '2000', 'България', 2),
('ул. Трета 3', 'Варна', 'Варна', '3000', 'България', 3),
('ул. Четвърта 4', 'Русе', 'Русе', '4000', 'България', 4),
('ул. Пета 5', 'Бургас', 'Бургас', '5000', 'България', 5);

INSERT INTO Phones (contact_id, phone_number, phone_type) VALUES
(1, '0888123456', 'personal'),
(1, '0287654321', 'work'),
(2, '0878234567', 'personal'),
(3, '0898345678', 'personal'),
(4, '0888456789', 'personal'),
(5, '0898567890', 'personal');

INSERT INTO SocialMedia (contact_id, platform, username, user_id) VALUES
(1, 'Facebook', 'ivan_ivanov', 1),
(1, 'Twitter', '@ivanov', 1),
(2, 'Facebook', 'peter_petrov', 2),
(3, 'LinkedIn', 'maria_marinova', 3),
(4, 'Instagram', 'georgi_georgiev', 4),
(5, 'Twitter', '@anna', 5);