-- 1. Создать таблицу student с полями student_id serial, first_name varchar, last_name varchar, birthday date, phone varchar
create table student
(
	student_id serial PRIMARY KEY,
	first_name varchar(100),
	last_name varchar(100),
	birthday date,
	phone varchar(20)
)

-- 2. Добавить в таблицу student колонку middle_name varchar
alter table student add middle_name varchar(100)


-- 3. Удалить колонку middle_name
alter table student drop middle_name


-- 4. Переименовать колонку birthday в birth_date
alter table student rename birthday to birth_date


-- 5. Изменить тип данных колонки phone на varchar(32)
alter table student alter column phone set data type varchar(32);

-- 6. Вставить три любых записи с автогенерацией идентификатора
insert into student (first_name, last_name, birth_date, phone)
	values('Алексей', 'Петров', '1987-03-18', '+79627456841'),
	('Надежда', 'Александрова', '1995-04-21', '+7917758865'),
	('Петр', 'Столиков', '1987-03-18', '+7907340537');

select * from student;
-- 7. Удалить все данные из таблицы со сбросом идентификатор в исходное состояние
truncate table student restart identity;