show tables;

create table member (
	idx int not null auto_increment, 	    		/* 회원 고유번호 */
	mid varchar(20) not null,   			  		  /* 회원 아이디 중복X */
	pwd varchar(100) not null,   		 		 			/* 회원 비밀번호 (sha-256) */
	nickName varchar(20) not null,   		 		  /* 회원 별명(중복 불허/수정가능) */
	name varchar(20) not null,								/* 회원 성명 */
	gender varchar(5) default '남자',					/* 회원 성별 */
	birthday datetime default now(),					/* 회원 생일 */
	tel varchar(15),													/* 회원 전화번호 */
	address varchar(100),											/* 주소(다음 API 우편번호 활용) */
	email varchar(50) not null,								/* 회원 이메일(아이디/비밀번호 분실 시에 사용)-형식체크 필수 */
	homePage varchar(50),											/* 홈페이지(블로그) 주소 */
	job varchar(20),													/* 회원 직업 */
	hobby varchar(100),												/* 취미(2개 이상 선택가능, 구분자는 "/"로 한다.) */
	photo varchar(100) default 'noimage.jsp', /* 회원 사진 */
	content text,															/* 회원 소개 */
	userInfor char(6) default '공개',    			/* 회원 정보 공개여부(공개/비공개) */
	userDel char(2) default 'NO',							/* 회원 탈퇴신청여부(NO:현재 활동중, OK:탈퇴 신청중) */
	point int default 100,										/* 회원 누적포인트(가입포인트 100점, 1회 방문시 10포인트 증가, 1일 최대 50포인트까지 증가) */
	level int default 1,											/* 회원등급(0:관리자, 1:준회원 2:정회원 3:우수회원 4:운영자) */
	visitCnt int default 0,										/* 총 방문 횟수 */
	startDate datetime default now(),					/* 최초 가입일 */
	lastDate datetime default now(),					/* 마지막 접속일 */
	todayCnt int default 0,										/* 오늘 방문한 횟수 */
	salt char(8) not null,										/* 비밀번호 보안을 위한 해시키 */
	primary key (idx, mid)										/* 고유번호 및 회원아이디 중복 불가 */
);

desc member;

select * from member;
