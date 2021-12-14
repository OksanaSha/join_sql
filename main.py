import sqlalchemy

engine = sqlalchemy.create_engine('postgresql://oks:@localhost:5432/music_2_db')
connection = engine.connect()

print('1) Количество исполнителей в каждом жанре')
sel1 = connection.execute("""
SELECT name, COUNT(*) FROM genres g
JOIN genremusicians gm ON g.id = gm.genre_id
GROUP BY name;
""").fetchall()
print(*sel1)
print('---------')

print('2) Количество треков, вошедших в альбомы 2019-2020 годов')
sel2 = connection.execute("""
SELECT COUNT(*) FROM albums a
JOIN tracks t ON a.id = t.album_id
WHERE a.year <= 2020 AND a.year >= 2019;
""").fetchall()
print(sel2)
print('---------')

print('3) Cредняя продолжительность треков по каждому альбому')
sel3 = connection.execute("""
SELECT a.name, AVG(t.duration_sec) FROM albums a
JOIN tracks t ON a.id = t.album_id
GROUP BY a.name;
""").fetchall()
print(*sel3, sep='\n')
print('---------')

print('4) Все исполнители, которые не выпустили альбомы в 2020 году')
sel4 = connection.execute("""
SELECT DISTINCT m.name FROM musicians m
JOIN musicianalbums ma ON m.id = ma.musician_id
JOIN albums a ON ma.album_id = a.id
WHERE NOT m.id = (
    SELECT ma.musician_id FROM musicianalbums ma
    JOIN albums a ON ma.album_id = a.id
    WHERE a.year = 2020);
""").fetchall()
print(*sel4, sep='\n')
print('---------')

print('5) Названия сборников, в которых присутствует Michael Jackson')
sel5 = connection.execute("""
SELECT c.name FROM collections c
JOIN collectiontracks ck ON c.id = ck.collection_id
JOIN tracks t ON ck.track_id = t.id
JOIN albums a ON t.album_id = a.id
JOIN musicianalbums ma ON a.id = ma.album_id
JOIN musicians m ON ma.musician_id = m.id
WHERE m.name = 'Michael Jackson'
GROUP BY c.name;
""").fetchall()
print(*sel5)
print('---------')

print('6) Название альбомов, в которых присутствуют исполнители более 1 жанра')
sel6 = connection.execute("""
SELECT a.name FROM albums a
JOIN musicianalbums ma ON a.id = ma.album_id
WHERE ma.musician_id IN (
    SELECT m.id FROM musicians m
    JOIN genremusicians gm ON m.id = gm.musician_id
    GROUP BY m.id
    HAVING COUNT(*) > 1)
GROUP BY a.name;
""").fetchall()
print(*sel6, sep='\n')
print('---------')

print('7) Наименование треков, которые не входят в сборники')
sel7 = connection.execute("""
SELECT t.name FROM tracks t
LEFT JOIN collectiontracks ct ON t.id = ct.track_id
WHERE ct.collection_id IS NULL;
""").fetchall()
print(sel7)
print('---------')

print('8) Исполнителя(-ей), написавшего самый короткий по продолжительности трек')
sel8 = connection.execute("""
SELECT m.name FROM musicians m
JOIN musicianalbums ma ON m.id = ma.musician_id
JOIN albums a ON ma.album_id = a.id
JOIN tracks t ON a.id = t.album_id
WHERE t.duration_sec = (
  SELECT MIN(t.duration_sec) FROM tracks t);
""").fetchall()
print(sel8)
print('---------')

print('9) Название альбомов, содержащих наименьшее количество треков')
sel9 = connection.execute("""
SELECT a.name FROM albums a
JOIN tracks t ON a.id = t.album_id
GROUP BY a.name
HAVING COUNT(*) = (
    SELECT COUNT(*) FROM tracks t
    GROUP BY album_id
    ORDER BY COUNT(*)
    LIMIT 1);
""").fetchall()
print(*sel9, sep='\n')