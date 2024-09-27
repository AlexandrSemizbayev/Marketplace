CREATE VIEW ${PG_SCHEMA}.get_item AS
SELECT
  item.pk,
  item.title,
  item.description,
  item.price,
  item.discount,
  item.category_id AS category_id,
  item.sizes,
  json_agg(
    json_build_object(
      'pk', image.pk,
      'src', image.src,
      'is_main_image', image.is_main_image
    )
  ) AS images
FROM ${PG_SCHEMA}.items AS item
JOIN ${PG_SCHEMA}.images AS image
ON item.pk = image.parent_id
GROUP BY
  item.pk, item.title, item.description, item.price, item.discount, item.category_id;