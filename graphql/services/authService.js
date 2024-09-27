import bcrypt from 'bcryptjs';
import {
  getUser,
  createUser,
} from '../requests/auth.js';

import {
  generateToken,
} from '../utils/jwt.js';

export const verifyPassword = (password, hash) => {
  return bcrypt.compareSync(password, hash);
};

export const initNewUser = async (username, password) => {
  var salt = bcrypt.genSaltSync(10);
  var hash = bcrypt.hashSync(password, salt);
  await createUser(username, hash);
  return generateToken(username, password);
};

export const login = async (username, password, ctx) => {
  console.log(username);
  const userInDB = await getUser(username).then((result) => result[0] || null);
  if(userInDB) {
    if(verifyPassword(password,userInDB.hash)) {
      const token = generateToken(username, password);
      ctx.res.set('Authorization', `Bearer ${token}`);
      return token;
    } else {
      ctx.res.status(403).send({message:'The password you\'ve entered is wrong. Please check your username and password'});
    }
  } else {
    await initNewUser(username, password);
    return generateToken(username, password);
  }
}