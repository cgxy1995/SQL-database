create type rtable as object(
id number,
year number
);
/
create type btable as table of rtable;
/
create or replace function fun_most_popular(month in varchar2)
return btable is finaltable btable;
bookname varchar2(50);
themonth date;
yearnum number;
monthnum number;
type maxnum1 is table of number index by binary_integer;
type pair is table of number;
type sparray is table of pair index by binary_integer;
type eachyear is table of sparray index by binary_integer;
maxnum maxnum1;
bookarr sparray;
yeararr eachyear;
cursor issue_cur is
select *
from issue;
issue_var issue_cur%rowtype;
begin
    finaltable := btable();
    --maxnum:=0;
    themonth:=to_date(month,'MM');
    for i in 1..100
    loop
       bookarr(i):=pair(0,0);
    end loop;
    for i in 1950..2050
    loop
       yeararr(i):=bookarr;
       maxnum(i):=0;
    end loop;
    open issue_cur;
    loop
        fetch issue_cur into issue_var;
	exit when issue_cur%notfound;
	if(to_date(to_char(issue_var.issue_date,'MON'),'MM')=themonth) then
	   select extract(year from issue_var.issue_date) into yearnum
	   from dual;
	   --bookarr(issue_var.book_id)(1):=bookarr(issue_var.book_id)(1)+1;
	   --bookarr(issue_var.book_id)(2):=yearnum;
	   --yeararray(yearnum)(issue_var.book_id)(1):=yeararray(yearnum)(issue_var.book_id)(1)+1;
	   yeararr(yearnum)(issue_var.book_id)(1):=yeararr(yearnum)(issue_var.book_id)(1)+1;
	end if;
    end loop;
    close issue_cur;

    for i in 1950..2050
    loop
    for j in bookarr.first..bookarr.last
    loop
       if(yeararr(i)(j)(1)!=0) then
       	  --DBMS_OUTPUT.PUT_LINE('book '||j||' is counted '||yeararr(i)(j)(1)||' times in '||i);	  
	  if(yeararr(i)(j)(1)>maxnum(i)) then
	    maxnum(i):=yeararr(i)(j)(1);
	  end if;
       end if;
    end loop;
    end loop;
    for i in 1950..2050
    loop
    for j in bookarr.first..bookarr.last
    loop
       if(yeararr(i)(j)(1)=maxnum(i) and maxnum(i)!=0) then
          select B.book_title into bookname
	  from books B
	  where B.book_id=j;
          DBMS_OUTPUT.PUT_LINE('in '||month||'-'||i||', book id '||j||' most popular');
	  finaltable.extend(1);
	  finaltable(finaltable.count):=rtable(j,i);
	  
       end if;
    end loop;
    end loop;
return finaltable;
end;
/
create or replace function fun_issue_anyedition(borrower_id2 in number, book_title2 in varchar2, author_name2 in varchar2, current_date2 in date)
return number is issued number;
book varchar2(50);
book2 varchar2(50);
author_name varchar2(30);
author_id2 number;
book_id3 number;
book_id2 number;
book_status varchar2(20);
thedate date;


cursor allbook_cur is
select B.book_id
from books B
order by B.edition DESC;

cursor earliest_cur is
select I.book_id
from issue I
where I.return_date is null and I.issue_date is not null
order by I.issue_date;

begin

   open allbook_cur;
   open earliest_cur;

   loop
      fetch allbook_cur into book_id3;
      exit when allbook_cur%notfound;
      select B.book_title into book
      from books B
      where B.book_id=book_id3;

      select B.author_id into author_id2
      from books B
      where B.book_id=book_id3;

      select A.name into author_name
      from author A
      where A.author_id=author_id2;

      select B.status into book_status
      from books B
      where B.book_id=book_id3;
      --DBMS_OUTPUT.PUT_LINE('book=' || book || ' '|| book_title2|| ' ' || author_name || ' ' || author_name2 || ' ' || book_status);

      if((book=book_title2) and (author_name = author_name2) and (book_status='not charged'))then    
          issued:=fun_issue_book(borrower_id2, book_id3, current_date2);
	  close allbook_cur;
   	  close earliest_cur;
	  return issued;
      end if;

   end loop;

   loop 
      fetch earliest_cur into book_id2;
      exit when earliest_cur%notfound;
      select B.book_title into book2
      from books B
      where B.book_id=book_id2;
      --dbms_output.put_line('book id ' || book_id2);
      if (book2=book_title2) then
          issued:=fun_issue_book(borrower_id2, book_id2, current_date2);
	  close allbook_cur;
   	  close earliest_cur;
	  return issued;
      end if;
   end loop;

   return 0;
end;
/

create or replace function fun_issue_book(borrower_id2 IN number, book_id2 IN number, current_date2 IN date)
return number is issued number;
book varchar2(50);
cursor pending is
select *
from pending_request;
pending_var pending%rowtype;
invalid exception;
flag number;
pragma exception_init(invalid,-20001);
begin
   flag:=0;
   select B1.status into book
       from books B1
       where B1.book_id=book_id2;
   if(book='not charged')  then
    insert into issue(book_id, borrower_id, issue_date, return_date)
    values(book_id2, borrower_id2, current_date2,null);
    return 1;
    else
    ---------the following loop avoid duplicates tuples in pending request
    open pending;
    loop
        fetch pending into pending_var;
        exit when pending%notfound;
        if(pending_var.requester_id=borrower_id2 and pending_var.book_id=book_id2 and pending_var.issue_date is null) then
	   flag:=1;
	   exit;
        end if;
    end loop;
    close pending;
    if(flag=0) then
        insert into pending_request(book_id, requester_id, request_date, issue_date)
    	values(book_id2, borrower_id2, current_date2,null);
    end if;
   END IF;
