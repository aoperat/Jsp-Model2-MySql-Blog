create database cos;

use cos;

create table user(
   id int auto_increment primary key,
    username varchar(100) not null unique,
    password varchar(100) not null,
    email varchar(100) not null,
    createDate timestamp
) engine=InnoDB default charset=utf8;

desc user;
select * from user;


create table board(
   id int auto_increment primary key,
    userId int, 
    title varchar(100) not null,
    content longtext,
    readCount int default 0,
    createDate timestamp,
    foreign key(userId) references user(id)
) engine=InnoDB default charset=utf8;

desc board;
select * from board;


create table coment(
   id int auto_increment primary key,
    userId int, 
    boardId int,
    content varchar(300) not null,
    createDate timestamp,
    foreign key(userId) references user(id),
    foreign key(boardId) references board(id)
) engine=InnoDB default charset=utf8;


CREATE TABLE reply(
id int auto_increment primary key,
commentId int,
userId int,
content varchar(300) not null,
createDate timestamp,
foreign key (commentId) references comment (id),
foreign key (userId) references user (id)
);

Select * from board order by id desc;
select * from user;


insert into comment(userId, boardId, content, createDate)
 values (3,10, '네번째댓글', now());
 
 select * from comment;
 
 commit;