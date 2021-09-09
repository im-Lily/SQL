CREATE TABLE tCar
(
	car VARCHAR(30) NOT NULL,		-- 이름
	capacity INT NOT NULL,			-- 배기량
	price INT NOT NULL,			-- 가격
	maker VARCHAR(30) NOT NULL		-- 제조사
);

INSERT INTO tCar (car, capacity, price, maker) VALUES ('소나타', 2000, 2500, '현대');
INSERT INTO tCar (car, capacity, price, maker) VALUES ('티볼리', 1600, 2300, '쌍용');
INSERT INTO tCar (car, capacity, price, maker) VALUES ('A8', 3000, 4800, 'Audi');
INSERT INTO tCar (car, capacity, price, maker) VALUES ('SM5', 2000, 2600, '삼성');

CREATE TABLE tMaker
(
	maker VARCHAR(30) NOT NULL,		-- 회사
	factory CHAR(10) NOT NULL,	    	-- 공장
	domestic CHAR(1) NOT NULL		-- 국산 여부. Y/N
);

INSERT INTO tMaker (maker, factory, domestic) VALUES ('현대', '부산', 'y');
INSERT INTO tMaker (maker, factory, domestic) VALUES ('쌍용', '청주', 'y');
INSERT INTO tMaker (maker, factory, domestic) VALUES ('Audi', '독일', 'n');
INSERT INTO tMaker (maker, factory, domestic) VALUES ('기아', '서울', 'y');

create table tEmployee
(
	name char(10) primary key,
    salary int not null,
    addr varchar(30) not null
);

insert into tEmployee (name, salary, addr) values ('김상형',650,'이천시');
insert into tEmployee (name, salary, addr) values ('문종민',480,'대구시');
insert into tEmployee (name, salary, addr) values ('권성직',625,'안동시');

create table tProject
(
	projectID int primary key,
    employee char(10) not null,
    project varchar(30) not null,
    cost int
);

insert into tProject values (1,'김상형','홍콩 수출건',800);
INSERT INTO tProject VALUES (2, '김상형', 'TV 광고건', 3400);
INSERT INTO tProject VALUES (3, '김상형', '매출분석건', 200);
INSERT INTO tProject VALUES (4, '문종민', '경영 혁신안 작성', 120);
INSERT INTO tProject VALUES (5, '문종민', '대리점 계획', 85);
INSERT INTO tProject VALUES (6, '권성직', '노조 협상건', 24);

create table tMember
(
	member varchar(20) primary key,
    age int not null,
    email varchar(30) not null,
    addr varchar(50) not null,
    money int default 1000 not null,
    grade int default 1 not null,
    remark varchar(100) null
);

INSERT INTO tMember VALUES ('춘향',16,'1004@naver.com','전남 남원시',20000, 2, '');
INSERT INTO tMember VALUES ('이도령',18,'wolf@gmail.com','서울 신사동',150000, 3, '');
INSERT INTO tMember VALUES ('향단',25,'candy@daum.net','전남 남원시',5000, 2, '');
INSERT INTO tMember VALUES ('방자',28,'devlin@ssang.co.kr','서울 개포동',1000, 1, '요주의 고객');

create table tCategory
(
	category varchar(10) primary key,
    discount int not null,
    delivery int not null,
    takeback char(1)
);

INSERT INTO tCategory (category, discount, delivery, takeback) VALUES ('식품', 0, 3000, 'n');
INSERT INTO tCategory (category, discount, delivery, takeback) VALUES ('패션', 10, 2000, 'y');
INSERT INTO tCategory (category, discount, delivery, takeback) VALUES ('가전', 20, 2500, 'y');
INSERT INTO tCategory (category, discount, delivery, takeback) VALUES ('성인', 5, 1000, 'n');

create table tItem
(
	item varchar(20) primary key,
    company varchar(20) null,
    num int not null,
    price int null,
    category varchar(10) not null,
    constraint item_fk foreign key(category) references tCategory(category)
);

INSERT INTO tItem (item,company,num,price,category) VALUES ('노트북', '샘성', 3, 820000, '가전');
INSERT INTO tItem (item,company,num,price,category) VALUES ('청바지', '방방', 80, 32000, '패션');
INSERT INTO tItem (item,company,num,price,category) VALUES ('사과', '문경농원', 24, 16000, '식품');
INSERT INTO tItem (item,company,num,price,category) VALUES ('대추', '보은농원', 19, 15000, '식품');
INSERT INTO tItem (item,company,num,price,category) VALUES ('전자담배', 'TNG', 4, 70000, '성인');
INSERT INTO tItem (item,company,num,price,category) VALUES ('마우스', '논리텍', 3, 90000, '가전');

create table tOrder
(
	orderID int auto_increment primary key,
    member varchar(20) not null,
    item varchar(20) not null,
    orderDate date default curdate() not null,
    num int not null,
    status int default 1 not null,
    remark varchar(1000) null
);

INSERT INTO tOrder (member,item,orderDate,num,status) VALUES ('춘향','청바지','2019-12-3',3,2);
INSERT INTO tOrder (member,item,orderDate,num,status) VALUES ('향단','대추','2019-12-4',10,1);
INSERT INTO tOrder (member,item,orderDate,num,status) VALUES ('방자','전자담배','2019-12-2',4,1);
INSERT INTO tOrder (member,item,orderDate,num,status) VALUES ('향단','사과','2019-12-5',5,2);
INSERT INTO tOrder (member,item,orderDate,num,status) VALUES ('흥부','노트북','2019-12-5',2,1);
INSERT INTO tOrder (member,item,orderDate,num,status) VALUES ('방자','핸드폰','2019-11-1',1,3);




