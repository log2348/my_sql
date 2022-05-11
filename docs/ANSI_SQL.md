# MYSQL 연습문제 - 2 





### ANSI SQL

**DBMS**(Oracle, My-SQL, MSSQL 등등)**들에서 각기 다른 SQL를 사용**하므로, **미국 표준 협회**(American National Standards Institute)**에서** 이를 표준화하여 **표준 SQL문을 정립 시켜 놓은 것**이다.

 



### ANSI SQL 특징

1. 표준 SQL문이기 때문에 DBMS의 종류에 제약을 받지 않는다. (MySQL, Oracle..)
   즉, 특정 벤더에 종속적이지 않아 다른 벤더의 DBMS로 교체하더라도 빠르게 다른 벤더사를 이동할 수 있다.
   특정 DBMS의 이탈이 가속되는 것도 ANSI SQL의 영향이 크다고 할 수 있다.
2. 테이블간의 Join 관계가 FROM 에서 명시되기 때문에 WHERE 문에서 조건만 확인하면 된다.
   즉, 가독성이 일반 Query문보다 좋다.











앨범 테이블 

![img](https://blog.kakaocdn.net/dn/cdIEcU/btrzLwEmz0g/cvCGcBYzskmivDeqCJk51K/img.png)





곡 테이블 

![img](https://blog.kakaocdn.net/dn/GjTyY/btrzNCjyZhO/BeRc1MHYpspmRJ9VlXmz1k/img.png)





```sql
use nation; 


앨범 테이블 설계 



곡 테이블 설꼐 


-- 샘플 데이터 
INSERT INTO 앨범 VALUES(1,'조용필','조용필',11500,'1984-10-01','벅스',9.8);
INSERT INTO 앨범 VALUES(2,'사랑하기 때문에','유재하',10400,'1987-08-20','KingPin',9.7);
INSERT INTO 앨범 VALUES(3, 'Break Up 2 Make Up','지코(ZICO)',700,'2016-01-25','CJ E&M MUSIC',7.6);
INSERT INTO 앨범 VALUES(4, '도깨비 OST Part 8','정준일',500,'2017-01-01','CJ E&M MUSIC',9.5);
INSERT INTO 앨범 VALUES(5, '도깨비 OST Part 9','에일리',600,'2017-01-07','CJ E&M MUSIC',8);
INSERT INTO 곡(앨범번호,디스크,곡번호,곡명) VALUES(1,1,1,'돌아와요 부산항에');
INSERT INTO 곡(앨범번호,디스크,곡번호,곡명) VALUES(1,1,9,'해변의 여인');
INSERT INTO 곡(앨범번호,디스크,곡번호,곡명) VALUES(1,1,11,'옛 일');
INSERT INTO 곡(앨범번호,디스크,곡번호,곡명) VALUES(1,1,12,'서러워 말아요');
INSERT INTO 곡(앨범번호,디스크,곡번호,곡명) VALUES(1,1,15,'생각이 나네');
INSERT INTO 곡(앨범번호,디스크,곡번호,곡명) VALUES(2,1,1,'우리들의 사랑');
INSERT INTO 곡(앨범번호,디스크,곡번호,곡명) VALUES(2,1,2,'그대 내 품에');
INSERT INTO 곡(앨범번호,디스크,곡번호,곡명) VALUES(2,1,9,'사랑하기 때문에');
INSERT INTO 곡(앨범번호,디스크,곡번호,곡명) VALUES(3,1,1,'너는 나 나는 너');
INSERT INTO 곡(앨범번호,디스크,곡번호,곡명) VALUES(3,1,2,'사랑이었다 (Feat. 루나 of f(x))');
INSERT INTO 곡(앨범번호,디스크,곡번호,곡명) VALUES(4,1,1,'첫 눈');
INSERT INTO 곡(앨범번호,디스크,곡번호,곡명,구분) VALUES(4,1,2,'첫 눈','Inst.');
INSERT INTO 곡(앨범번호,디스크,곡번호,곡명,구분) VALUES(5,1,1,'첫눈처럼 너에게 가겠다','원곡');
INSERT INTO 곡(앨범번호,디스크,곡번호,곡명,구분) VALUES(5,1,2,'첫눈처럼 너에게 가겠다','Inst.');


select * from 곡;
select * from 앨범; 


-- 1. '해변의 여인'이라는 노래를 담고 있는 타이틀과 아티스트를 검색하라.




-- 2. '그대내품에'라는 노래를 부른 아티스트를 검색하라.

  




-- 문제 3. 'Break Up 2 Make Up'이라는 이름을 가지고 있는 앨범에 수록된 노래를 모두 검색하라.




-- 문제 4. 각 앨범에 수록된 타이틀별 수록곡의 개수를 검색하라.




-- 문제 5. '사랑'이라는 단어가 포함된 곡명을 가진 앨범의 타이틀별 수록곡의 개수를 검색하라.





-- 문제 6 타이틀과 곡명이 동일한 앨범의 노래 이름을 검색하라.


  

-- 문제 7 예를 들어 그룹 'Blur'가 'Blur'라는 이름의 앨범을 발매할 수 있다.
-- 이와 같이 아티스트와 타이틀이 동일한 앨범의 타이틀을 검색하라.




-- 문제 8 동일한 곡명이 2개 이상 앨범에 존재하는 경우,
-- 해당 곡명과 수록 곡의 개수를 검색하라.



```











