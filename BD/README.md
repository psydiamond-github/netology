# Домашнее задание к занятию «Базы данных»
## Слынько Дмитрий Юриевич

### Задание 1

Опишите не менее семи таблиц, из которых состоит база данных:

- какие данные хранятся в этих таблицах;
- какой тип данных у столбцов в этих таблицах, если данные хранятся в PostgreSQL.

Приведите решение к следующему виду:

Сотрудники (

- идентификатор, первичный ключ, serial,
- фамилия varchar(50),
- ...
- идентификатор структурного подразделения, внешний ключ, integer).

### Решение 1


```
employees (

employees_id primary_key,

first_name varchar(50),

middle_name varchar(50),

last_name varchar(50),

position_id integer,

structure_id integer,

salary integer,

date_of_hiring date,

date_of_dismissal date,

project_id integer,

)
```
---
```
position (

position_id primary_key

position_name varchar(50)

)
```

---
```
divisions_type (

divisions_type_id primary_key

divisions_name varchar(50)

)
```
---
```
structure (

structure_id primary_key

structure_name varchar(50),

divisions_type_id integer,

branch_address_id integer

)
```
---
```
branch_address (

branch_address_id primary_key

branch_address_name varchar(100),

city_id integer,

region_id integer

)
```
---

```
project (

project_id primary_key

project_name varchar(50)

)
```
---
```
city (

city_id primary_key

city_name varchar(50)

)

```
---

```
region (

region_id primary_key

region_name varchar(50)

)
```

---