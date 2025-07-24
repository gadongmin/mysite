/*******************************************************
guest
*******************************************************/
-- 데이터 베이스 사용
use web_db;

-- 테이블 목록 조회
show tables;

-- 테이블 삭제
drop table guestbook;

-- 테이블 생성
create table guestbook(
     no 		int 		primary key auto_increment
    ,name 		varchar(20)
    ,password	varchar(20)
    ,content	text
    ,reg_date 	datetime
);

-- 전체조회
select 	no
	   ,name
       ,password
       ,content
       ,date_format(reg_date,'%Y-%m-%d') regDate
from 	guestbook
where no = 1
;

-- 전체조회
select 	*
from 	guestbook
;

-- 방명록 등록
insert into guestbook
value(null, '정우성', 1, '첫번째 방명록', now())
;

insert into guestbook
value(null, '이효리', 1, '두번째 방명록', now())
;

-- 게시판 삭제
delete from guestbook
where no = 16
;
