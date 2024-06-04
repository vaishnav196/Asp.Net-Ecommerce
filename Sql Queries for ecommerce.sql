use WebEcom;

create table placeorder(
	pid int primary key identity,
	pname varchar(100),
	pcat varchar(100),
	price decimal(9,2),
	qty int,
	pic varchar(100),
	dt varchar(100),
	suser varchar(100),
	perprice decimal(9,2),
	address varchar(100),
	contact varchar(100),
	pstatus varchar(100)
);

create table cart(
	pid int primary key identity,
	pname varchar(100),
	pcat varchar(100),
	price decimal(9,2),
	qty int,
	pic varchar(100),
	dt varchar(100),
	suser varchar(100),
	perprice decimal(9,2)
);

insert into cart values ('Mobile','Electronics',70000,2,'Products/mobile.jpg','01-05-2024','john@gmail.com',35000),
('Pizza','Foods',2000,4,'Products/pizza.jpg','01-05-2024','john@gmail.com',500),('Shirt','Cloths',6000,4,'Products/shirt.jpg','01-05-2024','robin@gmail.com',1500),
('T-Shirt','Cloths',4000,4,'Products/tshirt.jpg','01-05-2024','robin@gmail.com',1000)
use WebEcom;
select * from cart;
/*
insert into placeorder(pid,pname,pcat,price,qty,dt,suser,perprice) select * from cart;
*/
select * into placeorder from cart;

select * from placeorder;
insert into cart values('TV','electronic',20000,2,'Products/tv.jpeg','11-11-2023','john@gmail.com',10000);


drop table placeorder;

truncate table placeorder;
use WebEcom;

alter table placeorder add contact varchar(100);
alter table placeorder drop column pstatus;

alter table placeorder add contact varchar(100), pstatus varchar(100);

alter table placeorder drop column pstatus;

create proc addToCart
@pname varchar(100),
@pcat varchar(100),
@price decimal(9,2),
@qty int ,
@pic varchar(100),
@dt varchar(100),
@suser varchar(100),
@perprice decimal(9,2)
as
begin
 insert into cart values(@pname,@pcat,@price,@qty,@pic,@dt,@suser,@perprice);
end

/*pending*/
create proc FetchProductById
 @pid int
 as 
 begin
 select * from Product where pid=@pid;
 end

 create proc FetchCartBySession
 @suser varchar(100)
 as 
 begin
  select * from Cart where suser=@suser; 
  end

create table Product(
  pid int primary key identity,
  pname varchar(100),
  pcat varchar(100),
  price decimal(9,2),
  pic varchar(100)
);

create proc DeleteCartProduct
   @pid int
   as
   begin
   delete from Cart where pid=@pid;
end
use WebEcom;
create proc DeleteUser
@id int
as 
begin
delete from user_account where id=@id;
end
select * from user_account

drop proc DeleteCartProduct
insert into Product values('Mobile','Electronics','Products/tv.jpeg','11/11/2023',3000);

create  proc  AddProduct
  @pname varchar(100),
  @pcat varchar(100),
  @pic varchar(100),
  @dt varchar(100),
  @price decimal(9,2)
  as 
  begin
  insert Into Product values(@pname,@pcat,@pic,@dt,@price);
end
drop proc AddProduct;

truncate table Product;
select * from Product;
select * from cart;
alter table Product drop column price;
alter table Product add dt varchar(100);
alter table Product add price decimal(9,2);

create table user_account
(
	id int primary key identity,
	acc_user varchar(100),
	acc_pass varchar(100),
	acc_email varchar(100),
	acc_role varchar(100)
);

select * from user_account;

create proc NewUserAccountProc
@acc_user varchar(100),
@acc_pass varchar(100),
@acc_email varchar(100),
@acc_role varchar(100)
As
begin
		insert into user_account values(@acc_user, @acc_pass, @acc_email, @acc_role);
end

insert into user_account values('Admin','Admin@123','admin@gmail.com','Admin');

insert into user_account values('Raj','Raj@123','raj@gmail.com','User');

create proc UserLoginProc
@acc_email varchar(100),
@acc_pass varchar(100)
As 
begin
		select*from user_account where acc_email=@acc_email AND acc_pass=@acc_pass;
end

select * from user_account;
delete from user_account where id=3;

select * from user_account;
select * from placeorder;
truncate table placeorder;
select * from cart;
truncate table placeorder;
delete from cart where pid in (4,5,6);

select * from Product;
select * from user_account;

use WebEcom;

select * from placeorder;
truncate table placeorder;
select @version;