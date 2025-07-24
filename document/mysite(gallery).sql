-- 테이블 생성
create table gallery(
     no 		int 			primary key		auto_increment
    ,user_no	int
	,content 	varchar(1000)
    ,filePath 	varchar(500)
    ,orgName 	varchar(200)
    ,saveName 	varchar(500)
    ,fileSize	int
    ,constraint galley_fk foreign key(user_no)
	 references users(no)
);

-- 등록
insert into gallery
values(null
	 ,null	
     ,''
	 ,'C:\javaStudy\upload\1752564850892be52758a-a386-4735-a1ab-68eed6f20d8a.jpg'
	 ,'Park-Myung- Soo.jpg'
     ,'1752564850892be52758a-a386-4735-a1ab-68eed6f20d8a.jpg'
     ,63548)
;

-- 테이블 삭제
drop table gallery;

-- 전체조회
select 	*
from 	gallery
;

-- 전체조회
select 	g.no
		,g.content
		,g.filePath
		,g.orgName
		,g.saveName
		,g.fileSize
		,u.no
		,u.name
from 	users u, gallery g
where  	u.no = g.user_no
order by g.no asc
;

-- 삭제
delete from gallery
where no = 9
;
