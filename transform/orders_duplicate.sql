-- RUN SCRIPT ON DATABASE (POSTGRES IN THIS CASE)

create table if not exists orders_duplicate(
    order_id int,
    order_status varchar(30),
    last_updated timestamp
);

insert into orders_duplicate
    values(1, 'Backordered', '2020-06-01');
insert into orders_duplicate
    values(1, 'Shipped', '2020-06-09');
insert into orders_duplicate
    values(2, 'Shipped', '2020-07-11');
insert into orders_duplicate
    values(1, 'Shipped', '2020-06-09');
insert into orders_duplicate 
    values(3, 'Shipped', '2020-07-12');
