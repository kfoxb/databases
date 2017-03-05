var mysql = require('mysql');

// Create a database connection and export it from this file.
// You will need to connect with the user "root", no password,
// and to the database "chat".

var dbConnection = mysql.createConnection({
  user: 'root',
  password: '',
  database: 'chat'
});

dbConnection.connect();

var queryString = {
  getAllMessages: 'SELECT * FROM messages;',
  getPrimaryId: 'SELECT id FROM ? WHERE username = ?',
  insertUsername: 'INSERT INTO usernames (username) VALUES (?);'
};

// var queryStringForGetPrimaryId = 'SELECT id FROM' + tableName + 'WHERE username = ?';

exports.getAllMessages = function(callback, queryArgs) {
  dbConnection.query(queryString.getAllMessages, queryArgs, function(err, results) {
    if (err) {
      console.log('error getting all messages: ' + err.stack);
      return;
    }
    // console.log('connected as id ' + dbConnection.threadId);
    // // track root admin's ID and kill connections if needed
    // console.log('the result output is', results);
    // console.log('this is queryArgs', queryArgs);
    callback(results);
  });
};


// getPrimaryId for usernames.id and roomnames.id
var getPrimaryId = function(callback, tableName, searchName) {
  // TODO: refractor queryArgs to [arg]?
  dbConnection.query('SELECT id FROM ' + tableName + ' WHERE username = ' + searchName, function(err, results) {
    if (err) {
      console.log('error selecting user: ' + err.stack);
      return;
    }
    callback(results); // usernames.id... or error()
  });
};

exports.getUsernameId = function(callback, queryArgs) {
  getPrimaryId(callback, 'usernames', queryArgs[0]);
};

exports.insertUsername = function(callback, queryArgs) {
  dbConnection.query(queryString.insertUsername, queryArgs, function(err, results) {
    if (err) {
      console.log('error inserting username: ' + err.stack);
      return;
    }
    console.log('connected as id ' + dbConnection.threadId);
    // console.log('the result output is', results);
    // console.log('this is queryArgs', queryArgs);
    callback(results);
  });
};



// selectRoomname
// insertRoomname
// insertMessage
// searchPrimaryKey fn that takes in table name, column name.. and return the primary id

// database block fo ronly 1 entry for each username, and 1 entry for each roomname
// front-end block if anyone has duplicated username



// dbConnection.end();