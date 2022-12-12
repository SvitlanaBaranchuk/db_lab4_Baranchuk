-- Виклик функції 
SELECT * FROM video_rating;

SELECT upd_rating(150);
SELECT * FROM video_rating;

-- Виклик процедури
SELECT video_title, name_category 
FROM video, category
WHERE video.category_id = category.category_id;

CALL get_video('Politics');


-- Перевірка тригеру
SELECT * FROM video;

INSERT INTO video(video_id, id_channel, video_title, category_id, publish_time) 
VALUES ('111111', 107, 'Hello, world!', 5, '2020-11-23');

SELECT * FROM video;