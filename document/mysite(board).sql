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
;

-- 게시판 등록
insert into board
value(null, 1, '5번째 게시물 제목', '5번째 게시물 내용', 0, now())
;

insert into board
value(null, 2, '4번째 게시물 제목', '4번째 게시물 내용', 0, now())
;

-- 게시판 삭제
delete from board
where no = 1
;
