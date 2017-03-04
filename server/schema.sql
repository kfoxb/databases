-- CREATE DATABASE chat;

USE chat;

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
  -- create a  roomnames foreign key column
    -- int
    -- set foreign key reference to roomnames.id
  FK_roomnames_messages int
);


/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/

