@createtable
@populate
EXEC DBMS_OUTPUT.PUT_LINE('all data populated');
@fun
EXEC DBMS_OUTPUT.PUT_LINE('functions created!');
@trg
EXEC DBMS_OUTPUT.PUT_LINE('triggers created!');
@pro
EXEC DBMS_OUTPUT.PUT_LINE('procedures created!');
----note most data is here
@mydata
--------first execution phase
declare
return_status number;
r number;
begin
pro_print_borrower;
pro_print_fine(to_date('01/03/2013','DD/MM/YYYY'));
return_status := fun_return_book(1,  to_date('02/28/03', 'mm/dd/yy'));
  return_status := fun_return_book(2,  to_date('02/28/03', 'mm/dd/yy'));
  return_status := fun_return_book(4, to_date('02/28/03', 'mm/dd/yy'));
  return_status := fun_return_book(10, to_date('02/28/03', 'mm/dd/yy'));
--r:= fun_return_book(15,to_date('01/08/2012','DD/MM/YYYY'));
end;
/
----show tables
select *
from issue;
select *
from pending_request;
--------second execution phase
declare
cursor ave_cur is
select *
from pending_request;
ave_var ave_cur%rowtype;
average number(10,2);
entryinpending number;
accdays number;
issued number;
maxday number;
borrowerid number;
borrowername varchar2(30);
testdate1 date;
testdate2 date;
testdate3 number;
testtable btable;
return_status number;
issue_status number;
year number;
book number;
issue_any_status number;
begin
pro_listborr_mon(2,'MAR');
pro_listborr_mon(5,'FEB');
pro_listborr;
pro_list_popular;
----------------average time calculation---------------
entryinpending :=0;
accdays := 0;
maxday :=0;
borrowerid:=0;
open ave_cur;
loop
   fetch ave_cur into ave_var;	
   exit when ave_cur%notfound;
   if(ave_var.issue_date is not null) then
      entryinpending := entryinpending +1;
      accdays := accdays + (ave_var.issue_date - ave_var.request_date);
   end if;
end loop;
if(entryinpending=0) then
DBMS_OUTPUT.PUT_LINE('Dont even try to fool me, the divider is 0!');
else
average := accdays/entryinpending;
DBMS_OUTPUT.PUT_LINE('Average wait time is '||average||' days');
end if;
close ave_cur;
---------------longest waiting time calculatino-------------
open ave_cur;
loop
   fetch ave_cur into ave_var;
   exit when ave_cur%notfound;
   if(ave_var.issue_date is not null) then
      if(ave_var.issue_date - ave_var.request_date > maxday)then
         maxday:=ave_var.issue_date - ave_var.request_date;
	 borrowerid:=ave_var.requester_id;
      else
         DBMS_OUTPUT.PUT_LINE('');
      end if;
   else
   DBMS_OUTPUT.PUT_LINE('');
   end if;
end loop;
close ave_cur;
if(borrowerid!=0) then
select B.name into borrowername
from borrower B
where B.borrower_id=borrowerid;
DBMS_OUTPUT.PUT_LINE(borrowername||' with id '||borrowerid||' has waited for the longest time which is '||maxday||' days.');
else 
   DBMS_OUTPUT.PUT_LINE('Dont even try to fool me, no pending books are issued yet, how could I calculate the wait time?');
end if;
end;
/
--select *
--from issue;
--select *
--from pending_request;
@dropall
