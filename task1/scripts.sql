-- Отримати всі завдання певного користувача.
select *
from tasks t
where t.user_id = 1


-- Вибрати завдання за певним статусом.
select *
from tasks t 
where t.status_id = 2


-- Оновити статус конкретного завдання.
update tasks
set status_id = 3
where id = 19


-- Отримати список користувачів, які не мають жодного завдання.
select u.*
from users u 
where u.id not in (
	select t.user_id 
	from tasks t
)


-- Додати нове завдання для конкретного користувача.
insert into tasks (title, description, status_id, user_id)
values ('Create a report', 'Create a report of ... ', 1, 26)


-- Отримати всі завдання, які ще не завершено
select t.*
from tasks t 
where status_id <> 3


-- Видалити конкретне завдання.
delete from tasks 
where id = 2546


-- Знайти користувачів з певною електронною поштою
select u.*
from users u 
where u.email like 'bhansen@example.org'


-- Оновити ім'я користувача.
update users 
set fullname = 'John Smith'
where id = 1000


-- Отримати кількість завдань для кожного статусу
select t.status_id, count(t.id) as count_of_tasks
from tasks t
group by t.status_id 


-- Отримати завдання, які призначені користувачам з певною доменною частиною електронної пошти.
select t.*, u.email as user_email
from tasks t 
join users u on u.id = t.user_id
where u.email like '%@example.org'


-- Отримати список завдань, що не мають опису.
select t.*
from tasks t 
where t.description is null 


-- Вибрати користувачів та їхні завдання, які є у статусі
select t.user_id, u.fullname, u.email, t.id as task_id, t.title, t.description, t.status_id  
from users u 
inner join tasks t on t.user_id = u.id 
where t.status_id = 2


-- Отримати користувачів та кількість їхніх завдань.
select u.id, u.fullname, u.email, COUNT(t.id) as count_of_tasks
from users u 
left join tasks t on t.user_id = u.id 
group by u.id, u.fullname, u.email 


