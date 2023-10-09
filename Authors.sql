CREATE schema lab7; 
USE lab7; 

CREATE TABLE Authors ( 
  author_id INT PRIMARY KEY, 
  author_name VARCHAR(255) NOT NULL 
); 
CREATE TABLE Blogs ( 
    post_id INT PRIMARY KEY, 
    title VARCHAR(255) NOT NULL, 
    word_count INT NOT NULL, 
    views INT NOT NULL, 
    author_id INT, 
    FOREIGN KEY (author_id) REFERENCES Authors(author_id) 
); 
INSERT INTO Authors (author_id, author_name) 
VALUES 
    (1, 'Maria Charlotte'), 
    (2, 'Juan Perez'), 
    (3, 'Gemma Alcocer'); 
     
 INSERT INTO Blogs (post_id, title, word_count, views, author_id) 
values 
(1, 'Best Paint Colors', 814, 14, 1), 
    (2, 'Small Space Decorating Tips', 1146, 221, 2), 
    (3, 'Hot Accessories', 986, 105, 1), 
    (4, 'Mixing Textures', 765, 22, 1), 
    (5, 'Kitchen Refresh', 1242, 307, 2), 
    (6, 'Homemade Art Hacks', 1002, 193, 1), 
    (7, 'Refinishing Wood Floors', 1571, 7542, 3); 
    