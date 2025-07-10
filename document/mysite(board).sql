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
insert into board values(null, 2, '11번째 게시물제목', '11번째 게시물내용', 0, now());
insert into board values(null, 3, '12번째 게시물제목', '12번째 게시물내용', 0, now());
insert into board values(null, 1, '13번째 게시물제목', '13번째 게시물내용', 0, now());
insert into board values(null, 2, '14번째 게시물제목', '14번째 게시물내용', 0, now());
insert into board values(null, 3, '15번째 게시물제목', '15번째 게시물내용', 0, now());
insert into board values(null, 1, '16번째 게시물제목', '16번째 게시물내용', 0, now());
insert into board values(null, 2, '17번째 게시물제목', '17번째 게시물내용', 0, now());
insert into board values(null, 3, '18번째 게시물제목', '18번째 게시물내용', 0, now());
insert into board values(null, 1, '19번째 게시물제목', '19번째 게시물내용', 0, now());
insert into board values(null, 2, '20번째 게시물제목', '20번째 게시물내용', 0, now());
insert into board values(null, 3, '21번째 게시물제목', '21번째 게시물내용', 0, now());
insert into board values(null, 1, '22번째 게시물제목', '22번째 게시물내용', 0, now());
insert into board values(null, 2, '23번째 게시물제목', '23번째 게시물내용', 0, now());
insert into board values(null, 3, '24번째 게시물제목', '24번째 게시물내용', 0, now());
insert into board values(null, 1, '25번째 게시물제목', '25번째 게시물내용', 0, now());
insert into board values(null, 2, '26번째 게시물제목', '26번째 게시물내용', 0, now());
insert into board values(null, 3, '27번째 게시물제목', '27번째 게시물내용', 0, now());
insert into board values(null, 1, '28번째 게시물제목', '28번째 게시물내용', 0, now());
insert into board values(null, 2, '29번째 게시물제목', '29번째 게시물내용', 0, now());
insert into board values(null, 3, '30번째 게시물제목', '30번째 게시물내용', 0, now());
insert into board values(null, 1, '31번째 게시물제목', '31번째 게시물내용', 0, now());
insert into board values(null, 2, '32번째 게시물제목', '32번째 게시물내용', 0, now());
insert into board values(null, 3, '33번째 게시물제목', '33번째 게시물내용', 0, now());
insert into board values(null, 1, '34번째 게시물제목', '34번째 게시물내용', 0, now());
insert into board values(null, 2, '35번째 게시물제목', '35번째 게시물내용', 0, now());
insert into board values(null, 3, '36번째 게시물제목', '36번째 게시물내용', 0, now());
insert into board values(null, 1, '37번째 게시물제목', '37번째 게시물내용', 0, now());
insert into board values(null, 2, '38번째 게시물제목', '38번째 게시물내용', 0, now());
insert into board values(null, 3, '39번째 게시물제목', '39번째 게시물내용', 0, now());
insert into board values(null, 1, '40번째 게시물제목', '40번째 게시물내용', 0, now());
insert into board values(null, 2, '41번째 게시물제목', '41번째 게시물내용', 0, now());
insert into board values(null, 3, '42번째 게시물제목', '42번째 게시물내용', 0, now());
insert into board values(null, 1, '43번째 게시물제목', '43번째 게시물내용', 0, now());
insert into board values(null, 2, '44번째 게시물제목', '44번째 게시물내용', 0, now());
insert into board values(null, 3, '45번째 게시물제목', '45번째 게시물내용', 0, now());
insert into board values(null, 1, '46번째 게시물제목', '46번째 게시물내용', 0, now());
insert into board values(null, 2, '47번째 게시물제목', '47번째 게시물내용', 0, now());
insert into board values(null, 3, '48번째 게시물제목', '48번째 게시물내용', 0, now());
insert into board values(null, 1, '49번째 게시물제목', '49번째 게시물내용', 0, now());
insert into board values(null, 2, '50번째 게시물제목', '50번째 게시물내용', 0, now());
insert into board values(null, 3, '51번째 게시물제목', '51번째 게시물내용', 0, now());
insert into board values(null, 1, '52번째 게시물제목', '52번째 게시물내용', 0, now());
insert into board values(null, 2, '53번째 게시물제목', '53번째 게시물내용', 0, now());
insert into board values(null, 3, '54번째 게시물제목', '54번째 게시물내용', 0, now());
insert into board values(null, 1, '55번째 게시물제목', '55번째 게시물내용', 0, now());
insert into board values(null, 2, '56번째 게시물제목', '56번째 게시물내용', 0, now());
insert into board values(null, 3, '57번째 게시물제목', '57번째 게시물내용', 0, now());
insert into board values(null, 1, '58번째 게시물제목', '58번째 게시물내용', 0, now());
insert into board values(null, 2, '59번째 게시물제목', '59번째 게시물내용', 0, now());
insert into board values(null, 3, '60번째 게시물제목', '60번째 게시물내용', 0, now());
insert into board values(null, 1, '61번째 게시물제목', '61번째 게시물내용', 0, now());
insert into board values(null, 2, '62번째 게시물제목', '62번째 게시물내용', 0, now());
insert into board values(null, 3, '63번째 게시물제목', '63번째 게시물내용', 0, now());
insert into board values(null, 1, '64번째 게시물제목', '64번째 게시물내용', 0, now());
insert into board values(null, 2, '65번째 게시물제목', '65번째 게시물내용', 0, now());
insert into board values(null, 3, '66번째 게시물제목', '66번째 게시물내용', 0, now());
insert into board values(null, 1, '67번째 게시물제목', '67번째 게시물내용', 0, now());
insert into board values(null, 2, '68번째 게시물제목', '68번째 게시물내용', 0, now());
insert into board values(null, 3, '69번째 게시물제목', '69번째 게시물내용', 0, now());
insert into board values(null, 1, '70번째 게시물제목', '70번째 게시물내용', 0, now());
insert into board values(null, 2, '71번째 게시물제목', '71번째 게시물내용', 0, now());
insert into board values(null, 3, '72번째 게시물제목', '72번째 게시물내용', 0, now());
insert into board values(null, 1, '73번째 게시물제목', '73번째 게시물내용', 0, now());
insert into board values(null, 2, '74번째 게시물제목', '74번째 게시물내용', 0, now());
insert into board values(null, 3, '75번째 게시물제목', '75번째 게시물내용', 0, now());
insert into board values(null, 1, '76번째 게시물제목', '76번째 게시물내용', 0, now());
insert into board values(null, 2, '77번째 게시물제목', '77번째 게시물내용', 0, now());
insert into board values(null, 3, '78번째 게시물제목', '78번째 게시물내용', 0, now());
insert into board values(null, 1, '79번째 게시물제목', '79번째 게시물내용', 0, now());
insert into board values(null, 2, '80번째 게시물제목', '80번째 게시물내용', 0, now());
insert into board values(null, 3, '81번째 게시물제목', '81번째 게시물내용', 0, now());
insert into board values(null, 1, '82번째 게시물제목', '82번째 게시물내용', 0, now());
insert into board values(null, 2, '83번째 게시물제목', '83번째 게시물내용', 0, now());
insert into board values(null, 3, '84번째 게시물제목', '84번째 게시물내용', 0, now());
insert into board values(null, 1, '85번째 게시물제목', '85번째 게시물내용', 0, now());
insert into board values(null, 2, '86번째 게시물제목', '86번째 게시물내용', 0, now());
insert into board values(null, 3, '87번째 게시물제목', '87번째 게시물내용', 0, now());
insert into board values(null, 1, '88번째 게시물제목', '88번째 게시물내용', 0, now());
insert into board values(null, 2, '89번째 게시물제목', '89번째 게시물내용', 0, now());
insert into board values(null, 3, '90번째 게시물제목', '90번째 게시물내용', 0, now());
insert into board values(null, 1, '91번째 게시물제목', '91번째 게시물내용', 0, now());
insert into board values(null, 2, '92번째 게시물제목', '92번째 게시물내용', 0, now());
insert into board values(null, 3, '93번째 게시물제목', '93번째 게시물내용', 0, now());
insert into board values(null, 1, '94번째 게시물제목', '94번째 게시물내용', 0, now());
insert into board values(null, 2, '95번째 게시물제목', '95번째 게시물내용', 0, now());
insert into board values(null, 3, '96번째 게시물제목', '96번째 게시물내용', 0, now());
insert into board values(null, 1, '97번째 게시물제목', '97번째 게시물내용', 0, now());
insert into board values(null, 2, '98번째 게시물제목', '98번째 게시물내용', 0, now());
insert into board values(null, 3, '99번째 게시물제목', '99번째 게시물내용', 0, now());
insert into board values(null, 1, '100번째 게시물제목', '100번째 게시물내용', 0, now());
insert into board values(null, 2, '101번째 게시물제목', '101번째 게시물내용', 0, now());
insert into board values(null, 3, '102번째 게시물제목', '102번째 게시물내용', 0, now());
insert into board values(null, 1, '103번째 게시물제목', '103번째 게시물내용', 0, now());
insert into board values(null, 2, '104번째 게시물제목', '104번째 게시물내용', 0, now());
insert into board values(null, 3, '105번째 게시물제목', '105번째 게시물내용', 0, now());
insert into board values(null, 1, '106번째 게시물제목', '106번째 게시물내용', 0, now());
insert into board values(null, 2, '107번째 게시물제목', '107번째 게시물내용', 0, now());
insert into board values(null, 3, '108번째 게시물제목', '108번째 게시물내용', 0, now());
insert into board values(null, 1, '109번째 게시물제목', '109번째 게시물내용', 0, now());
insert into board values(null, 2, '110번째 게시물제목', '110번째 게시물내용', 0, now());
insert into board values(null, 3, '111번째 게시물제목', '111번째 게시물내용', 0, now());
insert into board values(null, 1, '112번째 게시물제목', '112번째 게시물내용', 0, now());
insert into board values(null, 2, '113번째 게시물제목', '113번째 게시물내용', 0, now());
insert into board values(null, 3, '114번째 게시물제목', '114번째 게시물내용', 0, now());
insert into board values(null, 1, '115번째 게시물제목', '115번째 게시물내용', 0, now());
insert into board values(null, 2, '116번째 게시물제목', '116번째 게시물내용', 0, now());
insert into board values(null, 3, '117번째 게시물제목', '117번째 게시물내용', 0, now());
insert into board values(null, 1, '118번째 게시물제목', '118번째 게시물내용', 0, now());
insert into board values(null, 2, '119번째 게시물제목', '119번째 게시물내용', 0, now());
insert into board values(null, 3, '120번째 게시물제목', '120번째 게시물내용', 0, now());
insert into board values(null, 1, '121번째 게시물제목', '121번째 게시물내용', 0, now());
insert into board values(null, 2, '122번째 게시물제목', '122번째 게시물내용', 0, now());
insert into board values(null, 3, '123번째 게시물제목', '123번째 게시물내용', 0, now());
insert into board values(null, 1, '124번째 게시물제목', '124번째 게시물내용', 0, now());
insert into board values(null, 2, '125번째 게시물제목', '125번째 게시물내용', 0, now());
insert into board values(null, 3, '126번째 게시물제목', '126번째 게시물내용', 0, now());
insert into board values(null, 1, '127번째 게시물제목', '127번째 게시물내용', 0, now());
insert into board values(null, 2, '128번째 게시물제목', '128번째 게시물내용', 0, now());
insert into board values(null, 3, '129번째 게시물제목', '129번째 게시물내용', 0, now());
insert into board values(null, 1, '130번째 게시물제목', '130번째 게시물내용', 0, now());
insert into board values(null, 2, '131번째 게시물제목', '131번째 게시물내용', 0, now());
insert into board values(null, 3, '132번째 게시물제목', '132번째 게시물내용', 0, now());
insert into board values(null, 1, '133번째 게시물제목', '133번째 게시물내용', 0, now());
insert into board values(null, 2, '134번째 게시물제목', '134번째 게시물내용', 0, now());
insert into board values(null, 3, '135번째 게시물제목', '135번째 게시물내용', 0, now());
insert into board values(null, 1, '136번째 게시물제목', '136번째 게시물내용', 0, now());
insert into board values(null, 2, '137번째 게시물제목', '137번째 게시물내용', 0, now());
insert into board values(null, 3, '138번째 게시물제목', '138번째 게시물내용', 0, now());
insert into board values(null, 1, '139번째 게시물제목', '139번째 게시물내용', 0, now());
insert into board values(null, 2, '140번째 게시물제목', '140번째 게시물내용', 0, now());
insert into board values(null, 3, '141번째 게시물제목', '141번째 게시물내용', 0, now());
insert into board values(null, 1, '142번째 게시물제목', '142번째 게시물내용', 0, now());
insert into board values(null, 2, '143번째 게시물제목', '143번째 게시물내용', 0, now());
insert into board values(null, 3, '144번째 게시물제목', '144번째 게시물내용', 0, now());
insert into board values(null, 1, '145번째 게시물제목', '145번째 게시물내용', 0, now());
insert into board values(null, 2, '146번째 게시물제목', '146번째 게시물내용', 0, now());
insert into board values(null, 3, '147번째 게시물제목', '147번째 게시물내용', 0, now());
insert into board values(null, 1, '148번째 게시물제목', '148번째 게시물내용', 0, now());
insert into board values(null, 2, '149번째 게시물제목', '149번째 게시물내용', 0, now());
insert into board values(null, 3, '150번째 게시물제목', '150번째 게시물내용', 0, now());
insert into board values(null, 1, '151번째 게시물제목', '151번째 게시물내용', 0, now());
insert into board values(null, 2, '152번째 게시물제목', '152번째 게시물내용', 0, now());
insert into board values(null, 3, '153번째 게시물제목', '153번째 게시물내용', 0, now());
insert into board values(null, 1, '154번째 게시물제목', '154번째 게시물내용', 0, now());
insert into board values(null, 2, '155번째 게시물제목', '155번째 게시물내용', 0, now());
insert into board values(null, 3, '156번째 게시물제목', '156번째 게시물내용', 0, now());
insert into board values(null, 1, '157번째 게시물제목', '157번째 게시물내용', 0, now());
insert into board values(null, 2, '158번째 게시물제목', '158번째 게시물내용', 0, now());
insert into board values(null, 3, '159번째 게시물제목', '159번째 게시물내용', 0, now());
insert into board values(null, 1, '160번째 게시물제목', '160번째 게시물내용', 0, now());
insert into board values(null, 2, '161번째 게시물제목', '161번째 게시물내용', 0, now());
insert into board values(null, 3, '162번째 게시물제목', '162번째 게시물내용', 0, now());
insert into board values(null, 1, '163번째 게시물제목', '163번째 게시물내용', 0, now());
insert into board values(null, 2, '164번째 게시물제목', '164번째 게시물내용', 0, now());
insert into board values(null, 3, '165번째 게시물제목', '165번째 게시물내용', 0, now());
insert into board values(null, 1, '166번째 게시물제목', '166번째 게시물내용', 0, now());
insert into board values(null, 2, '167번째 게시물제목', '167번째 게시물내용', 0, now());
insert into board values(null, 3, '168번째 게시물제목', '168번째 게시물내용', 0, now());
insert into board values(null, 1, '169번째 게시물제목', '169번째 게시물내용', 0, now());
insert into board values(null, 2, '170번째 게시물제목', '170번째 게시물내용', 0, now());
insert into board values(null, 3, '171번째 게시물제목', '171번째 게시물내용', 0, now());
insert into board values(null, 1, '172번째 게시물제목', '172번째 게시물내용', 0, now());
insert into board values(null, 2, '173번째 게시물제목', '173번째 게시물내용', 0, now());
insert into board values(null, 3, '174번째 게시물제목', '174번째 게시물내용', 0, now());
insert into board values(null, 1, '175번째 게시물제목', '175번째 게시물내용', 0, now());
insert into board values(null, 2, '176번째 게시물제목', '176번째 게시물내용', 0, now());
insert into board values(null, 3, '177번째 게시물제목', '177번째 게시물내용', 0, now());
insert into board values(null, 1, '178번째 게시물제목', '178번째 게시물내용', 0, now());
insert into board values(null, 2, '179번째 게시물제목', '179번째 게시물내용', 0, now());
insert into board values(null, 3, '180번째 게시물제목', '180번째 게시물내용', 0, now());
insert into board values(null, 1, '181번째 게시물제목', '181번째 게시물내용', 0, now());
insert into board values(null, 2, '182번째 게시물제목', '182번째 게시물내용', 0, now());
insert into board values(null, 3, '183번째 게시물제목', '183번째 게시물내용', 0, now());
insert into board values(null, 1, '184번째 게시물제목', '184번째 게시물내용', 0, now());
insert into board values(null, 2, '185번째 게시물제목', '185번째 게시물내용', 0, now());