import { login } from '../services/authService.js';
export const query = `
  type User {
    userId: ID
    username: String!
  }
  
type Token {
  token: String
}

  type Mutation {
    login(username: String!, password: String!): Token
  }
`;

export const resolvers = {
  Query: {

  },
  Mutation: {
    login: (_, data, context) => {
      const { username, password } = data;
      return login(username, password, context);
    },
  },
};