-- Create & Delete Database--
Create Database learning;
Use learning;
 
Drop Database learning;

-- Create Table --
Create Database learning;
Use learning;

create table customer(
custid int,
custname varchar(100),
gender char(1),
age int,
city varchar(20),
dob date
);

-- Datatype ---
-- int, char(fixed length), varchar(length vary),
-- date, decimal
-- -------------------------------  --


-- Insert data into table --
select * from customer;

insert into customer values(1,'Sonal Sonawane', 'F', 27, 'Dombivli', current_date());
insert into customer values(2,'Sakshi Sonawane', 'F', 19, 'Dombivli', '2003-08-07');
insert into customer values(3,'Revati Sonawane', 'F', 22, 'Kalyan', '2002-06-21'),
						   (4,'Chandrakant', 'F', 19, 'Vashi', '1967-05-01');

select * from customer;