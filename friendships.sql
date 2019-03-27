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

-- 5. Return the friends of Eli in alphabetical order
select users.first_name as friend_first_name, users.last_name as friend_last_name, users2.first_name, users2.last_name
from users
left join friendships on users.id = friendships.user_id 
inner join users as users2 on friendships.friend_id = users2.id and users2.first_name = "Eli"
order by users.first_name asc;

-- 6. Remove Marky Mark from Eli’s friends.
	-- first we will select to get the id values we need to know
select users2.id as "id", users2.first_name as "first name", users2.last_name as "last name", users.first_name as "friend first", users.last_name as "friend last", friendships.friend_id
from users
left join friendships on users.id = friendships.friend_id and users.first_name = "Marky"
inner join users as users2 on friendships.user_id = users2.id and users2.first_name = "Eli";
	-- Now we know that Eli's ID is 2 and Marky's ID is 5
    -- We can now delete the row in 'friendships' where 5 has 2 as a friend
delete from friendships
where user_id = 2 and friend_id = 5;

-- 7. Return all friendships, displaying just the first and last name of both friends
select users.first_name, users.last_name, users2.first_name as friend_first_name, users2.last_name as friend_last_name
from users
left join friendships on users.id = friendships.user_id
inner join users as users2 on friendships.friend_id = users2.id;