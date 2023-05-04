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