return 0;
   exception
   when invalid then
   flag:=0;
   open pending;
    loop
      fetch pending into pending_var;
      exit when pending%notfound;
      if(pending_var.requester_id=borrower_id2 and pending_var.book_id=book_id2 and pending_var.issue_date is null) then
         flag:=1;
      end if;
   end loop;
   if (flag=0) then
   --dbms_output.put_line('rollback qidong');
   insert into pending_request(book_id, requester_id, request_date,issue_date)
   values(book_id2,borrower_id2,current_date2,null);
   end if;
   close pending;
   return 0;
end;
/
create or replace function fun_return_book(book_id2 IN number, return_date2 in date)
return number is issued number;
cursor p_book_id is
    select *
    from pending_request P
    order by P.request_date;
cursor p_borrower_id is
    select *
    from pending_request P
    order by P.request_date;
lp_borrower_id p_borrower_id%rowtype;
lp_book_id p_book_id%rowtype;
cursor issue_cur is
    select *
    from issue;
issue_var issue_cur%rowtype;
rid number;
thebook number;
returner number;
rvalue number;
limit_book_id number;
bstatus varchar2(20);
theday date;
flag number;
begin
    flag:=0;
    open issue_cur;
    loop
       fetch issue_cur into issue_var;
       exit when issue_cur%notfound;
       if(issue_var.book_id=book_id2 and issue_var.return_date is null) then
          flag:=1;
       end if;
    end loop;
    if(flag=0) then
       return 0;
    end if;
    -----the above loop, cursor and flag ensure that when "a book which is not currently borrowed is returned", there will not be any no_data_found error 
    select I.borrower_id into returner
    from issue I
    where I.book_id=book_id2 and I.return_date is null;
    update issue I
    set I.return_date=return_date2
    where I.book_id=book_id2 and I.return_date is null;
    open p_book_id;
    open p_borrower_id;
    loop 
       rvalue:=0;
       fetch p_book_id into lp_book_id;
       exit when p_book_id%notfound;

       if(lp_book_id.book_id=book_id2 and lp_book_id.issue_date is null)then
	   if(lp_book_id.issue_date is null) then
	      rvalue:=fun_issue_book(lp_book_id.requester_id, book_id2, return_date2);	  
	      --DBMS_OUTPUT.PUT_LINE('wtf');
            
	   select book_id into thebook
	  from(select book_id
	       from pending_request P
	       where P.requester_id=lp_book_id.requester_id and P.issue_date is null
	       order by P.request_date
	       ) 
	       where rownum=1; 
                
	       if(rvalue=1) then
                  DBMS_OUTPUT.PUT_LINE(lp_book_id.requester_id||' wants '||book_id2);
		  update pending_request P
	          set P.issue_date=return_date2
	          where P.book_id=book_id2 and P.requester_id=lp_book_id.requester_id and P.issue_date is null;
		  exit;
               end if;
	   end if;
       end if;
    end loop;
    --DBMS_OUTPUT.PUT_LINE(returner || ' returns ' ||book_id2);
    -----------check if returner can take a book from pending request, his number of borrowed books is less than 2/3
    loop
       rvalue:=0;
       fetch p_borrower_id into lp_borrower_id;
       exit when p_borrower_id%notfound;
       if(lp_borrower_id.requester_id=returner and lp_borrower_id.issue_date is null) then
          --select P.book_id into limit_book_id
          --from pending_request P
          --where P.requester_id=lp_borrower_id;
	  if(lp_borrower_id.issue_date is null) then
             rvalue:=fun_issue_book(lp_borrower_id.requester_id, lp_borrower_id.book_id, return_date2);
	     --DBMS_OUTPUT.PUT_LINE('try '||lp_borrower_id.requester_id||' '||lp_borrower_id.book_id||' '||rvalue);
	  select book_id into thebook
	  from(select book_id
	       from pending_request P
	       where P.requester_id=lp_borrower_id.requester_id and P.issue_date is null
	       order by P.request_date
	       )
	  where rownum=1;
	  if(rvalue=1) then
	     DBMS_OUTPUT.PUT_LINE(lp_borrower_id.requester_id||' wants f '||thebook);
	     update pending_request P
	     set P.issue_date=return_date2
	     where P.book_id=thebook and P.requester_id=lp_borrower_id.requester_id and P.issue_date is null;
	     exit;
          end if;
          --DBMS_OUTPUT.PUT_LINE('the book '||thebook);
/*
          update (select *
	  from pending_request P
	  order by P.request_date
	  ) P
	  set P.issue_date=return_date2
	  where P.requester_id=lp_borrower_id.requester_id and P.issue_date is null;
*/
          end if;
       end if;
       exit when lp_borrower_id.book_id=book_id2 and lp_borrower_id.issue_date is null;
    end loop;
    close p_book_id;
    close p_borrower_id;
return 1;
end;
/
