create table m(
	custno number(6) primary key,
	custname varchar2(20),
	phone varchar2(13),
	address varchar2(60),
	joindate date,
	grade char(1),
	city char(2)
)

create table a(
	custno number(6),
	salenol number(8),
	pcost number(8),
	amount number(4),
	price number(8),
	pcode varchar2(4),
	sdate date
)

insert into m values(100001,'김행복','010-1111-2222','서울 동대문구 휘경1동','20151202','A','01');
insert into m values(100002,'이축복','010-1111-3333','서울 동대문구 휘경2동','20151203','B','01');
insert into m values(100003,'장믿음','010-1111-4444','서울 동대문구 휘경3동','20151204','C','30');
insert into m values(100004,'최사랑','010-1111-5555','서울 동대문구 휘경4동','20151205','B','30');
insert into m values(100005,'진평화','010-1111-6666','서울 동대문구 휘경5동','20151206','A','60');
insert into m values(100006,'차공단','010-1111-7777','서울 동대문구 휘경6동','20151207','C','60');

insert into a values(100001,20160001,500,5,2500,'A001','20160101');
insert into a values(100001,20160002,1000,4,4000,'A002','20160101');
insert into a values(100001,20160003,500,3,1500,'A008','20160101');
insert into a values(100002,20160004,2000,1,2000,'A004','20160102');
insert into a values(100002,20160005,500,1,500,'A001','20160103');
insert into a values(100003,20160006,1500,2,3000,'A003','20160103');
insert into a values(100004,20160007,500,2,1000,'A001','20160104');
insert into a values(100004,20160008,300,1,300,'A005','20160104');
insert into a values(100004,20160009,600,1,600,'A006','20160104');
insert into a values(100004,20160010,3000,1,3000,'A007','20160105');

select custno, custname, phone, address, joindate, decode(grade,'A','VIP','B','일반','C','직원') grade, city from m

select m.custno, custname,decode(grade,'A','VIP','B','일반','C','직원') grade,sum(price) price from a a , m m where a.custno = m.custno group by m.custno, custname, grade order by price desc

select nvl(max(custno),0)+1 max from M

update M set custno = '100001', custname='서준호',phone='010-3333-3333', address='경기',joindate='2015-05-05',grade='A',city='02' where custno='100001'

select * from m where custno = '100001'

delete m where custno='100001'