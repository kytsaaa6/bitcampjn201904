select * from dba_users where username = 'SCOTT';

ALTER USER SCOTT ACCOUNT UNLOCK;

ALTER USER SCOTT  IDENTIFIED BY bitcamp123;

INSERT INTO BOARD_TOUR (BT_NUM, BT_TITLE,BT_CONT, BT_PHOTO, BT_STAR, BT_TIME, U_NUM, HT_NUM)
					VALUES (B_TOUR_NUM_SEQ.nextval, 'test','test', 'test', 5.0, sysdate, 2001, 1);
                    
insert into hobby_tour 
values (1, 'test','test','test',1111.1,'test','test');

insert into member 
values (2001, 'tourid','tour',1111,1111, null);

commit;
           
                    
                    select * from member;
                    
                    
                    
                    select * from hobby_tour;
                    
                    
                    select * from board_tour order by bt_num;