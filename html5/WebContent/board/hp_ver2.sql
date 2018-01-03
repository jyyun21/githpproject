create table board (
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
	category varchar2(10),
	ref number ,
	re_step number ,
	re_level number 
);
create table boardFree (
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
	category varchar2(10),
	ref number ,
	re_step number ,
	re_level number 
);


create table boardNotice (
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
);
select * from boardNotice;

create table board_best(
	num number ,
	category varchar2(20),
	board_num number
);
select * from board_best;

create table report(
	num number,
	id varchar2(30),
	category varchar2(20),
	r_type varchar2(20),
	r_content varchar2(500)
);
select * from REPORT;

update board set best =9 where num=25;

create table boardFile (
	fileName varchar2(50) not null,
	fileSize NUMBER,
	num number,
	category varchar2(20)
);
select * from boardfile;

create table board_scrap(
	num number,
	id varchar2(20),
	category varchar2(20),
	board_num number,
	folder varchar2(20)
);
select * from board_scrap;


CONSTRAINT FK_USERS FOREIGN KEY(USERNO)
REFERENCES USERS_INFO(USERNO)
ALTER TABLE 테이블명 ADD CONSTRAINT fk_bbs_id FOREIGN KEY(id) REFERENCES 참조되는 테이블명(id);
alter table board add constraint fk_board2 foreign key(id) references hpmember(id);
alter table boardFile drop constraint fk_file;

select * from board order by num desc;
select * from boardFree order by num desc;
select * from member2;
select nvl(max(num),0) from board;

insert into board values(1, 'master', 'temp', '파일 임시', 0, sysdate, 0, 'y', 'localhost', null, 'temp',0,0,0 );
insert into boardFree values(10, 'h2', '안녕?', '안뇨옹?', 0, sysdate, 0, 'n', 'localhost', 'head1', 'free',0,0,0 );
insert into boardBest values(0, 'master', 'Besttemp', '파일 임시', 0, sysdate, 0, 'y', 'localhost', null, 'temp',0,0,0 );


--alter table boardFile add (category varchar2(20));
update boardFile set category = 'humor';
alter table boardFile add constraint fk_file foreign key(num) references board(num);
ALTER TABLE 테이블명 DROP COLUMN 컬럼명;
ALTER TABLE boardFile DROP COLUMN category;
--alter table board_best add(board_num number);
---블라인드처리
alter table board add (block varchar2(5));
alter table boardFree add (block varchar2(5));
alter table report add (block varchar2(5));
update board set block ='n';
update boardFree set block ='n';
update report set block ='n';

update boardfile set num=6 where num = 0;

update board set del='y' where num = 27;
