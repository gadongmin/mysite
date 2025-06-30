/*******************************************************
user
*******************************************************/
-- 데이터 베이스 사용
use web_db;

-- 테이블 목록 조회
show tables;

-- 테이블 삭제
drop table users;
drop table guestbook;

-- 유저(회원) 테이블 생성
create table users(
     no 		int 		primary key auto_increment
	,id 		varchar(20) unique 		not null
    ,password 	varchar(20) 			not null
    ,name 		varchar(20)
    ,gender 	varchar(20)
);

create table guest(
     no 		int 		primary key auto_increment
    ,password 	varchar(20) 			not null
    ,name 		varchar(20)
    ,content	text
    ,reg_date 	datetime
);

-- 회원추가
insert into users
value(null,'aaa', '123', '정우성', 'male')
;
insert into users
value(null,'bbb', '123', '이효리', 'female')
;

-- 회원조회
select 	*
from 	users
;

select 	*
from 	guest
;

-- 로그인
select 	no
	   ,id
	   ,password
	   ,name
	   ,gender
from 	users
where   id ='aaa'
and 	password = '123'
;

-- 회원정보 수정폼
select 	no
	   ,id
	   ,password
	   ,name
	   ,gender
from 	users
where   no = 1
;

-- 회원정보 수정
update users
set    password = '123'
	  ,name = '유재석'
	  ,gender = 'male'
where  no = 1
;
