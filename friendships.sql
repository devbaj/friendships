use friendships;

select users.first_name, users.last_name, users2.first_name as friend_first_name, users2.last_name as friend_last_name
from users
left join friendships on users.id = friendships.user_id
inner join users as users2 on users2.id = friendships.friend_id; -- check w instructor to see; left join added null results obviously, inner join seems more appropriate

-- return all users who are friends with Kermit, display their names in results
select users.first_name, users.last_name, users2.first_name as friend_first_name, users2.last_name as friend_last_name
from users
left join friendships on users.id = friendships.friend_id and users.first_name = "Kermit"
inner join users as users2 on friendships.user_id = users2.id;

