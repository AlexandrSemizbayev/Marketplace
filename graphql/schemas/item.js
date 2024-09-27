import { getItem, getItems, createItem } from "../requests/item.js";
import { checkToken } from "../utils/jwt.js";

export const query = `
  type Query {
    getItem(id: String = 3): Item
    getItems: [Item!]!
  }
  type Image {
    pk: ID
    isMainImage: Boolean
    parentId: ID
    src: String
  }

  type Item {
    pk: String
    title: String
    description: String
    price: Int
    discount: Int
    categoryId: ID
    sizes: [Int]
    images: [Image]
  }
  
  input ImageInput {
    pk: ID
    isMainImage: Boolean
    parentId: ID
    src: String
  }

  input ItemInput {
    title: String
    description: String
    price: Int
    discount: Int
    categoryId: ID
    sizes: [Int]!
    images: [ImageInput!]!
  }

  type Mutation {
    createItem(data: ItemInput): Item
  }
`;


export const resolvers = {
  Query: {
    getItem: (_, { id }) => getItem(id).then((rows) => rows[0] || {}),
    getItems: () => getItems(),
  },
  Mutation: {
    createItem: (_, data, {req,res,next}) => {
      console.log(req);
      const verifiedToken = checkToken(req.headers?.authorization);
      if(verifiedToken.status === 200) {
        if(verifiedToken.data.token) {
          res.set('authorization', `Bearer ${verifiedToken.data.token}`);
        }
      } else {
        return res.status(verifiedToken.status).send({message: verifiedToken.message});
      }
      return createItem(data)
    },
  }
}