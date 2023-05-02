/* guest.sql */

show tables;

create table guest (
	idx int not null auto_increment primary key, /* 방명록 고유 번호 */
	name varchar(20) not null, 						/*방명록 작성자 성명*/
	content text not null,  							/*방명록 내용*/
	email varchar(60), 										/*메일주소*/
	homePage varchar(60), 								/*홈페이지 주소(블로그 주소)*/
	visitDate datetime default now(),   	/*방문일자*/
	hostIP varchar(30) not null 					
	/*방문자 접속 IP*/
);

desc guest;

insert into guest values (default,'관리자','방명록 서비스를 시작합니다.','hkd1234@naver.com','hkd1234.tistory.com',default,'192.168.50.89');

select * from guest;
