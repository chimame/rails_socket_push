process.title = 'pubsub-app';

var express = require('express');
var app = express();

var server = require('http').createServer(app);
var io = require('socket.io').listen(server);

var redis = require("socket.io-redis");
io.adapter(redis({host: '127.0.0.1', port: 6379}))

server.listen(5001);

io.sockets.on('connection', function (socket) {

  console.log("connection_start");

  socket.on('join_to_room', function (room) {
    console.log("#{socket.io} join to #{room}");
    socket.join(room)
  });

  socket.on('disconnect', function () {
    console.log("user disconnected");
  });

});