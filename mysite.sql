
-- 데이터 베이스 사용
use web_db;

-- 테이블 목록 조회
show tables;

-- 테이블 삭제
drop table users;

-- 유저(회원) 테이블 생성
create table users(
     no 		int 		primary key auto_increment
	,id 		varchar(20) unique 		not null
    ,password 	varchar(20) 			not null
    ,name 		varchar(20)
    ,gerder 	varchar(20)
);

-- 회원추가
insert into users
value(null,'aaa', '123', '정우성', 'male')
;

