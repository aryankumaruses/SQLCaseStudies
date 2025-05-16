create database practice_sql;

create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);

INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');

select * from icc_world_cup;

select distinct(Team_1) as Team_Name,
		count(Team_1) as Matches_played,
        sum(win_flag) as no_of_matches_won,  -- the sum of win_flag from union with group by team_name gives the count of win matches 
        count(Team_1)-sum(win_flag) as no_of_matches_loose
from(
select Team_1, case when Team_1 = Winner then 1 else 0 end as win_flag  -- Here win flag identifies winner from Team_1
from icc_world_cup
union all 
select Team_2, case when Team_2= Winner then 1 else 0 end as win_flag  -- Here win flag identifies winner from Team_2
from icc_world_cup) as subquery
group by Team_1;
