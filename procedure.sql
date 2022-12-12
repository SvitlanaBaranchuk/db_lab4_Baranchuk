-- Створити процедуру get_video(category_arg), яка надає назви відео з категорії, вказаної в аргументі. 
DROP PROCEDURE IF EXISTS get_video(varchar(50));
CREATE OR REPLACE PROCEDURE get_video(category_arg varchar(50))
LANGUAGE 'plpgsql'
AS $$
DECLARE record_name video.video_title%TYPE;
DECLARE record_category category.name_category%TYPE;

BEGIN
    SELECT video_title, name_category INTO record_name, record_category 
	FROM video, category
	WHERE video.category_id = category.category_id 
	AND name_category = category_arg;
    RAISE INFO 'Video_title: %,  Video_category: %',  TRIM(record_name), TRIM(record_category);
END;
$$;
