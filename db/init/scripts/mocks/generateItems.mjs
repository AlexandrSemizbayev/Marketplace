import fs from 'fs';
const emotionalStates = [
  "Awesome", "Amazing", "Brilliant", "Beautiful", "Charming", "Delightful", "Elegant", "Excellent", 
  "Fabulous", "Fantastic", "Glorious", "Graceful", "Incredible", "Luxurious", "Majestic", "Marvelous", 
  "Outstanding", "Perfect", "Pleasing", "Radiant", "Refined", "Splendid", "Stunning", "Superb", 
  "Wonderful", "Unique", "Chic", "Classy", "Cool", "Cozy", "Dashing", "Fancy", "Flashy", "Fresh", 
  "Glamorous", "Hip", "Lavish", "Modern", "Neat", "Polished", "Sleek", "Snazzy", "Stylish", "Trendy", 
  "Vibrant", "Agile", "Calm", "Carefree", "Comfy", "Confident", "Easygoing", "Effortless", "Flexible", 
  "Free", "Gentle", "Happy", "Joyful", "Lively", "Merry", "Playful", "Relaxed", "Secure", "Smooth", 
  "Steady", "Strong", "Supple", "Tranquil", "Vigorous", "Zesty", "Brave", "Bright", "Cheery", 
  "Clever", "Dynamic", "Encouraging", "Enthusiastic", "Exuberant", "Gracious", "Humble", "Inspiring", 
  "Jubilant", "Kind", "Lovable", "Noble", "Optimistic", "Passionate", "Positive", "Pure", "Reliable", 
  "Sincere", "Smart", "Supportive", "Talented", "Trustworthy", "Upbeat", "Versatile", "Warm", "Wise", 
  "Zealous", "Zany"
];

const shoeTypes = [
  "Sneakers", "Boots", "Loafers", "Sandals", "Oxfords", "Flip-flops", 
  "Heels", "Brogues", "Moccasins", "Slippers", "Espadrilles", 
  "Wedges", "Derby Shoes", "Clogs", "Ankle Boots",
];


const images = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7vk5095N33HITuRLVPQze0xYC-NrIXha2cQ&s',
  'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://img.ltwebstatic.com/images3_pi/2023/02/17/1676601808a5b1dd94e2bf8547b0b0d743b4debe68_thumbnail_720x.jpg',
  'https://taftclothing.com/cdn/shop/files/BT-VIKING-DEEPAZURE_TAFT2.jpg?v=1699559804&width=2500',
  'https://m.media-amazon.com/images/I/71maBiv-7LL.jpg',
  'https://m.media-amazon.com/images/I/51z+V7RA4GL.jpg',
  'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w',
  'https://images.dsw.com/is/image/DSWShoes/568075_334_ss_01?impolicy=qlt-medium-high&imwidth=640&imdensity=1',
  'https://www.shooos.com/media/catalog/product/cache/2/image/1350x778/9df78eab33525d08d6e5fb8d27136e95/d/m/dm311470013.jpg',
  'https://www.kickscrew.com/cdn/shop/products/main-square_87f3dae5-f42e-4010-9c7a-9d20f268985a_540x.jpg?v=1693985473',
  'https://www.kickscrew.com/cdn/shop/files/main-square_6b0a27ea-652e-433d-97bf-4594615346aa_540x.png?v=1706013155',
  'https://i.ebayimg.com/images/g/F0wAAOSwiiVmAjM2/s-l1200.jpg',
  'https://moesportsnyc.com/cdn/shop/products/641209590-8_740x_fa507f10-1f00-42b7-b86b-42d21fa3396a_900x.jpg?v=1665876977',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqV9YVQ_HnrCfVZ0kccdQmcDsgK9l5rxaYQ&s',
  'https://cdn.mall.adeptmind.ai/https%3A%2F%2Fimages.journeys.com%2Fimages%2Fproducts%2F1_678128_FS.JPG_large.jpg',
]
const random = (upTo = 10) => Math.floor(Math.random() * upTo) || 1;

const err = (source) => console.error(source,': undefined');

const generateItem = () => {
  const item = {};
  const emotionalWord = emotionalStates[random(emotionalStates.length-1)]
  const shoeType = shoeTypes[random(shoeTypes.length-1)];
  item.title = `${emotionalWord} ${shoeType}`;
  item.description = item.title;
  item.price = random(1000);
  item.discount = random(item.price);
  item.sizes = (new Array(random(10)).fill(1).map((_,idx) => idx+1));
  const imagesToAdd = [];
  if(!emotionalWord) {err('emotionalWord')} else if(!shoeType) {
  err('shoeType')
  }
  let mainImageSet = false;
  const range = random(10);
  for(let i = 0; i < range; i++) {
    const imageObject = {}
    const image = images[random(images.length-1)];
    if(!mainImageSet && range - 1 > i ) {
      const isMainImage = !!random(1);
      mainImageSet = isMainImage;
      imageObject.isMainImage = isMainImage;
    } else {
      imageObject.isMainImage = true;
    }
    if(!image) {
      err('image')
    }
    imageObject.src = image;
    imagesToAdd.push(imageObject)
  }
  item.categoryId = 'acb886b8-6a41-4f31-a64d-352cab95da10';
  if(imagesToAdd.length) {
    item.images = imagesToAdd;
  } else {
    item.images = [];
    item.images.push({
      src: 'https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w',
      isMainImage: true,
    });
  }
  
  return item;
}

process.env.PG_SCHEMA = '${PG_SCHEMA}';

const generateQuery = (data) => `
  WITH existing_category AS (
    SELECT * FROM ${process.env.PG_SCHEMA}.categories WHERE title = 'regular shoes'
  ),
  created_item AS (
    INSERT INTO ${process.env.PG_SCHEMA}.items(title,description, price, discount, category_id, sizes) VALUES(
      '${data.title}',
      '${data.description}',
      ${data.price},
      ${data.discount},
      (SELECT pk FROM existing_category),
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
        ${data.images.map(image => image.src ? `(${image.isMainImage}, '${image.src}')` : '(TRUE, https://images.squarespace-cdn.com/content/v1/5115a5eae4b04512ec7d13c4/1395262497028-IBT9FE9WLGQD3TPYSSIO/image-asset.png?format=1000w)').join(',')}
      ) AS img(is_main_image, src)
      RETURNING *
  )
  SELECT 
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes,
    json_agg(
      json_build_object(
        'is_main_image', img.is_main_image,
        'src', img.src,
        'parent_id', img.parent_id
      )
    ) AS images
  FROM created_item AS item
  LEFT JOIN inserted_images AS img ON img.parent_id = item.pk
  GROUP BY
    item.pk,
    item.title,
    item.description,
    item.price,
    item.discount,
    item.category_id,
    item.sizes
  ;
`;

let queries = '';

for(let i = 0; i < 400; i++) {
  const item = generateItem();
	queries += `
  ${generateQuery(item)}
  `;
}
fs.writeFileSync(process.cwd() + '/db/init/scripts/mocks/results/item.sql', queries);