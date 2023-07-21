CREATE DATABASE instagram_clone_project;
USE instagram_clone_project;

create table users (
id serial primary key,
username varchar (225) unique not null,
created_at timestamp default now()
);

create table photos (
id serial primary key,
image_url varchar(225) not null,
user_id int not null,
created_at timestamp default now(),
foreign key (user_id) references users(id)
);

create table comments (
id serial  primary key,
comment_text varchar(225) not null,
user_id int not null,
photo_id int not null,
created_at timestamp default now(),
foreign key (user_id) references users(id),
foreign key (photo_id) references photos(id)
);


create table likes (
user_id int not null,
photo_id int not null,
created_at timestamp default now(),
foreign key (user_id) references users(id),
foreign key (photo_id) references photos(id),
primary key (user_id, photo_id)
);

create table follows (
follower_id int not null,
followee_id int not null,
created_at timestamp default now(),
foreign key (follower_id) references users(id),
foreign key (followee_id) references users(id),
primary key (follower_id, followee_id)
);

CREATE TABLE tags (
  id serial  PRIMARY KEY,
  tag_name VARCHAR(255) UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);
CREATE TABLE photo_tags (
    photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);

