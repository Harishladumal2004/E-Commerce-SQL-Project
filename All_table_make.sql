create database if not exists E_Commerce_Sales;
USE E_Commerce_Sales;

CREATE TABLE  customer_Table(
  
     customer_id int auto_increment primary key ,
     customer_name varchar(100),
     email varchar(100) unique ,
     phone varchar(15),
     age int ,
     city varchar(100),
     country varchar(100),
     registration_date date 

);

CREATE TABLE  Categorie_Table (


      category_id int auto_increment primary key ,
      category_name varchar(100)
    

);

CREATE TABLE  product_Table (
       
       
       product_id int auto_increment primary key ,
       product_name varchar (100),
       category_id int ,
       brand varchar(100),
       price float ,
	   stock_quantity int ,
       launch_date date,
	foreign key(category_id) references Categorie_Table(category_id)

);



CREATE TABLE Order_Table(

    order_id int auto_increment  primary key ,
    customer_id int ,
    order_name varchar(100),
    order_satus varchar(50),
    payment_method varchar(100),
    total_amount double ,
    foreign key (customer_id) references customer_Table(customer_id)

);

CREATE TABLE Order_Item_Table (
    item_id int auto_increment primary key ,
    order_id int ,
    product_id int ,
    quantity int ,
    item_price float,
    
    foreign key (order_id) references  Order_Table(order_id),
    foreign key (product_id) references product_Table (product_id)
);