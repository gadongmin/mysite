/*******************************************************
board
*******************************************************/
-- 데이터 베이스 사용
use web_db;

-- 테이블 목록 조회
show tables;

-- 테이블 삭제
drop table board;

-- 게시판 테이블 생성
create table board(
     no 		int 			primary key		auto_increment
    ,user_no	int
	,title 		varchar(500)	not null
    ,content 	text
    ,hit 		int
    ,reg_date 	datetime		not null
    ,constraint board_fk foreign key(user_no)
	 references users(no)
);

-- 전체조회
select  no
		,user_no
		,title
		,content
		,hit
		,reg_date
from 	board
;

select  *
from 	users u, board b
where  	u.no = b.user_no
order by b.no asc
;

-- 전체리스트
select  b.no
		,b.title
		,b.content
		,b.hit
		,date_format(b.reg_date,'%Y-%m %d') regDate
        ,u.no
        ,u.name
from 	users u, board b
where  	u.no = b.user_no
order by b.no asc
limit 0, 10
;

-- 전체 글 갯수
select 	count(*) count
from 	board
where  	title
like 	'%12%'
;

-- 게시판 검색
select   b.no
	    ,b.title
	    ,b.content
	    ,b.hit
	    ,date_format(b.reg_date,'%Y-%m %d') regDate
	    ,u.no
        ,u.name
from 	 board
where  	 u.no = b.user_no
and		 title	like '%12%'
order by b.no asc
limit 	 0,10
;

-- 게시판 수정
update board
set    title = '123'
	  ,content = '유재석'
where  user_no = 1
and    no = 1
;

-- 게시판 삭제
delete from board
where no = 1
;

insert into board values(null, 1, '1번째 게시물제목', '1번째 게시물내용', 0, now());
insert into board values(null, 2, '2번째 게시물제목', '2번째 게시물내용', 0, now());
insert into board values(null, 3, '3번째 게시물제목', '3번째 게시물내용', 0, now());
insert into board values(null, 1, '4번째 게시물제목', '4번째 게시물내용', 0, now());
insert into board values(null, 2, '5번째 게시물제목', '5번째 게시물내용', 0, now());
insert into board values(null, 3, '6번째 게시물제목', '6번째 게시물내용', 0, now());
insert into board values(null, 1, '7번째 게시물제목', '7번째 게시물내용', 0, now());
insert into board values(null, 2, '8번째 게시물제목', '8번째 게시물내용', 0, now());
insert into board values(null, 3, '9번째 게시물제목', '9번째 게시물내용', 0, now());
insert into board values(null, 1, '10번째 게시물제목', '10번째 게시물내용', 0, now());