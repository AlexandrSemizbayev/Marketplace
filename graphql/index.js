import './init.js';
import { ApolloServer } from '@apollo/server';
import { expressMiddleware } from '@apollo/server/express4';
import { ApolloServerPluginDrainHttpServer } from '@apollo/server/plugin/drainHttpServer'
import express from 'express';
import http from 'http';
import cors from 'cors';
import bodyParser from 'body-parser';
import { loadSchemas } from './schema-joiner.js';

(async () => {
  const app = express();
  const context = async (ctx) => ctx;
  const httpServer = http.createServer(app);
  const {queries, resolvers} = await loadSchemas();
  const server = new ApolloServer({
    typeDefs: queries,
    resolvers,
    hideSchemaDetailsFromClientErrors: false, // TODO change to true later
    plugins: [ApolloServerPluginDrainHttpServer({ httpServer })],
  });
  await server.start();

  app.use(cors());
  app.use(bodyParser.json());
  app.use(expressMiddleware(server, {context}));

  await new Promise((resolve) => httpServer.listen({ port: 7880 }, resolve));
  console.log(`🚀 Server ready at http://localhost:7880`);
})();