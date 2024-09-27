// Actually I could use dotenv package from npm, but decided to make it myself
import fs from 'fs';

function readEnvFile(mode = '') {
  try { // In case of missing file, we don't want to crash our server
    const file = fs.readFileSync(`${mode}.env`, 'utf-8'); // This line could break our code without try-catch block;
    file.split(/\r?\n/).forEach(line =>  {
      const trimedLine = line.trim(); // Just trimming spaces
      if(!trimedLine || trimedLine.startsWith('#')) return; // # ENV_NAME=... means this line is commented
      let [key,value] = trimedLine.split('=');  // Getting ENV_NAME=ENV_VALUE as [ENV_NAME,ENV_VALUE];
      value = value.trim().split(/\s/)[0]; // Since it might have comments, we need to get rid of them...
      process.env[key.trim()] = value;  // Assigning our variable to process.env
    });
  } catch(err) {
    console.error(err.message); // Notify user about not found files.
  }
}
function getEnvironmentVariables() {
  process.env.NODE_MODE = process.env.NODE_MODE || 'development'; // development | production | staging
  readEnvFile();  // We will always use .env file as source of truth in case of missing variables
  readEnvFile(process.env.NODE_MODE); // Now we get variables for our mode
}

getEnvironmentVariables();