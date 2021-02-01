.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet from students where color ='blue' and pet='dog';

CREATE TABLE bluedog_songs AS
  SELECT color, pet,song from students where color ='blue' and pet='dog';


CREATE TABLE smallest_int AS
  SELECT time , smallest FROM students WHERE smallest>2 ORDER BY smallest  limit 20;


CREATE TABLE matchmaker AS
  SELECT A.pet,A.song, A.color, B.color from students as A, students as B where A.time != B.time and A.pet=B.pet and A.song=B.song;


CREATE TABLE sevens AS
  SELECT seven from students as s, numbers as n where s.time=n.time and s.number=7 and n.'7'='True';
