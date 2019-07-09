-- 1 마당서점의고객이요구하는다음질문에대해SQL 문을작성하시오.
-- (5) 박지성이구매한도서의출판사수
select b.publisher,b.bookname
from orders o inner join book b
on o.bookid=b.bookid
where custid in (select o.custid
					from orders o inner join customer c
                    on o.custid=c.custid
                    where c.name = '박지성')
;

select * from orders;
select * from customer;
select * from book;

-- (6) 박지성이구매한도서의이름, 가격, 정가와판매가격의차이
select b.bookname, o.saleprice, b.price-o.saleprice
from orders o inner join book b
on o.bookid=b.bookid
where custid in (select o.custid
				 from orders o inner join customer c
                 on o.custid=c.custid
                 where c.name = '박지성')
;
-- (7) 박지성이구매하지않은도서의이름
select b.bookname
from orders o inner join book b
on o.bookid=b.bookid
where o.custid not in (select o.custid
				 from orders o inner join customer c
                 on o.custid=c.custid
                 where c.name = '박지성')
;

-- 2 마당서점의운영자와경영자가요구하는다음질문에대해SQL 문을작성하시오.
-- (8) 주문하지않은고객의이름(부속질의사용)
select name
from customer
where custid not in (select custid
					 from orders
					 );

select * from orders;
select * from customer;
select * from book;

-- (9) 주문금액의총액과주문의평균금액
select sum(saleprice),avg(saleprice)
from orders;

-- (10) 고객의이름과고객별구매액
select name, sum(saleprice)
from customer c,orders o
where c.custid = o.custid
group by name
;

-- (11) 고객의이름과고객이구매한도서목록
select name, bookname
from customer c, book b, orders o
where c.custid = o.custid and b.bookid = o.bookid
order by name
;

-- (12) 도서의가격(Book 테이블)과판매가격(Orders 테이블)의차이가가장많은주문
select *
from orders o inner join book b
on o.bookid=b.bookid 
where (price-saleprice) in (select max(price-saleprice)
							from orders o, book b
							where o.bookid=b.bookid
                            )
;

-- (13) 도서의판매액평균보다자신의구매액평균이더높은고객의이름
select name, avg(saleprice)
from orders o inner join customer c
on o.custid=c.custid
where avg(saleprice) > (select

group by name;

-- 3. 마당서점에서 다음의 심화된 질문에 대해 SQL 문을 작성하시오.
-- (1) 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
-- (2) 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름

-- 4 다음질의에대해DML 문을작성하시오.
-- (1) 새로운도서(‘스포츠세계’, ‘대한미디어’, 10000원)이마당서점에입고되었다.
--     삽입이안될경우필요한데이터가더있는지찾아보자.
-- (2) ‘삼성당’에서출판한도서를삭제해야한다.
-- (3) ‘이상미디어’에서출판한도서를삭제해야한다. 삭제가안될경우원인을생각해보자.
-- (4) 출판사‘대한미디어’가‘대한출판사’로이름을바꾸었다.