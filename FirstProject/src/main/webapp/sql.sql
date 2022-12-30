select * from members;
select * from schedule;
select * from diary;
select * from study_time;
select * from score;
select * from board;
select * from comments;
select * from d_day;
select * from memo;

select *
from (select * 
      from d_day
      where id='1234'
      and to_date(d_day_dt) >= (sysdate-1)
      order by d_day_dt)
where rownum <= 1;

select * from schedule;

select * from board;

select * from study_time;

insert into diary
values(3,'일기','일기일기',null,sysdate,1234);

insert into comments
values(3, 16, '집22212312에 가고싶다', sysdate, 1234);

select sysdate from dual;

select * from board;