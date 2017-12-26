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
alter table best_table add (category varchar2(10));
select count(*) from best_table where id='jyyun21' and num = 5;
