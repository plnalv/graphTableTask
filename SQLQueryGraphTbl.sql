USE master;
DROP DATABASE IF EXISTS MusicStudio;
CREATE DATABASE MusicStudio;
USE MusicStudio;

CREATE TABLE Artist
(
	id INT NOT NULL PRIMARY KEY,
	name NVARCHAR(100) NOT NULL
) AS NODE;CREATE TABLE Song
(
	id INT NOT NULL PRIMARY KEY,
	name NVARCHAR(200) NOT NULL,
	genre NVARCHAR(100) NOT NULL
) AS NODE; CREATE TABLE Album
(
	id INT NOT NULL PRIMARY KEY,
	name NVARCHAR(200) NOT NULL,
	releaseYear INT NOT NULL) AS NODE;CREATE TABLE Featuring AS EDGE;--����� "������ ������������� � ��������" CREATE TABLE Performs  AS EDGE;-- ����� ������ ��������� �����
CREATE TABLE IncludedIn AS EDGE;-- ����� ����� ������ � ������ALTER TABLE Featuring ADD CONSTRAINT EC_Featuring CONNECTION (Artist TO Artist);
ALTER TABLE Performs ADD CONSTRAINT EC_Performs CONNECTION (Artist TO Song);
ALTER TABLE IncludedIn ADD CONSTRAINT EC_IncludedIn CONNECTION (Song TO Album);
--���������� ������ �����INSERT INTO Artist (id, name)
VALUES (1, N'Beyonce'),
	 (2, N'Post Malone'),
	 (3, N'Shawn Mendes'),
	 (4, N'Eminem'),
	 (5, N'Camila Cabello'),
	 (6, N'Rihanna'),
	 (7, N'Shakira'),
	 (8, N'21 Savage'),
	 (9, N'Bruno Mars'),
	 (10, N'Anderson Paak'),
	 (11, N'Ariana Grande'),
	 (12, N'Miley Cyrus'),
	 (13, N'Lana Del Rey'),	 (14, N'The Weeknd'),	 (15, N'Ed Sheeran'),	 (16, N'N/A'),	 (17, N'Doja Cat');
SELECT *
FROM Artist;/*"Beautiful Liar" - Beyonc? ft. Shakira: Genre - Pop/R&B.
"Rockstar" - Post Malone ft. 21 Savage: Genre - Hip-hop/Rap.
"Senorita" - Shawn Mendes, Camila Cabello: Genre - Pop/Latin.
"Love The Way You Lie" - Eminem ft. Rihanna: Genre - Hip-hop/Rap.
"Leave The Door Open" - Silk Sonic (Bruno Mars, Anderson .Paak): Genre - R&B/Soul.
"Don't Call Me Angel" - Ariana Grande, Miley Cyrus, Lana Del Rey: Genre - Pop.
"Save Your Tears" - The Weeknd ft. Ariana Grande: Genre - Pop/R&B.
"Bad Habits" - Ed Sheeran ft. N/A: Genre - Pop/Electropop.
"You Right" - Doja Cat ft. The Weeknd: Genre - Pop/R&B.
"Don't Go Yet" - Camila Cabello ft. N/A: Genre - Pop/Latin.*/INSERT INTO Song (id, name, genre)
VALUES (1, N'Beautiful Liar', N'Pop/R&B'),
	 (2, N'Rockstar', N'Hip-hop/Rap'),
	 (3, N'Senorita', N'Pop/Latin'),
	 (4, N'Love The Way You Lie', N'Hip-hop/Rap'),
	 (5, N'Leave The Door Open', N'R&B/Soul'),
	 (6, N'Do not Call Me Angel', N'Pop'),
	 (7, N'Save Your Tears', N'Pop/R&B'),
	 (8, N'Bad Habits', N'Pop/Electropop'),
	 (9, N'You Right', N'Pop/R&B'),
	 (10, N'Do not Go Yet', N'Pop/Latin');
