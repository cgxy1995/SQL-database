create or replace trigger trg_charge 
after insert on issue
referencing NEW as new
for each row
begin
update books B
set B.status='charged'
where B.book_id=:new.book_id;
end;
/
create or replace trigger trg_maxbooks
before insert on issue
referencing NEW as new
for each row
declare
num1 number;
status varchar2(10);
exp_one exception;
begin
select count(*) into num1
from issue I
where I.borrower_id=:new.borrower_id and I.return_date is null;
select B.status into status
from borrower B
where B.borrower_id=:new.borrower_id;
if((num1>=2 and status='student') or (num1>=3 and status='faculty')) then
raise exp_one;
end if;
exception 
when exp_one then
     DBMS_OUTPUT.PUT_LINE(:new.borrower_id||' cannot borrow more books');
     raise_application_error(-20001,'book borrow limit reached'); 
end;
/
create or replace trigger trg_notcharge
after update on issue
referencing NEW as new
for each row
begin
    update books
    set books.status='not charged'
    where books.book_id=:new.book_id;
end;
/
---as I stated in class, trg_renew is not needed at all, its mechanism has been coverd by other triggers and functions
---as I stated in class, trg_renew is not needed at all, its mechanism has been coverd by other triggers and functions
---as I stated in class, trg_renew is not needed at all, its mechanism has been coverd by other triggers and functions
---as I stated in class, trg_renew is not needed at all, its mechanism has been coverd by other triggers and functions
---as I stated in class, trg_renew is not needed at all, its mechanism has been coverd by other triggers and functions

create or replace trigger trg_renew
after insert on issue
referencing NEW as new 

begin
    DBMS_OUTPUT.PUT_LINE('');
end;
/
---as I stated in class, trg_renew is not needed at all, its mechanism has been coverd by other triggers and functions
---as I stated in class, trg_renew is not needed at all, its mechanism has been coverd by other triggers and functions
---as I stated in class, trg_renew is not needed at all, its mechanism has been coverd by other triggers and functions
