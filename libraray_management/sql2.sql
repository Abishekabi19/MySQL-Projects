create database libraryDB;
use libraryDB;

create table books(book_id int auto_increment primary key,title varchar(225) not null,author varchar(225),genre varchar(100),
published_year year, is_available boolean default true);

create table members(member_id int auto_increment primary key,name varchar(225) not null,email varchar(225),
phone_no varchar(15),join_date date default (current_date));

create table librarians(librarian_id int auto_increment primary key,name varchar(225) not null,email varchar(225),
phone_no varchar(15),hire_date date default (current_date));

create table borrowing(loan_id int auto_increment primary key,book_id int,member_id int,borrow_date date default (current_date),
return_date date,librarian_id int,foreign key(book_id) references books(book_id),foreign key(member_id) references members(member_id),
foreign key(librarian_id) references librarians(librarian_id));

insert into books(book_id,title,author,genre,published_year) values('The great gatsby','F.soott fitzgerald','fiction',1925),
('1984','George orwell','dystopian',1949),('To kill a mockingbird','Haper lee','classic',1960);

insert into members(member_id,name,email,phone_no) values('alen king','alenking@example.com','1234567890'),('alece hofman','alecehofman@example.com','9876543210');

insert into librarians(librarian_id,name,email,phone_no) values('nail horn','nail@example.com','4567891230'),('garden mcgraw','garden@example.com','7894561230');

insert into borrowing(book_id,member_id,librarian_id) values(1,1,1);
update books set is_available=false where book_id=1;

update borrowing set return_date=current_date where loan_id=1;
update books set is_available=true where book_id=1;

select * from books where is_available=true;
select m.name,b.title,br.borrow_date,br.return_date from borrowing br
join members m on br.member_id=m.member_id 
join books b on br.book_id=b.book_id where m.member_id=1;

select m.name,b.title,br.borrow_date from borrowing br 
join members m on br.member_id=m.member_id
join books b on br.book_id=b.book_id
where br.return_date is null and br.borrow_date<current_date-interval 15 day;

select title,genre,published_year from books where author='George orwell'; 
select title,author,published_year from books where published_year>1926; 

select count(*) as total_book from books;

select m.name,br.borrow_date,br.return_date from borrowing br
join members m on br.member_id=m.member_id 
join books b on br.book_id=b.book_id where b.title='1984';

select b.title,br.borrow_date,br.return_date from borrowing br
join books b on br.book_id=b.book_id where br.member_id=1;

select title,author,published_year from books where genre='fiction' and is_available=true;

select m.name,count(br.loan_id) as total_books_borrowed from borrowing br 
join members m on br.member_id=m.member_id
group by m.name;

select m.name,b.title,br.borrow_date from borrowing br 
join members m on br.member_id=m.member_id
join books b on br.book_id=b.book_id
where br.return_date is null and br.borrow_date<current_date-interval 30 day;

select l.name,count(br.loan_id) as total_borrowings
from borrowing br join librarians l on br.librarian_id=l.librarian_id
group by l.name order by total_borrowings desc;

select m.name,b.title,br.borrow_date from borrowing br 
join members m on br.member_id=m.member_id
join books b on br.book_id=b.book_id
where br.return_date is null;