SELECT *
FROM Song;/*"Beautiful Liar" - Beyonc? ft. Shakira: Album - "B'Day Deluxe Edition" (2007).
"Rockstar" - Post Malone ft. 21 Savage: Album - "Beerbongs & Bentleys" (2018).
"Senorita" - Shawn Mendes, Camila Cabello: Single release (2019).
"Love The Way You Lie" - Eminem ft. Rihanna: Album - "Recovery" (2010).
"Leave The Door Open" - Silk Sonic (Bruno Mars, Anderson .Paak): Album - "An Evening with Silk Sonic" (2021).
"Don't Call Me Angel" - Ariana Grande, Miley Cyrus, Lana Del Rey: Soundtrack - "Charlie's Angels" (2019).
"Save Your Tears" - The Weeknd ft. Ariana Grande: Album - "After Hours" (2020).
"Bad Habits" - Ed Sheeran ft. N/A: Single release (2021).
"You Right" - Doja Cat ft. The Weeknd: Album - "Planet Her" (2021).
"Don't Go Yet" - Camila Cabello ft. N/A: Single release (2021)*/INSERT INTO Album(id, name, releaseYear)
VALUES (1, N'BDay Deluxe Edition', 2007),
	 (2, N'Beerbongs & Bentleys', 2018),
	 (3, N'Single release', 2019),
	 (4, N'Recovery', 2010),
	 (5, N'An Evening with Silk Sonic', 2021),
	 (6, N'Charlies Angels', 2019),
	 (7, N'After Hours', 2020),
	 (8, N'Single release', 2021),
	 (9, N'Planet Her', 2021),
	 (10, N'Single release', 2021);
SELECT *
FROM Album;--���������� ������ �����INSERT INTO Featuring ($from_id, $to_id)
VALUES ((SELECT $node_id FROM Artist WHERE id = 1),(SELECT $node_id FROM Artist WHERE id = 7)),
 ((SELECT $node_id FROM Artist WHERE id =2),(SELECT $node_id FROM Artist WHERE id = 8)),
 ((SELECT $node_id FROM Artist WHERE id = 3),(SELECT $node_id FROM Artist WHERE id = 5)),
 ((SELECT $node_id FROM Artist WHERE id = 4),(SELECT $node_id FROM Artist WHERE id = 6)),
 ((SELECT $node_id FROM Artist WHERE id = 9),(SELECT $node_id FROM Artist WHERE id = 10)),
 ((SELECT $node_id FROM Artist WHERE id = 11),(SELECT $node_id FROM Artist WHERE id = 12)),
 ((SELECT $node_id FROM Artist WHERE id = 11),(SELECT $node_id FROM Artist WHERE id = 13)),
 ((SELECT $node_id FROM Artist WHERE id = 12),(SELECT $node_id FROM Artist WHERE id = 13)),
 ((SELECT $node_id FROM Artist WHERE id = 14),(SELECT $node_id FROM Artist WHERE id = 11)),
 ((SELECT $node_id FROM Artist WHERE id = 15),(SELECT $node_id FROM Artist WHERE id = 16)),
 ((SELECT $node_id FROM Artist WHERE id = 17),(SELECT $node_id FROM Artist WHERE id = 14)),
 ((SELECT $node_id FROM Artist WHERE id = 5),(SELECT $node_id FROM Artist WHERE id = 16)),
 ((SELECT $node_id FROM Artist WHERE id = 5), (SELECT $node_id FROM Artist WHERE id = 17)),
 ((SELECT $node_id FROM Artist WHERE id = 17), (SELECT $node_id FROM Artist WHERE id = 12));


