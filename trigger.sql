-- Створити тригер, який при додаванні нового відео буде дописувати наперед перед назвою відео
-- "NEW!!!" і стовпчик publish_time оновить на поточну дату.

DROP TRIGGER IF EXISTS video_trigger ON video;

-- Cтворення тригерної функції
CREATE OR REPLACE FUNCTION video_func() RETURNS trigger 
LANGUAGE 'plpgsql'
AS
$$
     BEGIN
          UPDATE video
          SET video_title = ('NEW!!! ' || video_title), 
		  publish_time = CURRENT_DATE 
		  WHERE video.video_id = NEW.video_id;
		  RETURN NULL; 
     END;
$$;

-- Cтворення тригеру
CREATE TRIGGER video_trigger
AFTER INSERT ON video
FOR EACH ROW EXECUTE FUNCTION video_func();
