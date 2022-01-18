create table salesperson(
seller_id serial primary key,
first_name VARCHAR(50),
last_name VARCHAR(50),
phone_number VARCHAR(50),
email VARCHAR(100)
);
create table mechanic(
mechanic_id serial primary key,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100),
address VARCHAR(100),
phone_number VARCHAR(50)
);
create table car(
car_serial_number serial primary key,
make VARCHAR(50),
model VARCHAR(50),
car_year VARCHAR(4),
color VARCHAR(30),
is_new BOOLEAN,
car_payment_amount NUMERIC(8,2),
seller_id INT,
foreign key (seller_id) references salesperson(seller_id)
);




create table customer(
customer_id serial primary key,
first_name VARCHAR(50),
last_name VARCHAR(50),
phone_number VARCHAR(100),
email VARCHAR(100),
address VARCHAR(100),
car_serial_number int,
foreign key (car_serial_number) references car(car_serial_number)
);
create table service(
service_id serial primary key,
mechanic_id int,
foreign key (mechanic_id) references mechanic(mechanic_id),
car_serial_number int,
foreign key (car_serial_number) references car(car_serial_number),
service_payment_amount NUMERIC(8,2),
service_description VARCHAR(500)
);
create table part(
part_id serial primary key,
service_id int,
foreign key (service_id) references service(service_id),
part_name VARCHAR(50),
description VARCHAR(50),
price NUMERIC(8,2),
quantity INT
);
create table invoice(
invoice_id serial primary key,
invoice_date timestamp,
seller_id int,
foreign key (seller_id) references salesperson(seller_id),
customer_id int,
foreign key (customer_id) references customer(customer_id),
car_serial_number int,
foreign key (car_serial_number) references car(car_serial_number)
);

insert into salesperson(
first_name,
last_name,
phone_number,
email
) values(
'ricky',
'ricardo',
'(121) 111-5555',
'RickyR@carsales.com'
),(
'Freddy',
'Krugar',
'(322) 121-2442',
'FreddyK@carsales.com'
);
select * from salesperson;
insert into mechanic(
first_name,
last_name,
phone_number,
address,
email
) values(
'Mark',
'Torres',
'(131) 653-1111',
'123 HW Dealership',
'MarkT@carsales.com'
),(
'David',
'Shinn',
'(234) 123-4567)',
'123 HW Dealership',
'DavidS@carsales.com'
)
select * from mechanic;
insert into car(
make,
model,
car_year,
color,
is_new,
car_payment_amount,
seller_id
) values(
'Toyota',
'Carolla',
'1994',
'grey',
true,
999.99,
1
),(
'Honda',
'Accord',
'1994',
'Black',
true,
999.99,
1
),(
'Honda',
'Civic',
'1994',
'red',
false,
499.99,
null
),(
'Toyota',
'Corolla',
'2010',
'Blue',
false,
499.99,
null
);
select * from car;
insert into customer(
first_name,
last_name,
phone_number,
email,
address,
car_serial_number
) values(
'Brian',
'Stanton',
'(555) 555-5555',
'BrianS@carcustomer.com',
'123 Fork Canyon rd',
4
),(
'Mel',
'gibson',
'(666) 666-6666',
'MelG@carcustomer.com',
'432 Curly wind rd',
3
),(
'Alex',
'Garcia',
'112) 234-4567',
'AlexG@carcustomer.com',
'111 Jackson rd',
2
),(
'Alec',
'gavin',
'(238) 111-6767',
'AlecG@carcustomer.com',
'456 High Meadow rd',
1
);
select * from customer;
insert into invoice(
seller_id,
customer_id,
car_serial_number
) values(
1,
4,
1
),( 2,
3,
2
);
select * from invoice
insert into service(
service_payment_amount,
service_description,
car_serial_number,
mechanic_id
) values(
499.99,
'Bushing',
3,
2
),(
299.99,
'Front Wheel alignment',
4,
2
),(
799.99,
'windshield replacement ',
1,
1
),(
999.99,
'Headlights',
2,
1
);

