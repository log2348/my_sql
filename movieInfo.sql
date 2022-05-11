CREATE DATABASE movieInfo;
USE movieInfo;

drop database movieInfo;


CREATE TABLE movie (
	title VARCHAR(30) NOT NULL PRIMARY KEY,
    releaseDate date NOT NULL,
    starScore FLOAT,
    genre varchar(10)
);

DROP TABLE score;
DROP TABLE movie;
DROP TABLE releaseYear;
DROP TABLE role;


CREATE TABLE score(
	title VARCHAR(30) NOT NULL PRIMARY KEY,
    audience INT,
    sales DECIMAL(65),
    FOREIGN KEY(title) REFERENCES movie(title)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE role(
	title VARCHAR(30) NOT NULL,
    actorName VARCHAR(20) NOT NULL,
    category CHAR(2),
    roleName VARCHAR(20)
);

ALTER TABLE role ADD PRIMARY KEY (title, actorName);

ALTER TABLE role
	ADD CONSTRAINT
     FOREIGN KEY(title) REFERENCES movie(title)
	ON UPDATE CASCADE
    ON DELETE CASCADE;
  
 /* 
ALTER TABLE role
	ADD CONSTRAINT
	FOREIGN KEY(actorName) REFERENCES actor(actorName)
	ON UPDATE CASCADE
    ON DELETE CASCADE;
*/

CREATE TABLE actor(
	id int auto_increment NOT NULL PRIMARY KEY,
	actorName VARCHAR(20) not null,
    birthYear INT NOT NULL,
    height INT NOT NULL,
    weight INT NOT NULL,
    partner VARCHAR(20)
);

SELECT * FROM movie;
INSERT INTO movie VALUES ('반지의 제왕', 2003, 9.90, '판타지');
INSERT INTO movie VALUES ('아이언맨', 2008-04-30, 8.4, '액션');
INSERT INTO movie VALUES ('극한직업', 2019-01-23, 9.2, '코미디');
INSERT INTO movie VALUES ('범죄도시', 2017-10-03, 9.28, '액션');
INSERT INTO movie VALUES ('토르: 라그나로크', 2017-10-25, 9.03, '액션');
INSERT INTO movie VALUES ('베테랑', 2015-08-05, 9.24, '액션');

SELECT * FROM actor;
INSERT INTO actor VALUES ('로버트 다우니 주니어', 1965, 174, 65, '수잔 다우니');
INSERT INTO actor VALUES ('기네스 팰트로', 1972, 175, 61, NULL);
INSERT INTO actor VALUES ('테렌스 하워드', 1969, 184, 75, NULL);
INSERT INTO actor VALUES ('이하늬', 1983, 173, 56, NULL);
INSERT INTO actor VALUES ('류승룡', 1970, 175, 72, NULL);
INSERT INTO actor VALUES ('진선규', 1999, 177, 70, '박보경');
INSERT INTO actor VALUES ('이동휘', 1985, 179, 67, NULL);
INSERT INTO actor VALUES ('공명', 1994, 183, 73, NULL);
INSERT INTO actor VALUES ('일라이저 우드', 1981, 168, 73, NULL);
INSERT INTO actor VALUES ('숀 애스틴', 1971, 170, 67, NULL);
INSERT INTO actor VALUES ('앤디 서키스', 1964, 171, 65, NULL);
INSERT INTO actor VALUES ('마동석', 1971, 178, 100, NULL);
INSERT INTO actor VALUES ('윤계상', 1978, 182, 77, '차혜영');
INSERT INTO actor VALUES ('최귀화', 1978, 181, 72, NULL);
INSERT INTO actor VALUES ('조재윤', 1974, 174, 75, '조은애');
INSERT INTO actor VALUES ('유아인', 1986, 179, 71, NULL);
INSERT INTO actor VALUES ('황정민', 1999, 180, 75, '김미혜');
INSERT INTO actor VALUES ('유해진', 1970, 174, 65, NULL);
INSERT INTO actor VALUES ('오달수', 1968, 176, 68, NULL);


SELECT * FROM score;
INSERT INTO score VALUES ('아이언맨', 430, 430*10000);
INSERT INTO score VALUES ('반지의 제왕', 700, 700*10000);
INSERT INTO score VALUES ('극한직업', 1620, 1620*10000);
INSERT INTO score VALUES ('범죄도시', 688, 688*10000);
INSERT INTO score VALUES ('토르: 라그나로크', 688, 688*10000);
INSERT INTO score VALUES ('베테랑', 1340, 1340*10000);


SELECT * FROM role;
INSERT INTO role VALUES ('아이언맨', '로버트 다우니 주니어', '주연', '토니 스타크');
INSERT INTO role VALUES ('아이언맨', '기네스 팰트로우', '주연', '페퍼 포츠');
INSERT INTO role VALUES ('아이언맨', '테렌스 하워드', '조연', '제임스 로드');

INSERT INTO role VALUES ('극한직업', '이하늬', '주연', '장형사');
INSERT INTO role VALUES ('극한직업', '류승룡', '주연', '고반장');
INSERT INTO role VALUES ('극한직업', '진선규', '주연', '마형사');
INSERT INTO role VALUES ('극한직업', '이동휘', '주연', '영호');
INSERT INTO role VALUES ('극한직업', '공명', '주연', '재훈');

INSERT INTO role VALUES ('반지의 제왕', '일라이저 우드', '주연', '프로도');
INSERT INTO role VALUES ('반지의 제왕', '숀 애스틴', '주연', '샘');
INSERT INTO role VALUES ('반지의 제왕', '앤디 서키스', '주연', '골룸');

INSERT INTO role VALUES ('범죄도시', '마동석', '주연', '마석도');
INSERT INTO role VALUES ('범죄도시', '윤계상', '주연', '장첸');
INSERT INTO role VALUES ('범죄도시', '최귀화', '조연', '전반장');
INSERT INTO role VALUES ('범죄도시', '조재윤', '조연', '황사장');

INSERT INTO role VALUES ('토르: 라그나로크', '크리스 헴스워스', '주연', '토르');
INSERT INTO role VALUES ('토르: 라그나로크', '마크 러팔로', '주연','헐크');
INSERT INTO role VALUES ('토르: 라그나로크', '톰 히들스턴', '주연', '로키');

INSERT INTO role VALUES ('베테랑', '유아인', '주연', '조태오');
INSERT INTO role VALUES ('베테랑', '황정민', '주연', '서도철');
INSERT INTO role VALUES ('베테랑', '유해진', '주연', '최상무');
INSERT INTO role VALUES ('베테랑', '오달수', '조연', '오팀장');



UPDATE actor SET actorName = '현빈' WHERE actorName = '마동석';

UPDATE movie SET title = '반지의 제왕' WHERE title = '반지의 제왕2';

DELETE FROM actor WHERE actorName = '황정민';

UPDATE role SET actorName = NULL WHERE actorName = '황정민';

SELECT *
FROM actor a
INNER JOIN role r
ON a.actorName = r.actorName;

SELECT *
FROM actor a
LEFT OUTER JOIN role r
ON a.actorName = r.actorName;

SELECT *
FROM score s
LEFT JOIN movie m
ON s.title = m.title
INNER JOIN role r
ON m.title = r.title;

