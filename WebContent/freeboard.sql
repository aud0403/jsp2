-- �����Խ��� : ���̺� 2�� (���α� ����, ���)

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
default current_timestamp;  -- timezone�� ���� ������

insert into freeboard (name,password,subject, content,ip) 
values('honey', '1111', '����~~~','���� �ݰ���','192.168.17.3');
insert into freeboard (name,password,subject, content,ip) 
values('�糪', '1111', 'welome~~~','���� �ݰ���','192.168.22.3');
insert into freeboard (name,password,subject, content,ip) 
values('����', '1111', '�¹���~~~','���� �ݰ���','192.168.23.3');
insert into freeboard (name,password,subject, content,ip) 
values('�ٴ�', '1111', '�ٴ�~~~','�ٴ� �ݰ���','192.168.24.3');
insert into freeboard (name,password,subject, content,ip) 
values('���', '1111', '���~~~','��� �ݰ���','192.168.25.3');
insert into freeboard (name,password,subject, content,ip) 
values('����', '1111', '����~~~','���� �ݰ���','192.168.26.3');
insert into freeboard (name,password,subject, content,ip) 
values('�ٹ�', '1111', '�ٹ�~~~','�ٹ� �ݰ���','192.168.27.3');

commit;




select * from freeboard ;
select * from freeboard order by idx desc;

-- mysql���� limit Ű���� : limit ��ȣ, ����
-- mysql, oracle select ����� ���� ���࿡ ������� ��ȣ�� �ο��ϴ� �÷�(row num)�� ��������ϴ�.
-- limit�� ��ȣ�� now num�Դϴ�.(mysql�� 0���� ����)
select * from freeboard order by idx desc limit 0,15;  -- 1 ������ ���
select * from freeboard order by idx desc limit 15,15;
select * from freeboard order by idx desc limit 30,15;
select * from freeboard order by idx desc limit 45,15;
-- ����  :  n=10������ ����? (n-1)*15

-- �� ���� :  subject, content ����.

update freeboard set content='����~~�߾���~~' where idx='1';
update freeboard set subject='����~~', content='�糪~~�߾���~~' where idx='2';

-- ��ȸ�� ���� : ���� ������(url ��û �߻�) ī��Ʈ +1
update freeboard set readCount=readCount+1 where idx='1';
update freeboard set readCount= +1 where idx='1';

-- �� ����
delete from freeboard  where idx=3 and password ='1111';
delete from freeboard  where idx=3 ;




