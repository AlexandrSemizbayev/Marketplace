import { query } from './entry.js';
import { serializeItems } from '../serializers/item_serializer.js';

// TODO: queries are vulnerable to SQL injections, pass values as second parameter in query(queryString,[value1,value2]);

export const getItem = (itemId) => {
  return query(`SELECT * FROM ${process.env.PG_SCHEMA}.get_item WHERE pk = '${itemId}'::uuid;`,[], serializeItems);
}

export const getItems = () => {
  return query(`SELECT * FROM ${process.env.PG_SCHEMA}.get_item;`,[], serializeItems);
}

export const createItem = async ({data}) => {
  const queryString = `WITH
  created_item AS (
    INSERT INTO ${process.env.PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      '${data.title}',
      '${data.description}',
      ${data.price},
      ${data.discount},
      '${data.categoryId}',
      ARRAY[${data.sizes}]
      
    ) RETURNING pk,title,description,price,discount,category_id,sizes
  ),
  inserted_images AS (
    INSERT INTO ${process.env.PG_SCHEMA}.images(
      is_main_image,
      src,
      parent_id
    )
      SELECT 
        is_main_image,
        src,
        pk
      FROM created_item
      CROSS JOIN (
        VALUES
          ${data.images.map(image => `(${image.isMainImage}, '${image.src}')`).join(',')}
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;
  `

  return query(queryString,[], serializeItems).then((result) => {
    return result[0]
  });
}