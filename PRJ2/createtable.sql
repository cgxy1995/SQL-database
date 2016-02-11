rem EE 562 Project 2
rem Ningzhe Jiang
rem jiang85
set serveroutput on;
set feedback off;
create table books (book_id number, book_title varchar2(50), author_id number, year_of_publication number, edition number, status varchar2(20),primary key(book_id));
create table author (author_id number, Name varchar2(30),primary key(author_id));
create table borrower (borrower_id number, name varchar2(30),status varchar2(20),primary key(borrower_id));
create table issue (book_id number, borrower_id number, issue_date date, return_date date,primary key(book_id,borrower_id,issue_date));
create table pending_request (book_id number, requester_id number, request_date date, issue_date date,primary key(book_id,requester_id,request_date));
