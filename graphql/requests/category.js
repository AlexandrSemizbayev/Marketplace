import { query } from './entry.js';

export const getCategoryById = (id) => {
  return query(`SELECT * FROM ${process.env.PG_SCHEMA}.categories WHERE pk = ${id};`)
}

export const getCategories = (limit = 20) => {
  return query(`SELECT * FROM ${process.env.PG_SCHEMA}.categories LIMIT ${limit};`)
}

export const createCategory = (category) => {
  return query(`INSERT INTO ${PG_SCHEMA}.categories(title,image) VALUES('${category.title}', '${category.image}') RETURNING *;`);
}