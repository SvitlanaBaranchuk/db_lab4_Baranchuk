-- Написати функцію, яка змінює поле act_date в таблиці Video_Rating на поточну дату 
-- та додає до полів likes, dislikes, v_views і coments константу, яку оголосимо при виклику функції.

SELECT * FROM video_rating;

DROP FUNCTION IF EXISTS upd_rating(integer);
CREATE OR REPLACE FUNCTION upd_rating(const integer) RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN 
   UPDATE video_rating
   SET act_date = CURRENT_DATE, likes = likes + const, dislikes = dislikes + const, 
   v_views = v_views + const, coments = coments + const;
END;
$$; 
