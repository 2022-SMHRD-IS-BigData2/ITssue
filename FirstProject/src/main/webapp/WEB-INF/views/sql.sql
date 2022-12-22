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