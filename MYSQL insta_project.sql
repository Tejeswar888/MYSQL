create database instaproject;
use instaproject;

/*USERS TABLE*/
create table Users(id int primary key auto_increment,
			user_name varchar(300) not null unique,
			email varchar(250) not null,
			mobile varchar(10) not null check(length(mobile) = 10),
			created_at timestamp default now());

/*PHOTOS(POSTS) TABLE*/
create table Photos(id int primary key auto_increment,
			image_url varchar(250) not null unique,
			user_id int not null,
			created_at timestamp default now(),
			foreign key(user_id) references users(id));
            
/*LIKES TABLE*/
create table likes(user_id int not null,
			photo_id int not null,
			created_at timestamp default now(),
			foreign key(user_id) references users(id),
			foreign key(photo_id) references photos(id),
			primary key(user_id,photo_id));
			
/*COMMENTS TABLE*/
create table comments(id int primary key auto_increment,
			c_text text not null,
			photo_id int not null,
			user_id int not null,
			created_at timestamp default now(),
			foreign key(photo_id) references photos(id),
			foreign key(user_id) references users(id));

/*FOLLOWS TABLE*/
create table follows(follower_id int not null,
			followee_id int not null,
			created_at timestamp default now(),
			foreign key(follower_id) references users(id),
			foreign key(followee_id) references users(id),
			primary key(follower_id,followee_id));
            
/*INSERTING VALUES*/
insert into users(user_name,email,mobile) values('hacker_vasu','vasuhacker@gmail.com','9988775544');

insert into users(user_name,email,mobile) values('pra_bash_rebel','rebelbash@gmail.com','8500075000');

insert into users(user_name,email,mobile) values('kalapana_queen','unique_queen@gmail.com','7569900800');

insert into users(user_name,email,mobile) values('gowtham_mptc','powerstar_mptc@gmail.com','9100560143');

insert into users(user_name,email,mobile) values('rashmika_little_princess','princess_rashmika@gmail.com','9700856956');

insert into users(user_name,email,mobile) values('bapatla_prince','prince_bapatla@gmail.com','9600075000');

insert into users(user_name,email,mobile) values('prasad_harihara','veera_prasad@gmail.com','8500074745');

insert into users(user_name,email,mobile) values('pilli_venkata-simha','simhavenkat@gmail.com','9640123143');

insert into users(user_name,email,mobile) values('trendy_joel','hearthacker@gmail.com','7500096000');

insert into users(user_name,email,mobile) values('tiger_nayeem','juniortigernayeem@gmail.com','9550950143');

select * from users;

/*FOLLOWEES SECTION*/
insert into follows(follower_id, followee_id) values
(6,4),(6,3),(6,7),(6,2),
(4,10),(4,9),(4,5),(4,1),(4,7),
(1,4),(1,6),
(5,3),(5,6),(5,10),
(2,3),(2,5),(2,6),(2,9),
(9,6),(9,4),(9,5);

select * from follows;

select u.id,u.user_name,count(f.follower_id) as followers_count
from users u 
left join follows f
on u.id=f.followee_id
group by u.id,u.user_name;

select u.id,u.user_name,count(f.followee_id) as following_count
from users u 
left join follows f
on u.id=f.follower_id
group by u.id,u.user_name;

select u.id,u.user_name,count(f.follower_id) as users_with_zero_followers
from users u 
left join follows f 
on u.id=f.follower_id
where f.followee_id is null 
group by u.id;

select u.id,u.user_name,count(f.follower_id) as users_followees
from users u 
left join follows f 
on u.id=f.follower_id
where f.followee_id is not null 
group by u.id;

select u.id,u.user_name,count(f.followee_id) as users_with_zero_followees
from users u 
left join follows f 
on u.id=f.followee_id
where f.follower_id is null 
group by u.id;

select u.id,u.user_name,count(f.followee_id) as users_followers
from users u 
left join follows f 
on u.id=f.followee_id
where f.follower_id is not null 
group by u.id;

select u.id,u.user_name,
    count(distinct f1.follower_id) as followers_count,
    count(distinct f2.followee_id) as following_count
from users u
left join follows f1 on f1.followee_id = u.id   
left join follows f2 on f2.follower_id = u.id  
group by u.id, u.user_name;

/*PHOTOS SECTION*/
insert into photos(image_url,user_id) values('1.com',1),
('two.com',2),
('thre.com',3),
('foo.com',4),
('ojbn.com',7),
('hiio.com',10),
('tjfwo.com',1),
('twfkjno.com',4),
('fjbn.com',4),
('tkj.com',4),
('khjb .com',4);

select * from photos;

select u.id,u.user_name,count(p.id)
from users u 
left join photos p 
on u.id=p.user_id
group by u.id;

select distinct u.id,u.user_name,count(p.id)
from users u 
left join photos p 
on u.id=p.user_id
where p.id is not null  
group by u.id;

select distinct u.id,u.user_name,count(p.id)
from users u 
left join photos p 
on u.id=p.user_id
where p.id is null  
group by u.id;

/*LIKES SECTION*/
insert into likes(user_id,photo_id) values
(1,2),(1,4),(1,5),(1,7),(1,8),(1,9),(1,11),(1,10),
(2,1),(2,3),(2,6),(2,7),(2,11),
(3,1),(3,2),(3,3),(3,4),(3,10),(3,11),
(4,3),(4,6),(4,9),
(7,3),(7,8),(7,9),(7,11),
(9,2),(9,4),(9,6),(9,9),(9,10),(9,11),
(10,1),(10,2),(10,3),(10,4),(10,5),(10,6),(10,7),(10,10);

select * from likes;

select p.id,p.image_url,count(l.user_id) as likes_count
from photos p
left join likes l 
on p.id=l.photo_id
group by p.id,p.image_url;

select p.id,p.image_url,count(l.user_id) as likes_count
from photos p
left join likes l 
on p.id=l.photo_id
where p.id is null group by p.id,p.image_url;

select p.id,p.image_url,count(l.user_id) as likes_count
from photos p
left join likes l 
on p.id=l.photo_id
where p.id is not null group by p.id,p.image_url;

select user_id, count(*) as likes_given
from likes
group by user_id;

select u.id, u.user_name
from users u
left join likes l 
on u.id = l.user_id
where l.user_id is null;

select distinct u.id, u.user_name
from users u
join likes l 
on u.id = l.user_id
where l.user_id is not null;
