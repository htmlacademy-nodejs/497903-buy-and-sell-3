-- эти запросы необходимы для заполнения в таблицу с объявлениями данными
-- временно отключим проверку всех ограничений в таблице
ALTER TABLE offers DISABLE TRIGGER ALL;
INSERT INTO offers
  (title, description, type, sum, picture, user_id)
VALUES
  ('Куплю гараж', 'Куплю гараж, чтобы держать там крокодила', 'OFFER', 10000, 'image1.jpg', 1),
  ('Продам гараж', 'Продам гараж, где можно держать крокодила', 'SALE', 10000, 'image2.jpg', 2),
  ('Куплю крокодила', 'Куплю крокодила, чтобы держать в гараже', 'OFFER', 1000, 'image3.jpg', 2),
  ('Продам крокодила', 'Продам крокодила, которого можно держать в гараже', 'SALE', 1000, 'image4.jpg', 1),
  ('Продам крокодиловую сумку', 'Продам сумку из крокодиловой кожи, изготовление а заказ', 'SALE', 2000, 'image5.jpg', 1);
-- после завершения операции вставки, включим обратно
ALTER TABLE offers ENABLE TRIGGER ALL;
-- этот запрос необходим для присвоения категорий объявлениям
ALTER TABLE offer_categories DISABLE TRIGGER ALL;
INSERT INTO offer_categories
  (offer_id, category_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 1),
  (2, 2),
  (3, 1),
  (4, 1),
  (5, 3);
ALTER TABLE offer_categories ENABLE TRIGGER ALL;

-- эти запросы необходимы для заполнения в таблицу с комментариями данными
ALTER TABLE comments DISABLE TRIGGER ALL;
INSERT INTO COMMENTS
  (text, user_id, offer_id)
VALUES
  ('Купи мой гараж', 2, 1),
  ('Купи, кому говорю', 2, 1),
  ('Плохой гараж', 1, 2),
  ('Не куплю', 1, 2),
  ('Купи крокодила', 1, 3),
  ('Отличный крокодил', 1, 3),
  ('Не куплю крокодила', 2, 4),
  ('Дрянной крокодил', 2, 4),
  ('Пожалей крокодила', 2, 5),
  ('Держать негде', 1, 5);
ALTER TABLE comments ENABLE TRIGGER ALL;
