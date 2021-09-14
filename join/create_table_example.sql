DROP TABLE IF EXISTS usertb1;

CREATE TABLE usertb1
(
  userid      CHAR(8) NOT NULL PRIMARY KEY,
  name        VARCHAR(10) NOT NULL,
  birthyear   INT NOT NULL,
  addr        CHAR(3) NOT NULL,
  mobile1     CHAR(3),
  mobile2     CHAR(8),
  height      SMALLINT,
  mdate       DATE
);

insert into usertb1 values('LSG', '이승기', 1987, '서울', '011', '1111111', 177, '2008-8-8');
insert into usertb1 values('KHJ', '김호중', 1989, '경북', '010', '2222222', 183, '2010-12-23');
insert into usertb1 values('PJH', '박지훈', 1996, '대전', '010', '3333333', 180, '2019-3-2');
insert into usertb1 values('JWI', '장원익', 1997, '경북', '010', '4444444', 183, '2021-1-8');
insert into usertb1 values('SHM', '손흥민', 1985, '인천', '011', '5555555', 186, '2003-6-15');
insert into usertb1 values('PJS', '박지성', 1974, '인전', '010', '6666666', 170, '2011-3-29');
insert into usertb1 values('JIJ', '조인준', 1950, '전남', '011', '7777777', 178, '2008-6-6');
insert into usertb1 values('KHD', '강호동', 1968, '부산', '010', '8888888', 183, '2013-4-17');
insert into usertb1 values('PMS', '박민수', 1993, '서울', '011', '9999999', 155, '2012-8-22');
insert into usertb1 values('LKI', '이강인', 2001, '전남', '070', '0000000', 176, '2001-2-13');

DROP TABLE IF EXISTS buytb1;

CREATE TABLE buytb1
(
  num         INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  userid      CHAR(8) NOT NULL,
  prodname    CHAR(6) NOT NULL,
  groupname   CHAR(4),
  price       INT NOT NULL,
  amount      SMALLINT NOT NULL,
  FOREIGN KEY  (userid) REFERENCES usertb1(userid)
);

insert into buytb1 values(NULL, "LSG", "책", null, 15, 5);
insert into buytb1 values(NULL, "JWI", "노트북", null, 1000, 1);
insert into buytb1 values(NULL, "LSG", "운동화", "의류", 130, 5);
insert into buytb1 values(NULL, "PJH", "청바지", "의류", 50, 8);
insert into buytb1 values(NULL, "KHJ", "모자", "의류", 20, 13);
insert into buytb1 values(NULL, "JIJ", "모자", null, 20, 6);
insert into buytb1 values(NULL, "JWI", "휴대폰", "가전", 800, 1);
insert into buytb1 values(NULL, "PJH", "책", null, 15, 10);
insert into buytb1 values(NULL, "KHJ", "운동화", "의류", 130, 3);
insert into buytb1 values(NULL, "PJH", "모자", null, 20, 3);
insert into buytb1 values(NULL, "PMS", "운동화", null, 130, 4);
insert into buytb1 values(NULL, "JIJ", "노트북", "가전", 1000, 1);
insert into buytb1 values(NULL, "KHD", "노트북", "가전", 1000, 1);
insert into buytb1 values(NULL, "PMS", "휴대폰", null, 800, 1);
insert into buytb1 values(NULL, "LSG", "노트북", null, 1000, 1);
insert into buytb1 values(NULL, "LKI", "청바지", null, 50, 2);
insert into buytb1 values(NULL, "PJH", "노트북", "가전", 1000, 1);