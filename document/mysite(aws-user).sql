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

-- 회원추가
insert into users
value(null, 'hhh', '123', '강호동', 'male')
;
insert into users
value(null,'ggg', '123', '김태희', 'female')
;

-- 회원조회
select 	*
from 	users
;

-- 아이디 중복확인
select 	no
		,id
        ,name
        ,gender
from 	users
where   id='aaa'
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
