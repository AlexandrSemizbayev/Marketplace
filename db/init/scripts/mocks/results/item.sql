
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Graceful Wedges',
      'Graceful Wedges',
      168,
      136,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Playful Boots',
      'Playful Boots',
      555,
      200,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Amazing Slippers',
      'Amazing Slippers',
      836,
      369,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Gentle Oxfords',
      'Gentle Oxfords',
      46,
      9,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Lively Moccasins',
      'Lively Moccasins',
      577,
      251,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Lovable Clogs',
      'Lovable Clogs',
      725,
      31,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Majestic Derby Shoes',
      'Majestic Derby Shoes',
      713,
      538,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Strong Brogues',
      'Strong Brogues',
      919,
      132,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Versatile Oxfords',
      'Versatile Oxfords',
      30,
      29,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Radiant Sandals',
      'Radiant Sandals',
      190,
      186,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Humble Slippers',
      'Humble Slippers',
      202,
      42,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Cool Oxfords',
      'Cool Oxfords',
      594,
      395,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Cool Moccasins',
      'Cool Moccasins',
      247,
      171,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Fresh Clogs',
      'Fresh Clogs',
      273,
      83,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Passionate Slippers',
      'Passionate Slippers',
      528,
      204,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Perfect Clogs',
      'Perfect Clogs',
      692,
      599,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Merry Espadrilles',
      'Merry Espadrilles',
      715,
      10,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Kind Brogues',
      'Kind Brogues',
      430,
      36,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Modern Boots',
      'Modern Boots',
      490,
      345,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Positive Derby Shoes',
      'Positive Derby Shoes',
      597,
      525,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Snazzy Espadrilles',
      'Snazzy Espadrilles',
      324,
      110,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Trendy Sandals',
      'Trendy Sandals',
      422,
      202,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Zealous Loafers',
      'Zealous Loafers',
      24,
      13,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Supple Sandals',
      'Supple Sandals',
      762,
      641,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Trendy Boots',
      'Trendy Boots',
      349,
      259,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Lavish Derby Shoes',
      'Lavish Derby Shoes',
      745,
      484,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Vigorous Wedges',
      'Vigorous Wedges',
      940,
      25,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Agile Sandals',
      'Agile Sandals',
      8,
      1,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Smart Loafers',
      'Smart Loafers',
      193,
      55,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Inspiring Boots',
      'Inspiring Boots',
      343,
      273,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Refined Loafers',
      'Refined Loafers',
      53,
      23,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Luxurious Brogues',
      'Luxurious Brogues',
      490,
      370,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Bright Espadrilles',
      'Bright Espadrilles',
      682,
      338,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Trustworthy Boots',
      'Trustworthy Boots',
      329,
      137,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Snazzy Derby Shoes',
      'Snazzy Derby Shoes',
      655,
      246,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Outstanding Slippers',
      'Outstanding Slippers',
      134,
      55,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Lovable Sandals',
      'Lovable Sandals',
      926,
      217,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Comfy Boots',
      'Comfy Boots',
      415,
      185,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Wise Moccasins',
      'Wise Moccasins',
      712,
      65,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Incredible Boots',
      'Incredible Boots',
      927,
      251,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Lovable Clogs',
      'Lovable Clogs',
      855,
      271,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Glorious Espadrilles',
      'Glorious Espadrilles',
      256,
      208,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Strong Derby Shoes',
      'Strong Derby Shoes',
      514,
      261,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Beautiful Derby Shoes',
      'Beautiful Derby Shoes',
      996,
      742,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Passionate Flip-flops',
      'Passionate Flip-flops',
      807,
      759,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Cheery Heels',
      'Cheery Heels',
      576,
      83,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Modern Loafers',
      'Modern Loafers',
      909,
      260,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Fresh Boots',
      'Fresh Boots',
      352,
      258,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Lovable Moccasins',
      'Lovable Moccasins',
      268,
      1,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Versatile Wedges',
      'Versatile Wedges',
      356,
      67,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Pleasing Boots',
      'Pleasing Boots',
      410,
      183,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Chic Boots',
      'Chic Boots',
      787,
      188,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Carefree Slippers',
      'Carefree Slippers',
      237,
      113,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Steady Clogs',
      'Steady Clogs',
      910,
      692,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Outstanding Loafers',
      'Outstanding Loafers',
      443,
      179,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Smart Espadrilles',
      'Smart Espadrilles',
      571,
      363,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Supple Flip-flops',
      'Supple Flip-flops',
      400,
      257,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Stylish Boots',
      'Stylish Boots',
      143,
      140,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Gracious Boots',
      'Gracious Boots',
      180,
      77,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Optimistic Clogs',
      'Optimistic Clogs',
      741,
      550,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Optimistic Sandals',
      'Optimistic Sandals',
      176,
      41,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Joyful Flip-flops',
      'Joyful Flip-flops',
      348,
      8,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Humble Moccasins',
      'Humble Moccasins',
      897,
      559,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Jubilant Wedges',
      'Jubilant Wedges',
      959,
      168,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Playful Boots',
      'Playful Boots',
      2,
      1,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Humble Boots',
      'Humble Boots',
      830,
      119,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Noble Oxfords',
      'Noble Oxfords',
      70,
      51,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Charming Derby Shoes',
      'Charming Derby Shoes',
      518,
      66,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Bright Moccasins',
      'Bright Moccasins',
      358,
      23,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Excellent Heels',
      'Excellent Heels',
      54,
      50,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Majestic Boots',
      'Majestic Boots',
      730,
      194,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Fresh Espadrilles',
      'Fresh Espadrilles',
      250,
      231,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Carefree Boots',
      'Carefree Boots',
      66,
      29,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Delightful Sandals',
      'Delightful Sandals',
      502,
      164,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Inspiring Boots',
      'Inspiring Boots',
      742,
      699,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Fabulous Oxfords',
      'Fabulous Oxfords',
      562,
      186,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Charming Moccasins',
      'Charming Moccasins',
      981,
      584,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Lavish Heels',
      'Lavish Heels',
      138,
      120,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Jubilant Loafers',
      'Jubilant Loafers',
      956,
      318,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Refined Sandals',
      'Refined Sandals',
      933,
      716,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Brilliant Boots',
      'Brilliant Boots',
      124,
      97,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Charming Flip-flops',
      'Charming Flip-flops',
      19,
      13,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Wise Moccasins',
      'Wise Moccasins',
      213,
      144,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Clever Loafers',
      'Clever Loafers',
      428,
      28,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Luxurious Boots',
      'Luxurious Boots',
      462,
      100,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Delightful Sandals',
      'Delightful Sandals',
      508,
      265,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Neat Derby Shoes',
      'Neat Derby Shoes',
      469,
      320,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Perfect Boots',
      'Perfect Boots',
      992,
      406,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Passionate Sandals',
      'Passionate Sandals',
      167,
      129,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Stunning Derby Shoes',
      'Stunning Derby Shoes',
      978,
      272,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Snazzy Clogs',
      'Snazzy Clogs',
      900,
      381,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Warm Derby Shoes',
      'Warm Derby Shoes',
      918,
      61,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Passionate Heels',
      'Passionate Heels',
      723,
      237,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Optimistic Wedges',
      'Optimistic Wedges',
      88,
      7,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Beautiful Loafers',
      'Beautiful Loafers',
      636,
      605,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Elegant Moccasins',
      'Elegant Moccasins',
      32,
      20,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Brilliant Flip-flops',
      'Brilliant Flip-flops',
      550,
      171,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Splendid Sandals',
      'Splendid Sandals',
      707,
      513,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Sincere Clogs',
      'Sincere Clogs',
      244,
      203,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Cheery Oxfords',
      'Cheery Oxfords',
      438,
      249,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Refined Loafers',
      'Refined Loafers',
      548,
      330,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Splendid Derby Shoes',
      'Splendid Derby Shoes',
      575,
      546,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Stunning Sandals',
      'Stunning Sandals',
      4,
      2,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Snazzy Wedges',
      'Snazzy Wedges',
      626,
      265,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Modern Sandals',
      'Modern Sandals',
      836,
      195,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Smooth Oxfords',
      'Smooth Oxfords',
      72,
      45,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Supportive Sandals',
      'Supportive Sandals',
      15,
      7,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Dynamic Derby Shoes',
      'Dynamic Derby Shoes',
      538,
      149,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Perfect Wedges',
      'Perfect Wedges',
      642,
      135,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Steady Wedges',
      'Steady Wedges',
      805,
      278,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Excellent Brogues',
      'Excellent Brogues',
      447,
      135,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Positive Oxfords',
      'Positive Oxfords',
      150,
      102,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Happy Espadrilles',
      'Happy Espadrilles',
      315,
      286,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Calm Espadrilles',
      'Calm Espadrilles',
      837,
      39,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Humble Sandals',
      'Humble Sandals',
      486,
      144,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Supple Boots',
      'Supple Boots',
      791,
      737,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Refined Espadrilles',
      'Refined Espadrilles',
      499,
      68,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Jubilant Moccasins',
      'Jubilant Moccasins',
      374,
      191,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Smooth Heels',
      'Smooth Heels',
      482,
      266,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Relaxed Derby Shoes',
      'Relaxed Derby Shoes',
      746,
      553,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Splendid Loafers',
      'Splendid Loafers',
      627,
      541,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Neat Brogues',
      'Neat Brogues',
      424,
      400,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Dashing Brogues',
      'Dashing Brogues',
      258,
      208,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Merry Moccasins',
      'Merry Moccasins',
      220,
      150,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Confident Derby Shoes',
      'Confident Derby Shoes',
      87,
      31,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Secure Espadrilles',
      'Secure Espadrilles',
      39,
      23,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Bright Clogs',
      'Bright Clogs',
      840,
      126,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Encouraging Brogues',
      'Encouraging Brogues',
      624,
      469,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Kind Clogs',
      'Kind Clogs',
      189,
      140,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Dashing Derby Shoes',
      'Dashing Derby Shoes',
      249,
      220,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Lovable Oxfords',
      'Lovable Oxfords',
      285,
      90,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Flexible Oxfords',
      'Flexible Oxfords',
      686,
      99,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Carefree Heels',
      'Carefree Heels',
      309,
      131,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Zealous Boots',
      'Zealous Boots',
      234,
      148,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Agile Loafers',
      'Agile Loafers',
      275,
      8,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Merry Slippers',
      'Merry Slippers',
      529,
      402,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Dynamic Heels',
      'Dynamic Heels',
      381,
      279,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Pleasing Loafers',
      'Pleasing Loafers',
      320,
      81,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Flexible Moccasins',
      'Flexible Moccasins',
      795,
      559,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Tranquil Moccasins',
      'Tranquil Moccasins',
      968,
      489,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Sincere Slippers',
      'Sincere Slippers',
      575,
      28,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Kind Oxfords',
      'Kind Oxfords',
      632,
      448,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Noble Oxfords',
      'Noble Oxfords',
      508,
      427,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Exuberant Brogues',
      'Exuberant Brogues',
      121,
      4,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Beautiful Slippers',
      'Beautiful Slippers',
      669,
      99,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Hip Loafers',
      'Hip Loafers',
      69,
      10,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Delightful Oxfords',
      'Delightful Oxfords',
      999,
      336,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Sleek Heels',
      'Sleek Heels',
      579,
      326,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Upbeat Oxfords',
      'Upbeat Oxfords',
      458,
      166,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Dashing Moccasins',
      'Dashing Moccasins',
      572,
      14,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Inspiring Clogs',
      'Inspiring Clogs',
      700,
      137,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Polished Flip-flops',
      'Polished Flip-flops',
      252,
      223,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Lively Oxfords',
      'Lively Oxfords',
      378,
      293,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Exuberant Derby Shoes',
      'Exuberant Derby Shoes',
      595,
      582,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Positive Wedges',
      'Positive Wedges',
      913,
      190,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Relaxed Wedges',
      'Relaxed Wedges',
      267,
      10,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Passionate Brogues',
      'Passionate Brogues',
      412,
      120,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Enthusiastic Boots',
      'Enthusiastic Boots',
      157,
      64,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Amazing Moccasins',
      'Amazing Moccasins',
      841,
      469,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Radiant Heels',
      'Radiant Heels',
      710,
      397,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Easygoing Brogues',
      'Easygoing Brogues',
      46,
      24,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Neat Derby Shoes',
      'Neat Derby Shoes',
      53,
      30,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Cheery Oxfords',
      'Cheery Oxfords',
      164,
      78,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Trustworthy Moccasins',
      'Trustworthy Moccasins',
      891,
      350,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Stylish Heels',
      'Stylish Heels',
      361,
      224,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Luxurious Derby Shoes',
      'Luxurious Derby Shoes',
      359,
      33,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Chic Sandals',
      'Chic Sandals',
      91,
      88,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Classy Heels',
      'Classy Heels',
      748,
      733,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Trendy Espadrilles',
      'Trendy Espadrilles',
      400,
      78,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Hip Boots',
      'Hip Boots',
      396,
      109,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Cheery Moccasins',
      'Cheery Moccasins',
      100,
      46,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Amazing Boots',
      'Amazing Boots',
      874,
      104,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Neat Wedges',
      'Neat Wedges',
      776,
      458,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Passionate Flip-flops',
      'Passionate Flip-flops',
      97,
      67,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Excellent Boots',
      'Excellent Boots',
      433,
      252,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Luxurious Loafers',
      'Luxurious Loafers',
      260,
      219,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Pure Boots',
      'Pure Boots',
      683,
      80,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Lovable Moccasins',
      'Lovable Moccasins',
      93,
      75,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Clever Loafers',
      'Clever Loafers',
      714,
      643,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Cozy Clogs',
      'Cozy Clogs',
      490,
      416,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Kind Slippers',
      'Kind Slippers',
      465,
      45,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Optimistic Boots',
      'Optimistic Boots',
      692,
      630,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Fresh Oxfords',
      'Fresh Oxfords',
      694,
      377,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Excellent Flip-flops',
      'Excellent Flip-flops',
      957,
      458,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Trustworthy Sandals',
      'Trustworthy Sandals',
      237,
      74,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Secure Derby Shoes',
      'Secure Derby Shoes',
      27,
      11,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Flashy Boots',
      'Flashy Boots',
      801,
      137,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Dashing Boots',
      'Dashing Boots',
      891,
      637,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Brilliant Derby Shoes',
      'Brilliant Derby Shoes',
      335,
      161,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Calm Loafers',
      'Calm Loafers',
      594,
      290,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Modern Loafers',
      'Modern Loafers',
      656,
      311,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Snazzy Brogues',
      'Snazzy Brogues',
      258,
      7,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Upbeat Moccasins',
      'Upbeat Moccasins',
      771,
      108,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Unique Espadrilles',
      'Unique Espadrilles',
      61,
      11,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Cool Slippers',
      'Cool Slippers',
      381,
      188,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Relaxed Boots',
      'Relaxed Boots',
      653,
      208,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Stunning Boots',
      'Stunning Boots',
      800,
      620,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Perfect Loafers',
      'Perfect Loafers',
      749,
      379,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Dynamic Derby Shoes',
      'Dynamic Derby Shoes',
      76,
      71,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Flashy Moccasins',
      'Flashy Moccasins',
      211,
      191,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Exuberant Moccasins',
      'Exuberant Moccasins',
      665,
      66,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Strong Sandals',
      'Strong Sandals',
      319,
      59,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Comfy Heels',
      'Comfy Heels',
      354,
      177,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Merry Derby Shoes',
      'Merry Derby Shoes',
      366,
      352,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Delightful Oxfords',
      'Delightful Oxfords',
      754,
      144,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Jubilant Oxfords',
      'Jubilant Oxfords',
      603,
      574,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Splendid Clogs',
      'Splendid Clogs',
      701,
      434,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Delightful Loafers',
      'Delightful Loafers',
      567,
      225,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Fantastic Espadrilles',
      'Fantastic Espadrilles',
      366,
      130,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Gracious Heels',
      'Gracious Heels',
      376,
      349,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Classy Sandals',
      'Classy Sandals',
      442,
      68,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Classy Derby Shoes',
      'Classy Derby Shoes',
      210,
      130,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Merry Moccasins',
      'Merry Moccasins',
      761,
      447,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Charming Espadrilles',
      'Charming Espadrilles',
      60,
      32,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Confident Brogues',
      'Confident Brogues',
      606,
      194,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Snazzy Clogs',
      'Snazzy Clogs',
      852,
      538,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Positive Brogues',
      'Positive Brogues',
      304,
      69,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Free Heels',
      'Free Heels',
      465,
      236,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Merry Espadrilles',
      'Merry Espadrilles',
      717,
      193,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Brave Loafers',
      'Brave Loafers',
      879,
      39,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Optimistic Sandals',
      'Optimistic Sandals',
      915,
      719,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Bright Clogs',
      'Bright Clogs',
      6,
      4,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Free Slippers',
      'Free Slippers',
      24,
      22,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Optimistic Derby Shoes',
      'Optimistic Derby Shoes',
      787,
      732,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Amazing Derby Shoes',
      'Amazing Derby Shoes',
      917,
      342,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Snazzy Boots',
      'Snazzy Boots',
      464,
      19,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Joyful Heels',
      'Joyful Heels',
      464,
      63,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Lively Heels',
      'Lively Heels',
      303,
      288,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Comfy Sandals',
      'Comfy Sandals',
      85,
      53,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Secure Heels',
      'Secure Heels',
      222,
      156,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Humble Moccasins',
      'Humble Moccasins',
      927,
      317,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Fresh Derby Shoes',
      'Fresh Derby Shoes',
      949,
      586,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Lively Flip-flops',
      'Lively Flip-flops',
      441,
      124,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Supple Boots',
      'Supple Boots',
      859,
      65,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Luxurious Derby Shoes',
      'Luxurious Derby Shoes',
      94,
      23,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Smooth Espadrilles',
      'Smooth Espadrilles',
      340,
      249,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Fabulous Wedges',
      'Fabulous Wedges',
      114,
      87,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Gracious Derby Shoes',
      'Gracious Derby Shoes',
      348,
      292,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Neat Clogs',
      'Neat Clogs',
      573,
      512,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Fabulous Boots',
      'Fabulous Boots',
      216,
      109,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Talented Clogs',
      'Talented Clogs',
      751,
      100,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Smooth Clogs',
      'Smooth Clogs',
      940,
      178,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Chic Slippers',
      'Chic Slippers',
      858,
      660,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Glamorous Boots',
      'Glamorous Boots',
      699,
      83,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Zesty Derby Shoes',
      'Zesty Derby Shoes',
      482,
      337,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Clever Flip-flops',
      'Clever Flip-flops',
      914,
      358,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Enthusiastic Sandals',
      'Enthusiastic Sandals',
      926,
      771,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Confident Brogues',
      'Confident Brogues',
      954,
      119,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Radiant Boots',
      'Radiant Boots',
      707,
      261,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Flashy Oxfords',
      'Flashy Oxfords',
      262,
      114,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Warm Brogues',
      'Warm Brogues',
      787,
      278,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Smart Boots',
      'Smart Boots',
      766,
      752,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Outstanding Slippers',
      'Outstanding Slippers',
      614,
      201,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Luxurious Moccasins',
      'Luxurious Moccasins',
      18,
      1,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Strong Wedges',
      'Strong Wedges',
      92,
      47,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Happy Espadrilles',
      'Happy Espadrilles',
      330,
      139,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Splendid Wedges',
      'Splendid Wedges',
      859,
      95,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Amazing Loafers',
      'Amazing Loafers',
      276,
      31,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Calm Espadrilles',
      'Calm Espadrilles',
      31,
      1,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Supple Boots',
      'Supple Boots',
      820,
      446,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Cheery Oxfords',
      'Cheery Oxfords',
      789,
      34,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Delightful Derby Shoes',
      'Delightful Derby Shoes',
      630,
      531,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Upbeat Boots',
      'Upbeat Boots',
      87,
      13,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Kind Wedges',
      'Kind Wedges',
      578,
      47,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Flexible Loafers',
      'Flexible Loafers',
      173,
      28,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Majestic Loafers',
      'Majestic Loafers',
      34,
      20,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Amazing Boots',
      'Amazing Boots',
      333,
      113,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Sleek Boots',
      'Sleek Boots',
      444,
      73,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Gracious Loafers',
      'Gracious Loafers',
      23,
      16,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Majestic Boots',
      'Majestic Boots',
      508,
      157,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Classy Wedges',
      'Classy Wedges',
      144,
      43,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Upbeat Moccasins',
      'Upbeat Moccasins',
      425,
      359,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Brave Clogs',
      'Brave Clogs',
      494,
      382,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Lovable Boots',
      'Lovable Boots',
      415,
      319,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Reliable Heels',
      'Reliable Heels',
      839,
      829,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Superb Flip-flops',
      'Superb Flip-flops',
      403,
      196,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Lavish Wedges',
      'Lavish Wedges',
      855,
      539,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Agile Boots',
      'Agile Boots',
      694,
      249,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Lavish Heels',
      'Lavish Heels',
      131,
      88,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Zealous Wedges',
      'Zealous Wedges',
      671,
      94,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Carefree Slippers',
      'Carefree Slippers',
      542,
      507,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Elegant Sandals',
      'Elegant Sandals',
      628,
      538,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Tranquil Boots',
      'Tranquil Boots',
      681,
      433,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Upbeat Flip-flops',
      'Upbeat Flip-flops',
      793,
      163,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Cheery Espadrilles',
      'Cheery Espadrilles',
      456,
      395,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Supple Flip-flops',
      'Supple Flip-flops',
      73,
      66,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Agile Slippers',
      'Agile Slippers',
      169,
      35,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Vigorous Wedges',
      'Vigorous Wedges',
      222,
      57,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Unique Sandals',
      'Unique Sandals',
      18,
      9,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Outstanding Flip-flops',
      'Outstanding Flip-flops',
      401,
      366,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Relaxed Oxfords',
      'Relaxed Oxfords',
      92,
      4,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Vibrant Wedges',
      'Vibrant Wedges',
      596,
      1,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Trendy Sandals',
      'Trendy Sandals',
      469,
      363,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Fabulous Clogs',
      'Fabulous Clogs',
      927,
      897,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Polished Flip-flops',
      'Polished Flip-flops',
      840,
      23,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Glamorous Sandals',
      'Glamorous Sandals',
      156,
      72,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Lively Derby Shoes',
      'Lively Derby Shoes',
      370,
      240,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Lavish Boots',
      'Lavish Boots',
      150,
      67,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Comfy Brogues',
      'Comfy Brogues',
      460,
      446,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Glamorous Derby Shoes',
      'Glamorous Derby Shoes',
      293,
      192,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Kind Espadrilles',
      'Kind Espadrilles',
      113,
      39,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Zealous Sandals',
      'Zealous Sandals',
      237,
      110,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Positive Boots',
      'Positive Boots',
      932,
      54,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Joyful Loafers',
      'Joyful Loafers',
      658,
      68,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Outstanding Oxfords',
      'Outstanding Oxfords',
      59,
      38,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Sleek Sandals',
      'Sleek Sandals',
      967,
      360,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Wise Moccasins',
      'Wise Moccasins',
      21,
      13,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Cool Brogues',
      'Cool Brogues',
      675,
      663,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Jubilant Espadrilles',
      'Jubilant Espadrilles',
      568,
      189,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Glamorous Espadrilles',
      'Glamorous Espadrilles',
      758,
      165,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Pure Moccasins',
      'Pure Moccasins',
      605,
      201,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Radiant Boots',
      'Radiant Boots',
      500,
      67,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Graceful Brogues',
      'Graceful Brogues',
      889,
      98,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Refined Loafers',
      'Refined Loafers',
      897,
      490,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Agile Boots',
      'Agile Boots',
      386,
      316,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Clever Boots',
      'Clever Boots',
      613,
      106,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Fresh Derby Shoes',
      'Fresh Derby Shoes',
      912,
      742,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Refined Slippers',
      'Refined Slippers',
      902,
      796,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Refined Wedges',
      'Refined Wedges',
      573,
      204,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Vigorous Slippers',
      'Vigorous Slippers',
      538,
      143,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Bright Wedges',
      'Bright Wedges',
      552,
      210,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Incredible Heels',
      'Incredible Heels',
      986,
      12,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Splendid Loafers',
      'Splendid Loafers',
      650,
      539,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Unique Slippers',
      'Unique Slippers',
      268,
      118,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Vibrant Derby Shoes',
      'Vibrant Derby Shoes',
      497,
      99,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Flashy Wedges',
      'Flashy Wedges',
      791,
      127,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Pleasing Clogs',
      'Pleasing Clogs',
      739,
      397,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Elegant Loafers',
      'Elegant Loafers',
      677,
      5,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Beautiful Slippers',
      'Beautiful Slippers',
      219,
      37,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Refined Boots',
      'Refined Boots',
      954,
      699,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Easygoing Flip-flops',
      'Easygoing Flip-flops',
      560,
      415,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Amazing Derby Shoes',
      'Amazing Derby Shoes',
      523,
      264,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Wise Derby Shoes',
      'Wise Derby Shoes',
      311,
      183,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Brave Flip-flops',
      'Brave Flip-flops',
      929,
      411,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Classy Flip-flops',
      'Classy Flip-flops',
      743,
      259,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Classy Flip-flops',
      'Classy Flip-flops',
      271,
      102,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Trustworthy Brogues',
      'Trustworthy Brogues',
      906,
      517,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Beautiful Boots',
      'Beautiful Boots',
      31,
      18,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Steady Boots',
      'Steady Boots',
      499,
      136,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Reliable Sandals',
      'Reliable Sandals',
      662,
      125,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Versatile Flip-flops',
      'Versatile Flip-flops',
      340,
      280,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Glamorous Moccasins',
      'Glamorous Moccasins',
      890,
      859,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Humble Boots',
      'Humble Boots',
      103,
      3,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Amazing Brogues',
      'Amazing Brogues',
      831,
      45,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Lovable Flip-flops',
      'Lovable Flip-flops',
      210,
      93,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Pleasing Oxfords',
      'Pleasing Oxfords',
      37,
      34,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Neat Oxfords',
      'Neat Oxfords',
      510,
      30,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Bright Derby Shoes',
      'Bright Derby Shoes',
      594,
      465,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Positive Espadrilles',
      'Positive Espadrilles',
      98,
      10,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Noble Brogues',
      'Noble Brogues',
      833,
      737,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Optimistic Boots',
      'Optimistic Boots',
      478,
      115,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Relaxed Brogues',
      'Relaxed Brogues',
      526,
      139,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Comfy Wedges',
      'Comfy Wedges',
      432,
      375,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Zesty Clogs',
      'Zesty Clogs',
      550,
      143,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Fancy Espadrilles',
      'Fancy Espadrilles',
      546,
      212,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Carefree Espadrilles',
      'Carefree Espadrilles',
      523,
      97,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Carefree Oxfords',
      'Carefree Oxfords',
      72,
      27,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Cool Heels',
      'Cool Heels',
      924,
      637,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Joyful Sandals',
      'Joyful Sandals',
      779,
      314,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Pure Moccasins',
      'Pure Moccasins',
      338,
      183,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Brilliant Wedges',
      'Brilliant Wedges',
      355,
      162,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Strong Boots',
      'Strong Boots',
      189,
      123,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Flashy Clogs',
      'Flashy Clogs',
      780,
      610,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Carefree Oxfords',
      'Carefree Oxfords',
      600,
      179,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Passionate Boots',
      'Passionate Boots',
      288,
      265,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Easygoing Derby Shoes',
      'Easygoing Derby Shoes',
      416,
      395,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Optimistic Loafers',
      'Optimistic Loafers',
      471,
      329,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Snazzy Boots',
      'Snazzy Boots',
      580,
      234,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Gracious Boots',
      'Gracious Boots',
      800,
      656,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Vibrant Heels',
      'Vibrant Heels',
      186,
      126,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Refined Slippers',
      'Refined Slippers',
      886,
      74,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Smart Boots',
      'Smart Boots',
      941,
      473,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Warm Clogs',
      'Warm Clogs',
      776,
      670,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Glamorous Sandals',
      'Glamorous Sandals',
      504,
      84,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Calm Oxfords',
      'Calm Oxfords',
      545,
      351,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Versatile Loafers',
      'Versatile Loafers',
      358,
      171,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Trustworthy Oxfords',
      'Trustworthy Oxfords',
      334,
      157,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Wise Espadrilles',
      'Wise Espadrilles',
      471,
      24,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Radiant Espadrilles',
      'Radiant Espadrilles',
      671,
      300,
      (SELECT pk FROM existing_category),
      ARRAY[1,2]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Agile Flip-flops',
      'Agile Flip-flops',
      982,
      71,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Incredible Derby Shoes',
      'Incredible Derby Shoes',
      876,
      247,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Joyful Brogues',
      'Joyful Brogues',
      646,
      519,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Jubilant Clogs',
      'Jubilant Clogs',
      217,
      52,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Positive Loafers',
      'Positive Loafers',
      418,
      326,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Wise Loafers',
      'Wise Loafers',
      67,
      59,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Fantastic Heels',
      'Fantastic Heels',
      251,
      225,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Bright Espadrilles',
      'Bright Espadrilles',
      640,
      295,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Outstanding Oxfords',
      'Outstanding Oxfords',
      850,
      658,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Inspiring Slippers',
      'Inspiring Slippers',
      746,
      351,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Supportive Boots',
      'Supportive Boots',
      616,
      541,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Superb Clogs',
      'Superb Clogs',
      914,
      439,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Delightful Heels',
      'Delightful Heels',
      912,
      343,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Cozy Brogues',
      'Cozy Brogues',
      449,
      423,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg'),(true, 'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Kind Moccasins',
      'Kind Moccasins',
      959,
      775,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Brave Wedges',
      'Brave Wedges',
      639,
      242,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8,9]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Marvelous Wedges',
      'Marvelous Wedges',
      118,
      4,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7,8]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Confident Sandals',
      'Confident Sandals',
      172,
      168,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg'),(true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977'),(true, 'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155'),(true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1'),(true, 'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473'),(true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Hip Boots',
      'Hip Boots',
      90,
      24,
      (SELECT pk FROM existing_category),
      ARRAY[1]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Excellent Wedges',
      'Excellent Wedges',
      835,
      338,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3,4,5,6,7]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  
  
  WITH existing_category AS (
    SELECT * FROM ${PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      'Perfect Brogues',
      'Perfect Brogues',
      509,
      496,
      (SELECT pk FROM existing_category),
      ARRAY[1,2,3]
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
        (true, 'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg'),(true, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),(true, 'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500')
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;

  