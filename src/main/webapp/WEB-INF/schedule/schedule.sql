show tables;

create table schedule (
	idx int not null auto_increment primary key,
	mid varchar(20) not null,                    /* 회원 아이디(일정검색시 필요) */
	sDate datetime not null, 	                   /* 일정 등록 날짜 */
	part varchar(10) not null, 	                 /* 분류(1.모임, 2.업무, 3.학습, 4.여행 5.기타 ) */
	content text not null                        /* 일정 상세내역 */
);

desc schedule;

drop table schedule;

insert into schedule values (default,'hkd1234','2021-01-01','학습','JSP 주제발표');
insert into schedule values (default,'hkd1234','2023-05-17','업무','출장');
insert into schedule values (default,'hkd1234','2023-05-17','모임','술약속');
insert into schedule values (default,'hkd1234','2024-04-15','학습','SPRING 주제발표');
insert into schedule values (default,'hkd1234','2023-05-12','여행','탄자니아 여행');
insert into schedule values (default,'hkd1234','2022-06-07','기타','아 배고프다');
insert into schedule values (default,'kms1234','2021-07-09','기타','결혼식');
insert into schedule values (default,'kms1234','2020-08-11','모임','독서모임');
insert into schedule values (default,'kms1234','2023-07-10','업무','업무보고');
insert into schedule values (default,'kms1234','2023-06-02','학습','JAVA 공부');
insert into schedule values (default,'kms1234','2023-05-05','여행','아이슬란드 여행');

select * from schedule where mid = 'hkd1234' order by sDate desc;

select * from schedule where mid='hkd1234' and sDate='2023-05-17' order by sDate desc;
select * from schedule where mid='hkd1234' and date_format(sDate,'%Y-%m-%d')='2023-05-17' order by sDate desc;
select * from schedule where mid='hkd1234' and sDate='2023-05' order by sDate desc;
select * from schedule where mid='hkd1234' and date_format(sDate,'%Y-%m')='2023-5' order by sDate desc; /*안나옴*/
select * from schedule where mid='hkd1234' and date_format(sDate,'%Y-%m')='2023-05' order by sDate desc; /*나옴*/
select * from schedule where mid='hkd1234' and date_format(sDate,'%Y-%m')='2023-05' group by part order by sDate desc; /*중복되는 part는 나오지 않음*/

select * from schedule where mid='hkd1234' and date_format(sDate,'%Y-%m')='2023-05' order by sDate desc, part; /*나옴*/









