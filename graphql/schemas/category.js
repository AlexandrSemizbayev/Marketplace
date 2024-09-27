import {
  getCategoryById,
  getCategories,
  createCategory
} from '../requests/category.js';
export const query = `
  type Query {
    getCategoryById(id: ID = 1): Category
    getCategories: [Category]
  }

  type Category {
    pk: ID
    title: String
    image: String
  }

  input CategoryInput {
    title: String
    image: String
  }

  type Mutation {
    createCategory(data: CategoryInput): Category
  }
`;

export const resolvers = {
  Query: {
    getCategoryById: (_, {id}) => getCategoryById(id).then((rows) => rows[0] || {}),
    getCategories: (_, {limit = 20}) => getCategories(limit),
  },
  Mutation: {
    createCategory: (_,category) => createCategory(category),
  }
}