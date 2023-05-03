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