import fs from 'fs';

export async function loadSchemas() {

  const schemaFiles = fs.readdirSync('./schemas');

  let queries = '';
  const resolversObject = {
    Query: {},
    Mutation: {},
  }
  const imports = schemaFiles.map(async (fileName) => {
    const { query, resolvers } = await import(`./schemas/${fileName}`);
    queries += `
      ${query || ''}
    `;
    resolversObject.Query = {
      ...resolversObject.Query,
      ...resolvers?.Query,
    };
    resolversObject.Mutation = {
      ...resolversObject.Mutation,
      ...resolvers?.Mutation,
    };

  });
  await Promise.all(imports);
  return {
    queries,
    resolvers: resolversObject
  }
}