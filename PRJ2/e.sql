@d
@c
@p
@fun
EXEC DBMS_OUTPUT.PUT_LINE('functions created!');
@t
@pr
EXEC DBMS_OUTPUT.PUT_LINE('triggers created!');
declare
issued number;
--invalid exception;
--pragma exception_init(invalid,-20001);
begin
issued := fun_issue_book(1,9,TO_DATE('15/10/2012','DD/MM/YYYY'));
issued := fun_issue_book(1,2,TO_DATE('15/10/2013','DD/MM/YYYY'));
issued := fun_issue_book(2,3,TO_DATE('10/10/2013','DD/MM/YYYY'));
issued := fun_issue_book(3,3,TO_DATE('7/10/2013','DD/MM/YYYY'));
issued := fun_issue_book(2,4,TO_DATE('13/10/2013','DD/MM/YYYY'));
issued := fun_issue_book(2,5,TO_DATE('29/09/2013','DD/MM/YYYY'));
end;
/
select *
from issue I1;
select *
from pending_request;
select *
from books;
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
year number;
book number;
begin

issued := fun_return_book(3,TO_DATE('15/10/2013','DD/MM/YYYY'));
issued := fun_return_book(2,TO_DATE('14/02/2013','DD/MM/YYYY'));
issued := fun_issue_anyedition(6,'ARCHITECTURE','CLOIS KICKLIGHTER',TO_DATE('16/10/2013','DD/MM/YYYY'));
issued := fun_issue_anyedition(8,'ARCHITECTURE','CLOIS KICKLIGHTER',TO_DATE('15/10/2013','DD/MM/YYYY'));
issued := fun_issue_anyedition(9,'CALCULUS III','H. ANTON',TO_DATE('21/08/2013','DD/MM/YYYY'));
issued := fun_issue_anyedition(10,'CALCULUS III','H. ANTON',TO_DATE('06/10/2013','DD/MM/YYYY'));
issued := fun_issue_anyedition(11,'CALCULUS III','H. ANTON',TO_DATE('04/10/2013','DD/MM/YYYY'));
issued := fun_return_book(9,TO_DATE('17/10/2013','DD/MM/YYYY'));
issued := fun_issue_book(9,9,TO_DATE('17/10/2013','DD/MM/YYYY'));
issued := fun_return_book(9,TO_DATE('19/10/2013','DD/MM/YYYY'));
issued := fun_issue_book(5,9,TO_DATE('20/10/2013','DD/MM/YYYY'));
issued := fun_issue_book(9,4,TO_DATE('20/10/2013','DD/MM/YYYY'));
issued := fun_issue_book(9,5,TO_DATE('20/10/2013','DD/MM/YYYY'));
issued := fun_issue_book(9,14,TO_DATE('20/10/2013','DD/MM/YYYY'));
issued := fun_return_book(4,TO_DATE('22/10/2013','DD/MM/YYYY'));
pro_print_borrower;
pro_print_fine(to_date('17/10/2013','DD/MM/YYYY'));
pro_listborr_mon(2,'OCT');
pro_listborr;
pro_list_popular;
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
average := accdays/entryinpending;
DBMS_OUTPUT.PUT_LINE('Average wait time is '||average||' days');
close ave_cur;
open ave_cur;
loop
   fetch ave_cur into ave_var;
   exit when ave_cur%notfound;
   if(ave_var.issue_date is not null) then
      if(ave_var.issue_date - ave_var.request_date > maxday)then
         maxday:=ave_var.issue_date - ave_var.request_date;
	 borrowerid:=ave_var.requester_id;
      end if;
   end if;
end loop;
DBMS_OUTPUT.PUT_LINE(borrowerid);
close ave_cur;

select B.name into borrowername
from borrower B
where B.borrower_id=borrowerid;
DBMS_OUTPUT.PUT_LINE(borrowername||' with id '||borrowerid||' has waited for the longest time which is '||maxday||' days.');

end;
/
select *
from issue I1;

select *
from (
       select book_id
       from pending_request
       order by book_id
) where rownum=1;
select *
from pending_request;
--select *
--from books;
--*/
