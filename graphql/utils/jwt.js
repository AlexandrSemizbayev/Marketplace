import jwt from 'jsonwebtoken';

process.env.APP_SECRET = 'secret_phrase';
export const generateToken = (username, password) => {
  return {
    token: jwt.sign(
      {
        username,
        password,
      },
      process.env.APP_SECRET,
      { expiresIn: '30m' }
    )
  };
}

export const refreshToken = (token) => {
  const payload = jwt.verify(token, process.env.APP_SECRET);
  delete payload.iat;
  delete payload.exp;
  delete payload.nbf;
  delete payload.jti;
  return jwt.sign(payload, process.env.APP_SECRET);
}

export const checkToken = (authHeader = '') => {
  const token = authHeader.split(' ')[1];
  const generateResult = (msg,status,data) => ({
    message: msg || '',
    status: status || 200,
    data: data || {},
  });
  if(!token) {
    return generateResult('Authorization required', 401, {});
  }
  try{
    const verifiedToken = jwt.verify(token, process.env.APP_SECRET);
    const secondsTillExpired = Math.floor(verifiedToken.exp - (Date.now() / 1000));
    if(secondsTillExpired < 120) {
      // res.set('authorization', `Bearer ${refreshToken(token)}`);
      return generateResult('Token refreshed', 200, {token: token});
    }
    console.log('Token will expire in: ', secondsTillExpired + 's.');
    return generateResult('OK', 200, {});
  } catch(error) {
    if (error.name === 'JsonWebTokenError') {
      return generateResult('Invalid Token', 401, {});
    } else if (error.name === 'TokenExpiredError') {
      return generateResult('Token expired', 401, {});
    }
    else {
      return generateResult(`Token verification error: ${error.message}`, 401, {});
    }
  }
}