/* board sql */

show tables;

create table board (
	idx int not null auto_increment,		/* 게시글의 고유번호 */
	mid varchar(20) not null,						/* 게시글 올린 사람 아이디 */
	nickName varchar(20) not null,			/* 게시글 올린 사람 닉네임 */
	title varchar(100) not null,				/* 게시글 제목 */
	email varchar(50), 									/* email */
	homePage varchar(50),								/* 홈페이지 */
	content text not null,							/* 게시글 내용 */
	readNum int default 0,							/* 글 조회수 */
	hostIP varchar(40) not null,				/* 올린 사람 IP */
	openSw char(2) default 'OK',				/* 게시글 공개여부(OK : 공개, NO : 비공개) */
	wDate datetime default now(),			  /* 글 올린 날짜/시간 */
	good int default 0,									/* 좋아요 기능(카운트) */
 	primary key(idx)
);
 	-- primary key(idx, mid) 
 	-- mysql에선 프라이머리키는 보통 하나만 등록 유니크키를 여러개 등록시켜서 사용한다.
 	-- 다른 sql에선 프라이머리키 여러개 사용 but mysql에선 좀...문제가 많다

desc board;

insert into board values (default,'admin','관리자','게시판 서비스 시작','hkd1234@naver.com','hkd1234.tistory.com','게시판 서비스 시작',default,'192.168.50.89',default,default,default);

select * from board;

/* 게시판에 댓글 달기 */ /* DB간의 관계 설정 - 관계설정을 통해 인덱싱이 가능.. */
create table boardReply (
	idx int not null auto_increment,              /* 댓글의 고유번호 */
	boardIdx int not null,								        /* 원본글의 고유번호(외래키로 지정) 한개만 가능X 여러개 가능O */
	mid varchar(20) not null,                     /* 댓글 올린이의 아이디 */
	nickName varchar(20) not null,	              /* 댓글 올린이의 닉네임 */
	wDate datetime default now(),	       	        /* 댓글 올린 날짜 */
	hostIP varchar(50) not null,			 	 	        /* 댓글 올린 PC의 고유 IP */
	content text not null,                        /* 댓글 내용 */
	primary key(idx),                             /* 기본키 : 고유번호 */
	foreign key(boardIdx) references board(idx)   /* 외래키 설정(설정 조건 : unique key, primary key) */
	on update cascade                             /* 원본 키를 수정하면 같이 수정하겠다. */
	on delete restrict                            /* 원본테이블을 삭제하지 못하게 하겠다? */
);

desc boardReply; /*MUL : multiple key -- 관계설정이 된 키 PRI->UNI->MUL 순의 우선순위로 출력*/

/* 날짜함수 처리 연습 */
select now(); /*오늘 날짜 보여주세요*/
select year(now());
select month(now());
select day(now());
select concat(year(now()),'년',month(now()),'월',day(now()),'일');
select concat(year(now()),'년',month(now()),'월',day(now()),'일') as nalja; /* vo에 등록해놔야만 쓸 수 있다. */
select date(now()); /*날짜를 년-월-일로 출력*/
select weekday(now()); /* 0:월 1:화 2:수 3:목 ..... */
select dayofweek(now()); /*0:일 1:월 2:화 3:수 .... */

select year('2023-5-3');
select idx,year(wDate) from board; /* 보드 테이블에서 idx랑 년도를 보여줘 */

/* 날짜연산 */
/* date_add(date, interval값 type) */
/* 오늘type + x 출력 */
select date_add(now(), interval 1 day);
select date_add(now(), interval -1 day);

select now(), date_add(now(), interval 10 hour);
select now(), date_add(now(), interval 10 day_hour);

/* date_sub(date, interval값 type) sub=subtraction(뺄셈) */
/* 오늘type - x 출력 */
select date_sub(now(), interval 1 day);

select date_sub(now(), interval 10 hour);

/* board table에 적용하기 */
/* 게시글 중에서 하루전에 올라온 글만 보여주세요 */
select * from board where substring(wdate,1,10) = substring(date_sub(now(), interval 24 hour),1,10);
select * from board where wdate >= date_sub(now(), interval 24 hour);

