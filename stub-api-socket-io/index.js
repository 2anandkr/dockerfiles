const http = require("http");
const express = require("express");
const bodyParser = require('body-parser');

const app = express();

const host = "0.0.0.0";
const port = 8080;
const server = http.createServer(app);
server.listen(port, host, function() {
  console.log("server listening on " + host + ":" + port);
});

const userDb = [];

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))
// parse application/json
app.use(bodyParser.json())

app.get("/api", (req, res) => res.send("Welcome to api"));

app.post('/api/users/add', (req, res) => {
  if (!req.body.user) {
    return res.send('Please give a user to add!');
  }
  userDb.push(req.body.user);  
  res.send(`User ${req.body.user} was added to db.`);
});

app.get("/api/users", (req, res) => {
  res.json(userDb);
});

// test from CLI
// curl -X POST -d "user=foo" localhost:8080/users/add
// curl localhost:8080/users