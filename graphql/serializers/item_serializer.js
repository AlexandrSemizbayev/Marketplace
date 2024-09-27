const serializeImage = ({pk,src,is_main_image}) => ({
  pk,
  src,
  isMainImage: is_main_image,
});

const serializeImages = (images) => images.map(serializeImage);

export const serializeItem = (item) => ({
  pk: item.pk,
  title: item.title,
  description: item.description,
  price: item.price,
  discount: item.discount,
  categoryId: item.category_id,
  sizes: item.sizes,
  images: serializeImages(item.images),
});

export const serializeItems = (items) => items.map(serializeItem);