INSERT INTO Genres (name, description) VALUES
('jazz', 'a calm music genre'),
('pop', 'a popular music');

INSERT INTO Genres (name, description) VALUES
('blues', 'specific chord progressions, a walking bass, call and response'),
('house', 'electronic dance music'),
('classical', 'highly sophisticated instrumental music');

INSERT INTO Musicians (name, biography) VALUES
('Michael Jackson', 'pop-music king'),
('W. A. Mozart', 'asd'),
('Dj Smash', 'vsd'),
('BB King', 'dsfs'),
('D. Rogozin', 'efwf sdfsd'),
('Jazzman', 'fsdfsdf'),
('J. Loza', 'all genres master'),
('Bobert van Druken', 'house maker');

INSERT INTO GenreMusicians VALUES
(1, 6),
(1, 7),
(2, 1),
(3, 7),
(4, 2),
(4, 3),
(4, 7),
(4, 8),
(2, 4),
(5, 2),
(5, 8);

UPDATE genremusicians
SET genre_id = 1
WHERE musician_id = 4;

INSERT INTO genremusicians VALUES
(3, 4);

INSERT INTO genremusicians VALUES
(2, 5),
(4, 5);

INSERT INTO albums (name, year) VALUES
('Thriller', 1982),
('King of Pop', 2008),
('Piano Quartets', 1997),
('Die Zauberflote', 1955),
('Twenty Three', 2011),
('New world', 2012),
('King Size', 1977),
('Reflections', 2003),
('Fairyteller', 1991),
('New style', 2000),
('Everyday', 2005),
('For thought', 1995),
('For the soul', 1994),
('Best songs', 2016),
('First blood', 2021),
('New wave', 2020),
('It was all in my mind', 2022);

INSERT INTO albums (name, year) VALUES
('My dress', 2018)

INSERT INTO musicianalbums VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10),
(6, 11),
(7, 12),
(7, 13),
(7, 14),
(8, 15),
(8, 16),
(8, 17),
(6, 17),
(5, 15),
(8, 10);

INSERT INTO musicianalbums VALUES
(8, 18),
(5, 18),
(7, 18);

INSERT INTO tracks (name, duration_sec, album_id) VALUES
('TR 1', 120, 1),
('TR 2', 121, 1),
('TR 3', 234, 2),
('TR 4', 201, 2),
('TR 5', 96, 3),
('TR 6', 375, 4),
('TR 7', 131, 5),
('TR 8', 115, 6),
('TR 9', 240, 7),
('MY TR 10', 110, 7),
('TR 11', 97, 8),
('my TR 12', 736, 9),
('TR 13', 111, 10),
('TR 14', 134, 11),
('TR 15', 110, 11),
('TR 16', 212, 12),
('TR 17', 175, 13),
('TR 18', 128, 14),
('TR 19', 77, 15),
('TR 20', 155, 16),
('TR 21', 173, 16),
('TR 22', 131, 17),
('TR 23 my', 97, 18),
('TR MY 24', 102, 18);

INSERT INTO collections (name, year) VALUES
('Th', 2016),
('King', 2008),
('PQ', 1997),
('Die', 2017),
('T', 2020),
('New', 2012),
('Size', 1977),
('R2', 2003),
('Style', 2016),
('Everyday', 2018),
('Thought', 1995),
('My soul', 2021);

INSERT INTO collectiontracks VALUES
(1, 1),
(1, 4),
(1, 10),
(2, 10),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10),
(6, 11),
(7, 12),
(7, 13),
(7, 14),
(8, 15),
(8, 16),
(8, 17),
(6, 17),
(5, 15),
(9, 24),
(10, 23),
(10, 22),
(11, 21),
(11, 20),
(12, 19),
(12, 18),
(1, 18),
(2, 24);

