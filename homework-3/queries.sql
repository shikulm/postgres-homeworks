-- Напишите запросы, которые выводят следующую информацию:
-- 1. Название компании заказчика (company_name из табл. customers) и ФИО сотрудника, работающего над заказом этой компании (см таблицу employees),
-- когда и заказчик и сотрудник зарегистрированы в городе London, а доставку заказа ведет компания United Package (company_name в табл shippers)
select cus.company_name, concat(emp.first_name, ' ', emp.last_name) as FIO
from public.customers as cus join public.orders as ord using(customer_id) join public.employees as emp using(employee_id)
	join public.shippers sh on sh.shipper_id=ord.ship_via
where emp.city = 'London' and cus.city = 'London' and sh.company_name = 'United Package'


-- 2. Наименование продукта, количество товара (product_name и units_in_stock в табл products),
-- имя поставщика и его телефон (contact_name и phone в табл suppliers) для таких продуктов,
-- которые не сняты с продажи (поле discontinued) и которых меньше 25 и которые в категориях Dairy Products и Condiments.
-- Отсортировать результат по возрастанию количества оставшегося товара.
select p.product_name, p.units_in_stock, s.contact_name, s.phone
from public.products as p join public.suppliers as s using(supplier_id) join public.categories as c using(category_id)
where p.discontinued = 0 and p.units_in_stock < 25 and c.category_name in ('Dairy Products', 'Condiments')
order by p.units_in_stock


-- 3. Список компаний заказчиков (company_name из табл customers), не сделавших ни одного заказа
select company_name
from public.customers
where customer_id not in (select customer_id from orders)

-- 4. уникальные названия продуктов, которых заказано ровно 10 единиц (количество заказанных единиц см в колонке quantity табл order_details)
-- Этот запрос написать именно с использованием подзапроса.
select p.product_name
from public.products as p
where p.product_id in
	(select product_id
	 from public.order_details
	 where quantity = 10)