SELECT *
FROM Featuring;INSERT INTO Performs ($from_id, $to_id)
VALUES ((SELECT $node_id FROM Artist WHERE id = 1),(SELECT $node_id FROM Song WHERE id = 1)),
 ((SELECT $node_id FROM Artist WHERE id =7),(SELECT $node_id FROM Song WHERE id = 1)),
 ((SELECT $node_id FROM Artist WHERE id = 2),(SELECT $node_id FROM Song WHERE id = 2)),
 ((SELECT $node_id FROM Artist WHERE id = 8),(SELECT $node_id FROM Song WHERE id = 2)),
 ((SELECT $node_id FROM Artist WHERE id = 3),(SELECT $node_id FROM Song WHERE id = 3)),
 ((SELECT $node_id FROM Artist WHERE id = 5),(SELECT $node_id FROM Song WHERE id = 3)),
 ((SELECT $node_id FROM Artist WHERE id = 4),(SELECT $node_id FROM Song WHERE id = 4)),
 ((SELECT $node_id FROM Artist WHERE id = 6),(SELECT $node_id FROM Song WHERE id = 4)),
 ((SELECT $node_id FROM Artist WHERE id = 9),(SELECT $node_id FROM Song WHERE id = 5)),
 ((SELECT $node_id FROM Artist WHERE id = 10),(SELECT $node_id FROM Song WHERE id = 5)),
 ((SELECT $node_id FROM Artist WHERE id = 11),(SELECT $node_id FROM Song WHERE id = 6)),
 ((SELECT $node_id FROM Artist WHERE id = 12),(SELECT $node_id FROM Song WHERE id = 6)),
 ((SELECT $node_id FROM Artist WHERE id = 13),(SELECT $node_id FROM Song WHERE id = 6)),
 ((SELECT $node_id FROM Artist WHERE id = 14),(SELECT $node_id FROM Song WHERE id = 7)),
 ((SELECT $node_id FROM Artist WHERE id = 11),(SELECT $node_id FROM Song WHERE id = 7)),
 ((SELECT $node_id FROM Artist WHERE id = 15),(SELECT $node_id FROM Song WHERE id = 8)),
 ((SELECT $node_id FROM Artist WHERE id = 16),(SELECT $node_id FROM Song WHERE id = 8)),
  ((SELECT $node_id FROM Artist WHERE id = 17),(SELECT $node_id FROM Song WHERE id = 9)),
 ((SELECT $node_id FROM Artist WHERE id = 14),(SELECT $node_id FROM Song WHERE id = 9)),
 ((SELECT $node_id FROM Artist WHERE id = 5),(SELECT $node_id FROM Song WHERE id = 10)),
 ((SELECT $node_id FROM Artist WHERE id = 16),(SELECT $node_id FROM Song WHERE id = 10));

SELECT *
FROM Performs;INSERT INTO IncludedIn ($from_id, $to_id)
VALUES ((SELECT $node_id FROM Song WHERE id = 1),(SELECT $node_id FROM Album WHERE id = 1)),
 ((SELECT $node_id FROM Song WHERE id =2),(SELECT $node_id FROM Album WHERE id = 2)),
 ((SELECT $node_id FROM Song WHERE id = 3),(SELECT $node_id FROM Album WHERE id = 3)),
 ((SELECT $node_id FROM Song WHERE id = 4),(SELECT $node_id FROM Album WHERE id = 4)),
 ((SELECT $node_id FROM Song WHERE id = 5),(SELECT $node_id FROM Album WHERE id = 5)),
 ((SELECT $node_id FROM Song WHERE id = 6),(SELECT $node_id FROM Album WHERE id = 6)),
 ((SELECT $node_id FROM Song WHERE id = 7),(SELECT $node_id FROM Album WHERE id = 7)),
 ((SELECT $node_id FROM Song WHERE id = 8),(SELECT $node_id FROM Album WHERE id = 8)),
 ((SELECT $node_id FROM Song WHERE id = 9),(SELECT $node_id FROM Album WHERE id = 9)),
 ((SELECT $node_id FROM Song WHERE id = 10),(SELECT $node_id FROM Album WHERE id = 10));

SELECT *
FROM IncludedIn;

--������� �� ������� � �������� ��������--MATCH--� ��� � ������� ���� ���?SELECT Artist1.name
 , Artist2.name AS [co-author name]
FROM Artist AS Artist1
 , Featuring
 , Artist AS Artist2
