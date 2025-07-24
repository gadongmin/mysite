-- 테이블 생성
create table attach(
     no 		int 		primary key 	auto_increment
    ,filePath 	varchar(500)
    ,orgName	varchar(200)
    ,saveName	varchar(500)
    ,fileSize 	int
);

-- 테이블 삭제
drop table attach;

-- 전체조회
select 	*
from 	attach
;

-- 등록
insert into attach
values(null
	 ,'C:\javaStudy\upload\1752564850892be52758a-a386-4735-a1ab-68eed6f20d8a.jpg'
	 ,'Park-Myung- Soo.jpg'
     ,'1752564850892be52758a-a386-4735-a1ab-68eed6f20d8a.jpg'
     ,63548)
;

-- 삭제
delete from attach
where no = 4
;
