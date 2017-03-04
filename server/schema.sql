-- CREATE DATABASE chat;

USE chat;

CREATE TABLE usernames (
  id int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id),

  username varchar(20) NOT NULL
);

CREATE TABLE roomnames (
  id int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id),

  roomname varchar(20) NOT NULL
);

CREATE TABLE messages (
  --  create a new id column
    -- set it to auto_increment
    -- set it to int
    -- set it to primary key
  id int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id),
  -- create a new message column
    -- set it to varchar(255)
    -- set it to not null
  message varchar(255) NOT NULL,
  -- create a usernames foreign key column
    -- int
    -- set foreign key reference to usernames.id
  FK_usernames_messages int,
  -- CONSTRAINT contraintName FOREIGN KEY (FK_usernames_messages)
  -- REFERENCES usernames (id)
  -- -- create a  roomnames foreign key column
  --   -- int
  --   -- set foreign key reference to roomnames.id
  FK_roomnames_messages int
  -- CONSTRAINT testConstraintName2 FOREIGN KEY FK_roomnames_messages
  -- REFERENCES roomnames(id)
);

ALTER TABLE messages ADD FOREIGN KEY (FK_usernames_messages)
REFERENCES usernames(id);

ALTER TABLE messages ADD FOREIGN KEY (FK_roomnames_messages)
REFERENCES roomnames(id);


-- !!! To view three-way inner joins of usernames, messages and roomnames table
-- select * from messages inner join usernames on messages.FK_usernames_messages = usernames.id inner join roomnames on messages.FK_roomnames_messages = roomnames.id;


-- !!! To insert a new message into messages table with two conditions
-- insert into messages (message, FK_usernames_messages, FK_roomnames_messages) values ('hi there', (select id from usernames where usernames.username='fred'), (select id from roomnames where roomnames.roomname='lobby'));


/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/

