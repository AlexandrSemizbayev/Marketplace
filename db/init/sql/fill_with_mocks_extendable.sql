WITH created_category AS (
  INSERT INTO ${PG_SCHEMA}.categories(title, image)
  VALUES (
    'regular shoes',
    'https://d1nymbkeomeoqg.cloudfront.net/photos/28/53/406870_3175_XL.jpg'
  )
  RETURNING pk AS category_id
),
created_item AS (
  INSERT INTO ${PG_SCHEMA}.items(title, description, price, discount, category_id, sizes) 
  VALUES (
    'Shoe',
    'It is just a shoe',
    45,
    12,
    (SELECT category_id FROM created_category),
    ARRAY[6,7,8,9]
  ) 
  RETURNING pk AS item_id
)
INSERT INTO ${PG_SCHEMA}.images(is_main_image, src, parent_id)
SELECT 
  TRUE,
  'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/99486859-0ff3-46b4-949b-2d16af2ad421/custom-nike-dunk-high-by-you-shoes.png',
  item_id
FROM created_item
UNION ALL
SELECT
  FALSE,
  'https://usagi-online.com/img/item/EES01/EES0121S0113/EES0121S0113_zo_a001.jpg',
  item_id
FROM created_item;
