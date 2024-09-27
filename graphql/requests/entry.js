import pg from 'pg';
const { Pool } = pg;

const connectClient = async () => {
  const client = new Pool({
    user: process.env.PG_USER,
    password: process.env.PG_PASSWORD,
    database: process.env.PG_DB,
    host: 'localhost',
    port: 5436,
    statement_timeout: 5000,
  });
  return await client.connect();
};

export const query = (q, values = [], serializer) => {
  return connectClient().then((connectedClient) => {
  return connectedClient.query(q,values).then((result) => {
    connectedClient.release();
    if(serializer) {
      return serializer(result.rows);
    }
    return result.rows
  });
})
}