WHERE MATCH(Artist1-(Featuring)->Artist2)
 AND Artist1.name = N'Miley Cyrus'; --��� ������� �������� Ariana Grande? SELECT artist1.name + N' ����� ��� � ' + artist2.name AS Level1
 , artist2.name + N' ����� ��� � ' + artist3.name AS Level2
FROM Artist AS artist1
 , Featuring AS coauthor1
 , Artist AS artist2
 , Featuring AS coauthor2
 , Artist AS artist3
WHERE MATCH(artist1-(coauthor1)->artist2-(coauthor2)->artist3)
 AND artist1.name = N'Ariana Grande'; --������� ����� ����� �������� The Weeknd?SELECT artist.name + N' - ����� ����� ' + song.name
FROM Artist AS artist
	, Performs AS performs
	, Song AS song
WHERE MATCH(artist-(performs)->song)
  AND artist.name = N'The Weeknd';--��� ����� ������������� ������� � �� �������:SELECT album.name AS album
	, song.name AS [song name]
    , artist.name AS artist
FROM Album AS album
	, Song AS song
	, artist AS artist
	, IncludedIn
	, Performs
WHERE MATCH (album<-(IncludedIn)-song<-(Performs)-artist)
	AND album.name = N'After Hours';

-- ��� �����, ������� ������ � �������, ���������� ����� ������������� ����, � �� �������:
SELECT album.name AS album
     , song.name AS song
     , artist.name AS artist
FROM Album AS album
	, Song AS song
	, IncludedIn
	, Performs
	, Artist AS artist
WHERE MATCH (album<-(IncludedIn)-song<-(Performs)-artist)
    AND album.releaseYear > 2020;

--�������, ������� ��������� ����� ������������� �����:
SELECT DISTINCT artist.name AS artist
FROM Artist AS artist
	, Performs
	, Song AS song
WHERE MATCH (artist-(Performs)->song)
    AND song.genre = N'Pop/Latin';


--SHORTEST_PATH
--����������� ��������� ����������� ��� The Weeknd:
SELECT artist1.name AS artist
 , STRING_AGG(artist2.name, '->') WITHIN GROUP (GRAPH PATH) AS
[co-authorship]
FROM Artist AS artist1
 , Featuring FOR PATH AS f
 , Artist FOR PATH AS artist2
WHERE MATCH(SHORTEST_PATH(artist1(-(f)->artist2)+))
 AND artist1.name = N'The Weeknd';


-- ������� ���������� ���� ��� Shawn Mendes ����� ����, ��� Doja Cat ������� ��� � Miley Cyrus
-- �������: ��������� ������ ���� ���������� ���� �� Shawn Mendes �� Miley Cyrus
WITH T1 AS
(
SELECT artist1.name AS artist
 , STRING_AGG(artist2.name, '->') WITHIN GROUP (GRAPH PATH)
AS [co-authors]
 , LAST_VALUE(artist2.name) WITHIN GROUP (GRAPH PATH) AS
LastNode
FROM Artist AS artist1
 , Featuring FOR PATH AS f
 , Artist FOR PATH AS artist2
WHERE MATCH(SHORTEST_PATH(artist1(-(f)->artist2){1, 3}))
 AND artist1.name = N'Shawn Mendes'
)
SELECT artist, [co-authors]
FROM T1
WHERE LastNode = N'Miley Cyrus'--������������ ����� � POWER BI � ������� FORCE-DIRECTED GRAPHSELECT @@SERVERNAME
-- ������: DESKTOP-B1EPJ01\SQLEXPRESS
-- ���� ������: MusicStudio
--https://raw.githubusercontent.com/plnalv/graphTableTask/main/images/artist1.png
SELECT A1.ID IdFirst
 , A1.name AS First
 , CONCAT(N'co-authors',A1.id) AS [First image name]
 , A2.ID AS IdSecond
 , A2.name AS Second
 , CONCAT(N'co-authors',A2.id) AS [Second image name]
FROM dbo.Artist AS A1
 , dbo.Featuring AS F
 , dbo.Artist AS A2
WHERE MATCH (A1-(F)->A2)
