CREATE DATABASE IF NOT EXISTS mydatabase;
USE mydatabase;

-- Legg til eventuelle tabeller og data her
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);

INSERT INTO users (username, email) VALUES
('john_doe', 'john@example.com'),
('jane_doe', 'jane@example.com');