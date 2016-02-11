/*
insert into books(book_id, book_title, author_id, year_of_publication, edition, status)
values(1,'data management',1,1991,1,'not charged');
insert into books(book_id, book_title, author_id, year_of_publication, edition, status)
values(2,'data management',1,1993,2,'not charged');
insert into books(book_id, book_title, author_id, year_of_publication, edition, status)
values(3,'data management',1,2000,3,'not charged');
insert into books(book_id, book_title, author_id, year_of_publication, edition, status)
values(4,'calculus 1',2,1994,6,'not charged');
insert into books(book_id, book_title, author_id, year_of_publication, edition, status)
values(5,'calculus 2',2,1994,6,'not charged');
insert into books(book_id, book_title, author_id, year_of_publication, edition, status)
values(6,'calculus 3',2,1994,6,'not charged');
insert into books(book_id, book_title, author_id, year_of_publication, edition, status)
values(7,'IEEE Multimedia',4,2005,1,'not charged');
insert into books(book_id, book_title, author_id, year_of_publication, edition, status)
values(8,'Data Structure',5,1997,4,'not charged');
insert into books(book_id, book_title, author_id, year_of_publication, edition, status)
values(9,'Mis management',1,2000,3,'not charged');
insert into books(book_id, book_title, author_id, year_of_publication, edition, status)
values(10,'Xiyouji',7,1345,1,'not charged');
insert into books(book_id, book_title, author_id, year_of_publication, edition, status)
values(11,'Shendiaoxialv',6,1972,1,'not charged');



insert into author(author_id, name)
values(1,'C.J.Dates');
insert into author(author_id, name)
values(2,'H.Anton');
insert into author(author_id, name)
values(3,'Oracle Press');
insert into author(author_id, name)
values(4,'IEEE');
insert into author(author_id, name)
values(5,'W.Gates');
insert into author(author_id, name)
values(6,'Jin yong');
insert into author(author_id, name)
values(7,'Wu Chengen');

insert into borrower(borrower_id,name,status)
values(1,'Han Meimei','student');
insert into borrower(borrower_id,name,status)
values(2,'Li Lei','student');
insert into borrower(borrower_id,name,status)
values(3,'Meyer','faculty');
insert into borrower(borrower_id,name,status)
values(4,'Giwan','faculty');
insert into borrower(borrower_id,name,status)
values(5,'Carson','student');
*/
-- Insert records into Author
insert into Author values(1,'C.J. DATES');
insert into Author values(2,'H. ANTON');
insert into Author values(3,'ORACLE PRESS');
insert into Author values(4,'IEEE');
insert into Author values(5,'C.J. CATES');
insert into Author values(6,'W. GATES');
insert into Author values(7,'CLOIS KICKLIGHTER');
insert into Author values(8,'J.R.R. TOLKIEN');
insert into Author values(9,'TOM CLANCY');
insert into Author values(10,'ROGER ZELAZNY');

-- Insert records into Books
insert into Books values(1,'DATA MANAGEMENT',1,1998,3,'not charged');
insert into Books values(2,'CALCULUS',2,1995,7,'not charged');
insert into Books values(3,'ORACLE',3,1999,8,'not charged');
insert into Books values(4,'IEEE MULTIMEDIA',4,2001,1,'not charged');
insert into Books values(5,'MIS MANAGEMENT',5,1990,1,'not charged');
insert into Books values(6,'CALCULUS II',2,1997,3,'not charged');
insert into Books values(7,'DATA STRUCTURE',6,1992,1,'not charged');
insert into Books values(8,'CALCULUS III',2,1999,1,'not charged');
insert into Books values(9,'CALCULUS III',2,2000,2,'not charged');
insert into Books values(10,'ARCHITECTURE',7,1977,1,'not charged');
insert into Books values(11,'ARCHITECTURE',7,1980,2,'not charged');
insert into Books values(12,'ARCHITECTURE',7,1985,3,'not charged');
insert into Books values(13,'ARCHITECTURE',7,1990,4,'not charged');
insert into Books values(14,'ARCHITECTURE',7,1995,5,'not charged');
insert into Books values(15,'ARCHITECTURE',7,2000,6,'not charged');
insert into Books values(16,'THE HOBBIT',8,1960,1,'not charged');
insert into Books values(17,'THE BEAR AND THE DRAGON',9,2000,1,'not
charged');
insert into Books values(18,'NINE PRINCES IN AMBER',10,1970,1,'not
charged');

-- Insert records into Borrower
insert into Borrower values(1,'BRAD KICKLIGHTER','student');
insert into Borrower values(2,'JOE STUDENT','student');
insert into Borrower values(3,'GEDDY LEE','student');
insert into Borrower values(4,'JOE FACULTY','faculty');
insert into Borrower values(5,'ALBERT EINSTEIN','faculty');
insert into Borrower values(6,'MIKE POWELL','student');
insert into Borrower values(7,'DAVID GOWER','faculty');
insert into Borrower values(8,'ALBERT SUNARTO','student');
insert into Borrower values(9,'GEOFFERY BYCOTT','faculty');
insert into Borrower values(10,'JOHN KACSZYCA','student');
insert into Borrower values(11,'IAN LAMB','faculty');
insert into Borrower values(12,'ANTONIO AKE','student');
select *
from books;
select *
from author;
select *
from borrower;
