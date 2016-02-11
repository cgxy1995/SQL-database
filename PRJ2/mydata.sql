declare
return_status number;
issue_status number;
issue_any_status number;
begin
/*issue_status := fun_issue_book(2, 1, to_date('02/11/12','MM/DD/YY'));  
  issue_status := fun_issue_book(2, 3, to_date('02/15/12','MM/DD/YY'));  
  issue_status := fun_issue_book(2, 6, to_date('02/15/12','MM/DD/YY'));    
  issue_status := fun_issue_book(3, 3, to_date('02/16/12','MM/DD/YY'));  
  issue_status := fun_issue_book(3, 5, to_date('02/18/12','MM/DD/YY'));  
  issue_status := fun_issue_book(3, 8, to_date('02/18/12','MM/DD/YY')); 
  issue_status := fun_issue_book(4, 2, to_date('02/19/12','MM/DD/YY')); 
  issue_status := fun_issue_book(4, 4, to_date('02/19/12','MM/DD/YY')); 
  issue_status := fun_issue_book(4, 7, to_date('02/19/12','MM/DD/YY'));  
  issue_status := fun_issue_book(4, 3, to_date('02/20/12','MM/DD/YY'));  
  issue_status := fun_issue_book(5, 3, to_date('02/21/12','MM/DD/YY'));

  return_status := fun_return_book(3, to_date('02/21/12','MM/DD/YY')); 

  return_status := fun_return_book(1, to_date('02/21/12','MM/DD/YY')); 
  return_status := fun_return_book(5, to_date('02/22/12','MM/DD/YY'));  
  return_status := fun_return_book(3, to_date('02/25/12','MM/DD/YY')); 
  return_status := fun_return_book(8, to_date('02/27/12','MM/DD/YY'));
  return_status := fun_return_book(3, to_date('02/28/12','MM/DD/YY'));
  return_status := fun_return_book(3, to_date('03/02/12','MM/DD/YY'));
  
  issue_status := fun_issue_book(1, 10, to_date('03/21/12','MM/DD/YY'));
  issue_status := fun_issue_book(5, 10, to_date('03/22/12','MM/DD/YY'));
  issue_status := fun_issue_book(8, 3, to_date('03/27/12','MM/DD/YY'));
  return_status := fun_return_book(10, to_date('03/27/12','MM/DD/YY'));
   return_status := fun_return_book(3, to_date('03/28/12','MM/DD/YY'));

  return_status := fun_return_book(10, to_date('04/03/12','MM/DD/YY'));
  issue_status := fun_issue_book(12, 10, to_date('04/03/12','MM/DD/YY'));
  issue_status := fun_issue_book(5, 10, to_date('04/03/12','MM/DD/YY'));
  return_status := fun_return_book(10, to_date('04/08/12','MM/DD/YY'));
  issue_status := fun_issue_book(5, 10, to_date('04/08/12','MM/DD/YY'));
  issue_status := fun_issue_book(2, 10, to_date('04/09/12','MM/DD/YY'));
  return_status := fun_return_book(10, to_date('04/13/12','MM/DD/YY'));
  
  issue_status := fun_issue_book(5, 10, to_date('04/13/12','MM/DD/YY'));
  issue_status := fun_issue_book(12, 15, to_date('04/13/12','MM/DD/YY'));
  issue_status := fun_issue_book(5, 9, to_date('04/15/12','MM/DD/YY'));
  issue_status := fun_issue_book(5, 1, to_date('04/18/12','MM/DD/YY'));
  return_status := fun_return_book(10, to_date('05/20/12','MM/DD/YY'));
  issue_status := fun_issue_book(2, 11, to_date('05/20/12','MM/DD/YY'));

  return_status := fun_return_book(9, to_date('06/13/12','MM/DD/YY'));
  return_status := fun_return_book(1, to_date('06/13/12','MM/DD/YY'));
  return_status := fun_return_book(11, to_date('07/20/12','MM/DD/YY'));
  issue_status := fun_issue_book(6, 15, to_date('07/21/12','MM/DD/YY'));
  issue_status := fun_issue_book(11, 14, to_date('07/23/12','MM/DD/YY'));
  issue_status := fun_issue_book(13, 14, to_date('07/24/12','MM/DD/YY'));
  return_status := fun_return_book(11, to_date('07/20/12','MM/DD/YY'));
  --issue any edition------------------------------------------------------------------------
  DBMS_OUTPUT.PUT_LINE('Issue book through fun_issue_anyedition(borrower_id, book_title, author_name, request_date): ');

  issue_any_status := fun_issue_anyedition(2, 'DATA MANAGEMENT', 'C.J. DATES', TO_DATE('06/03/13', 'mm/dd/yy'));
  issue_any_status := fun_issue_anyedition(4, 'CALCULUS', 'H. ANTON', TO_DATE('05/04/13', 'mm/dd/yy'));

  issue_any_status := fun_issue_anyedition(5, 'ORACLE', 'ORACLE PRESS', TO_DATE('04/04/13', 'mm/dd/yy'));

  issue_any_status := fun_issue_anyedition(10, 'IEEE MULTIMEDIA', 'IEEE', TO_DATE('04/01/13', 'mm/dd/yy'));
  
  issue_any_status := fun_issue_anyedition(2, 'MIS MANAGEMENT', 'C.J. CATES', TO_DATE('06/03/13', 'mm/dd/yy'));

  issue_any_status := fun_issue_anyedition(4, 'CALCULUS II', 'H. ANTON', TO_DATE('06/04/13', 'mm/dd/yy'));
  
  issue_any_status := fun_issue_anyedition(10, 'ORACLE', 'ORACLE PRESS', TO_DATE('04/04/13', 'mm/dd/yy'));
  
  issue_any_status := fun_issue_anyedition(5, 'IEEE MULTIMEDIA', 'IEEE', TO_DATE('03/26/13', 'mm/dd/yy'));
  
  issue_any_status := fun_issue_anyedition(1, 'DATA STRUCTURE', 'W. GATES', TO_DATE('04/03/13', 'mm/dd/yy'));
  
  issue_any_status := fun_issue_anyedition(4, 'CALCULUS III', 'H. ANTON', TO_DATE('05/04/13', 'mm/dd/yy'));

  issue_any_status := fun_issue_anyedition(11, 'ORACLE', 'ORACLE PRESS', TO_DATE('04/08/13', 'mm/dd/yy'));
  
  issue_any_status := fun_issue_anyedition(6, 'IEEE MULTIMEDIA', 'IEEE', TO_DATE('03/17/13', 'mm/dd/yy'));*/

