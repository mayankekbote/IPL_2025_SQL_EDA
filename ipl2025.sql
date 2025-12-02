use ipl_2025;
-- data exploration 
-- number of rows
select count(*) as NumberofPlayers from ipl2025;
-- sample data
select * from ipl2025 limit 05;

-- null values

select * from ipl2025 
where
Player_name is null or
Team is null or
Matches is null or 
Innings is null or
Notout is null or 
Highest is null or
Average is null or
BallsFaced is null or
StrikeRate is null or 
Hundreds is null or
fifties is null or 
Fours is null or
Sixes is null; 



-- Check if Player is present multiple no of times
SELECT Player_name, COUNT(Player_name) AS total_occurences
FROM ipl2025
GROUP BY Player_name
HAVING COUNT(Player_name) > 1;


-- EDA 

-- Which player scored the highest total runs in IPL 2025?
select Player_name , Team, Runs from ipl2025 where Runs = (select max(Runs) from ipl2025);

-- Who has the highest batting average among players with at least 5 innings?

select Player_name,Team,Average 
from ipl2025
where Average = (select max(Average) from ipl2025)
and Innings >4 ;
-- Which player hit the most sixes in the tournament?
Select Player_name,Team,Sixes from ipl2025
where sixes= (select max(Sixes) from ipl2025);


-- Who has the highest strike rate among players who faced at least 100 balls?
select Player_name,Team,StrikeRate,BallsFaced
from ipl2025
where BallsFaced>=100
order by StrikeRate desc
limit 1;

-- Which player has the lowest strike rate among players with more than 50 balls faced?
select Player_name,Team,StrikeRate,BallsFaced
from ipl2025
where BallsFaced>= 50
order by StrikeRate asc
limit 1;

-- Which player has scored the most fifties?
select Player_name,Fifties
from ipl2025 
where Fifties = (select max(Fifties) from ipl2025);

-- Total Runs by Each Team

SELECT Team, SUM(Runs) AS total_runs
FROM ipl2025
GROUP BY Team
ORDER BY total_runs DESC;

-- Which team hit the most sixes collectively?
SELECT Team, SUM(Sixes) AS total_sixes
FROM ipl2025
GROUP BY Team
ORDER BY total_sixes DESC
limit 1;

-- Which player has the most not-outs?
SELECT Player_name, Team, NotOut, BallsFaced
FROM ipl2025
WHERE BallsFaced > 50 
  AND NotOut = (SELECT max(NotOut) FROM ipl2025 WHERE BallsFaced > 50);

-- Categorise Players as Anchors,Finishers
SELECT 
    Player_name,
    Runs,
    StrikeRate,
    Average,
    CASE 
        WHEN StrikeRate <= 130 AND Average >= 30 THEN 'Anchor'
        WHEN StrikeRate > 170 AND Average < 40 THEN 'Finisher'
		WHEN Sixes>30 Then "Six Hitter"
        When StrikeRate<130 and Average<35 then "Poor Batter"
		WHEN StrikeRate BETWEEN 140 AND 170 AND Average BETWEEN 40 AND 50 THEN 'Aggressive Opener'
        WHEN Fours + Sixes > 75 THEN 'Boundary Specialist'
        ELSE 'Other'
    END AS Category
FROM ipl2025
WHERE BallsFaced >= 100;


DROP VIEW IF EXISTS PlayerInsights;

CREATE VIEW PlayerInsights AS
SELECT 
    Player_name,
    Team,
    Runs,
    BallsFaced,
    StrikeRate,
    Average,
    Fours,
    Sixes,
    CASE 
        WHEN StrikeRate <= 130 AND Average >= 30 THEN 'Anchor'
        WHEN StrikeRate > 170 AND Average < 40 THEN 'Finisher'
        WHEN Sixes>30 THEN 'Six Hitter'
        WHEN StrikeRate<130 AND Average<35 THEN 'Poor Batter'
        WHEN StrikeRate BETWEEN 140 AND 170 AND Average BETWEEN 40 AND 50 THEN 'Aggressive Opener'
        WHEN Fours + Sixes > 75 THEN 'Boundary Specialist'
        ELSE 'Calculated Batter'
    END AS Category
FROM ipl2025
WHERE BallsFaced >= 100;


select* from playerInsights
limit 10;


