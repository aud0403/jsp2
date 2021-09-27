-- 자유게시판 : 테이블 2개 (메인글 저장, 댓글)

create table freeboard(
	idx int not null auto_increment,
	name varchar(30) not null,
	password varchar(10) not null,
	subject varchar(40) not null,
	content varchar(2000) not null,
	readCount int default 0,
	wdate datetime default current_timestamp,
	ip varchar(15) default '127.0.0.1',
	commentCount smallint default 0,
	primary key(idx)
);

alter table freeboard modify column wdate timestamp
default current_timestamp;  -- timezone에 따라 설정ㄴ

insert into freeboard (name,password,subject, content,ip) 
values('honey', '1111', '웰컴~~~','하이 반가워','192.168.17.3');
insert into freeboard (name,password,subject, content,ip) 
values('사나', '1111', 'welome~~~','하이 반가워','192.168.22.3');
insert into freeboard (name,password,subject, content,ip) 
values('나나', '1111', '굿바이~~~','나나 반가워','192.168.23.3');
insert into freeboard (name,password,subject, content,ip) 
values('다다', '1111', '다다~~~','다다 반가워','192.168.24.3');
insert into freeboard (name,password,subject, content,ip) 
values('라라', '1111', '라라~~~','라라 반가워','192.168.25.3');
insert into freeboard (name,password,subject, content,ip) 
values('마마', '1111', '마마~~~','마마 반가워','192.168.26.3');
insert into freeboard (name,password,subject, content,ip) 
values('바바', '1111', '바바~~~','바바 반가워','192.168.27.3');

commit;




select * from freeboard ;
select * from freeboard order by idx desc;

-- mysql에는 limit 키워드 : limit 번호, 갯수
-- mysql, oracle select 결과에 대해 각행에 순서대로 번호를 부여하는 컬럼(row num)이 만들어집니다.
-- limit의 번호는 now num입니다.(mysql은 0부터 시작)
select * from freeboard order by idx desc limit 0,15;  -- 1 페이지 목록
select * from freeboard order by idx desc limit 15,15;
select * from freeboard order by idx desc limit 30,15;
select * from freeboard order by idx desc limit 45,15;
-- 계산식  :  n=10페이지 글은? (n-1)*15

-- 글 수정 :  subject, content 수정.

update freeboard set content='수정~~했었따~~' where idx='1';
update freeboard set subject='수정~~', content='사나~~했었따~~' where idx='2';

-- 조회수 변경 : 읽을 때마다(url 요청 발생) 카운트 +1
update freeboard set readCount=readCount+1 where idx='1';
update freeboard set readCount= +1 where idx='1';

-- 글 삭제
delete from freeboard  where idx=3 and password ='1111';
delete from freeboard  where idx=3 ;




