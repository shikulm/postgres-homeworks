"""Скрипт для заполнения данными таблиц в БД Postgres."""
import psycopg2
import os


def import_table_from_file(conn: psycopg2.connect, table_name: str, filename: str) -> None:
    """Функция для импорта данных в таблицу из файла"""
    with conn:
        with open(filename, 'r', encoding="utf-8") as file:
            ins_lines = file.readlines()
            #  Получаем список с именами колонок (без кавычек)
            columns_list = ins_lines[0].replace('"', '').rstrip()
            with conn.cursor() as cur:
                for insert_values_id in range(1, len(ins_lines)):
                    insert_values = ins_lines[insert_values_id].replace("'", "''").replace('"', "'").rstrip()
                    sql = f"INSERT INTO {table_name} ({columns_list}) VALUES({insert_values})"
                    cur.execute(sql)


try:
    conn = psycopg2.connect(host='localhost', database='north', user='postgres', password='12345')
    import_table_from_file(conn, 'customers', os.path.join("north_data", "customers_data.csv"))
    import_table_from_file(conn, 'employees', os.path.join("north_data", "employees_data.csv"))
    import_table_from_file(conn, 'orders', os.path.join("north_data", "orders_data.csv"))
finally:
    conn.close()



