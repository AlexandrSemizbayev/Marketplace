import { query } from "./entry.js";

export const getUser = (username) => query(
  `SELECT * FROM ${process.env.PG_SCHEMA}.users WHERE username = $1;`,
  [username],
);

export const createUser = (username,hash) => {
  return query(`INSERT INTO ${process.env.PG_SCHEMA}.users(username, hash) VALUES($1,$2) RETURNING user_id;`, [username,hash]);
}