-- initialize issue and pending_request
  DBMS_OUTPUT.PUT_LINE('Initialize Issue and Pending_request (fun_issue_book(borrower__id, book_id, request_date)): ');
  -- 2012----------------------------
  issue_status := fun_issue_book(1, 1, to_date('02/10/03','MM/DD/YY'));  
  issue_status := fun_issue_book(2, 2, to_date('02/10/03','MM/DD/YY'));  
  issue_status := fun_issue_book(3, 3, to_date('02/10/03','MM/DD/YY'));    
  issue_status := fun_issue_book(4, 4, to_date('02/10/03','MM/DD/YY'));  
  issue_status := fun_issue_book(5, 5, to_date('02/10/03','MM/DD/YY'));  
  issue_status := fun_issue_book(6, 6, to_date('02/10/03','MM/DD/YY'));
  issue_status := fun_issue_book(7, 1, to_date('02/11/03','MM/DD/YY'));
  issue_status := fun_issue_book(8, 2, to_date('02/12/03','MM/DD/YY'));  
  issue_status := fun_issue_book(9, 3, to_date('02/13/03','MM/DD/YY'));
  issue_status := fun_issue_book(10, 4, to_date('02/14/03','MM/DD/YY'));
  issue_status := fun_issue_book(11, 10, to_date('02/15/03','MM/DD/YY'));
  --issue_status := fun_issue_book(4, 9, to_date('01/21/12','MM/DD/YY'));
  --issue_status := fun_issue_book(4, 3, to_date('01/21/12','MM/DD/YY'));
  --issue_status := fun_issue_book(4, 15, to_date('01/21/12','MM/DD/YY'));
 
  
  --issue any edition 2013------------------------------------------------------------------------
  DBMS_OUTPUT.PUT_LINE('Issue book through fun_issue_anyedition(borrower_id, book_title, author_name, request_date): ');

  issue_any_status := fun_issue_anyedition(2, 'DATA MANAGEMENT', 'C.J. DATES', TO_DATE('03/03/03', 'mm/dd/yy'));
  issue_any_status := fun_issue_anyedition(4, 'CALCULUS', 'H. ANTON', TO_DATE('03/04/03', 'mm/dd/yy'));

  issue_any_status := fun_issue_anyedition(5, 'ORACLE', 'ORACLE PRESS', TO_DATE('03/04/03', 'mm/dd/yy'));

  issue_any_status := fun_issue_anyedition(10, 'IEEE MULTIMEDIA', 'IEEE', TO_DATE('03/04/03', 'mm/dd/yy'));
  
  issue_any_status := fun_issue_anyedition(2, 'MIS MANAGEMENT', 'C.J. CATES', TO_DATE('02/27/03', 'mm/dd/yy'));

  issue_any_status := fun_issue_anyedition(4, 'CALCULUS II', 'H. ANTON', TO_DATE('05/03/03', 'mm/dd/yy'));
  
  issue_any_status := fun_issue_anyedition(10, 'ORACLE', 'ORACLE PRESS', TO_DATE('03/04/03', 'mm/dd/yy'));
  
  issue_any_status := fun_issue_anyedition(5, 'IEEE MULTIMEDIA', 'IEEE', TO_DATE('02/26/13', 'mm/dd/yy'));
  
  issue_any_status := fun_issue_anyedition(2, 'DATA STRUCTURE', 'W. GATES', TO_DATE('03/03/03', 'mm/dd/yy'));
  
  issue_any_status := fun_issue_anyedition(4, 'CALCULUS III', 'H. ANTON', TO_DATE('04/04/03', 'mm/dd/yy'));

  issue_any_status := fun_issue_anyedition(11, 'ORACLE', 'ORACLE PRESS', TO_DATE('03/08/03', 'mm/dd/yy'));
  
  issue_any_status := fun_issue_anyedition(6, 'IEEE MULTIMEDIA', 'IEEE', TO_DATE('02/17/03', 'mm/dd/yy'));

end;
/
