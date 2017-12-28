create table hpmember(
	id varchar2(12) primary key,
	password varchar2(12) not null,
	name varchar2(20) not null,
	address varchar2(50),
	tel varchar2(20) not null,
	reg_date date,
	del char(1)
);

--update hpmember set del ='n';
select * from HPMEMBER;
--update hpmember set del = 'y' where id = 'redc';
--alter table hpmember add (del char(1));
--delete from hpmember where id like 'a%';
insert into hpmember values('master','master','마스터','m@m','000-0000-0000', sysdate, 'n');
insert into hpmember values('a1','11','11','m@m','000-0000-0000', sysdate, 'n');
insert into hpmember values('a2','11','22','m@m','000-0000-0000', sysdate, 'n');

create table best_table(
	id varchar2(20),
	num number 
);
--select * from best_table;
update best_table set category = 'humor';
select * from BOARD_BEST;
alter table best_table add (category varchar2(10));
select count(*) from best_table where id='jyyun21' and num = 5;
/* myWriteList안만들고 해보기
create table myWriteList(
	num number primary key,
	id varchar2(30) ,
	subject varchar2(50) ,
	content varchar2(500) ,
	readcount number default 0,
	reg_date date,
	best number default 0,
	del varchar2(2) default 'n',
	ip varchar2(20),
	head varchar2(15),
	category varchar2(10)
	ref number ,
	re_step number ,
	re_level number 
);

insert into myWriteList values(1, 'master', 'temp', '파일 임시', 0, sysdate, 0, 'y', 'localhost', null, 'temp',0,0,0 );
insert into myWriteList values(2, 'master', 'temp', '파일 임시', 0, sysdate, 0, 'y', 'localhost', null, 'temp',0,0,0 );
insert into myWriteList values(3, 'master', 'temp', '파일 임시', 0, sysdate, 0, 'y', 'localhost', null, 'temp',0,0,0 );

select * from myWriteList;
*/

