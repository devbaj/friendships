use friendships;

select users.first_name, users.last_name, users2.first_name as friend_first_name, users2.last_name as friend_last_name
from users
left join friendships on users.id = friendships.user_id
inner join users as users2 on users2.id = friendships.friend_id; -- check w instructor to see; left join added null results obviously, inner join seems more appropriate

-- 1. Return all users who are friends with Kermit, display their names in results
select users.first_name, users.last_name, users2.first_name as friend_first_name, users2.last_name as friend_last_name
from users
left join friendships on users.id = friendships.friend_id and users.first_name = "Kermit"
inner join users as users2 on friendships.user_id = users2.id;

-- 2. Return the count of all friendships
select count(friendships.id) as "Number of Friendships"
from friendships;

-- 3. Find out who has the most friends and return the count of their friends.
select users.first_name, users.last_name, count(friendships.id) as "Number of Friends"
from users
join friendships on users.id = friendships.user_id
group by users.id
order by "Number of Friends" desc limit 1;

-- 4. Create a new user and make them friends with Eli Byers, Kermit The Frog, and Marky Mark
insert into users (first_name, last_name)
values ("Brett", "Jory");
insert into friendships (user_id, friend_id)
values (6, 2),(6,4),(6,5);