'use strict';

var CHAT = function () {
};
CHAT.room = null;
CHAT.instance = null;


CHAT.prototype.sendMessage = function (message, time) {
    var data = {
        message: message,
        room: this.room
    };
    if(time !== null || time !== undefined) {
        data.time = time;
    }
    this.instance.emit('a message', data);
};

CHAT.prototype.onChatMessage = function (data) {
    onChatMessageCallback(data);
};


CHAT.prototype.init = function (host, room) {
    var hostname = window.location.hostname;
    //var port = window.location.port;
    //
    //port = port.length > 0 ? ':' + port : port

    //host = 'http://' + hostname + ':3000';
    var that = this;
    this.room = room;
    var instance = io.connect(host + '/chat');
    this.instance = instance;

    this.instance
        .on('a message', function (data) {
            that.onChatMessage(data);
        })
        .on('create a room', function () {
            instance.emit('join a room', {
                room: room
            });
        })
    ;
};