/* 날짜차이 계산 함수 : DATEDIFF(시작날짜, 마지막날짜) */
select datediff('2023-05-04','2023-05-07');  /* -3 이 출력됨*/
select idx, datediff(now(), wDate) from board; /* 오늘 날짜에서 wDate를 뺀 일수를 보여준다 */
select idx, datediff(now(), wDate) as day_diff from board;

select timestampdiff(hour, '2023-05-04', now()); /*오늘 시간 - 2023-05-04 00:00:00의 값 출력 */ /* 11 시간 차이난다. */
select timestampdiff(hour, wDate, now()) as hour_diff from board;
select *, timestampdiff(hour, wDate, now()) as hour_diff from board order by idx desc limit 0,5; /* 가져가서 사용할 수 있도록 만들어보았습니다~ */
select *, datediff(wDate, now()) as day_diff, timestampdiff(hour, wDate, now()) as hour_diff from board order by idx desc limit 0,5;

/* 날짜 양식 (date_format()) : 년도(%Y)//4자리 2자리는(%y)//, 월(%m), 일(%d) */
select date_format(wDate, '%Y-%m-%d %H:%i') as format from board order by wDate desc;

select wDate, date_format(wDate, '%Y-%m-%d %H:%i') from board;
select *,date_format(wDate, '%Y-%m-%d'),date_format(wDate, '%H:%i'),timestampdiff(hour, wDate, now()) as hour_diff from board;
select *,date_format(wDate, '%Y-%m-%d') as day_format, date_format(wDate, '%H:%i') as hour_format, timestampdiff(hour, wDate, now()) as hour_diff from board;

/* 이전글 / 다음글 꺼내오기 */ /*먼저 sql문 연습을 해보고 되면 가져가서 처리를 해야해요~*/
select * from board;
select * from board where idx=6; /* 현재글이라 가정 */
select idx,title from board where idx<6 order by idx desc limit 1; /* 이전글 */
select idx,title from board where idx>6 order by idx asc limit 1;  /* 다음글 */

/* 게시판 리스트 글제목 옆에 해당글의 댓글 수를 출력하시오 */

/* 댓글의 수를 전체 list에 출력하기 위한 연습 */
-- 전체 board 테이블의 내용을 최신순으로 출력하세요
select * from board order by idx desc;

-- board테이블 고유번호 27번에 해당하는 댓글 테이블의 댓글 수는?
select count(*) from boardReply where boardIdx = 27;

-- 앞의 예에서 원본글의 고유번호와 함께, 총 댓글의 갯수는 replyCnt로 출력
select boardIdx, count(*) as replyCnt from boardReply where boardIdx = 27;

-- 이때, 원본글을 쓴 닉네임도 함께 출력해보세요 단, 닉네임은 원본글(board)테이블에서 가져와 출력하세요
select boardIdx, count(*) as replyCnt, b.nickName from boardReply b, board bb where b.boardIdx=bb.idx and boardIdx = 27;

select boardIdx, count(*) as replyCnt,
	(select nickName from board where idx=27) as nickName
	from boardReply
	where boardIdx =27;

-- 앞의 내용들을 부모관점(board)에서 보자
select mid, nickName from board where idx = 27;

-- 이때 앞의 닉네임을 자식(댓글)테이블(boardReply)에서 가져와 보여준다면
select mid,
	(select count(*) from boardReply where boardIdx=27) as nickName
	from board where idx = 27;
	
select *,
	(select count(*) from boardReply where boardIdx=27) as replyCnt
	from board where idx = 27;

-- 부모관점(board) 테이블을 기준으로 처리....
-- board테이블의 1페이지 5건을 출력하되, board테이블의 모든내용과, 현재 출력된 게시글에 달려있는 댓글의 갯수를 출력하세요
-- 단, 최신글을 먼저 출력하세요.
	
select *,
	(select count(*) from boardReply where boardIdx=b.idx) as replyCnt
	from board b order by idx desc limit 5;
	