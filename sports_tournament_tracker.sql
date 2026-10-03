-- 12. Sports Tournament Tracker

CREATE DATABASE sports_tournament;
USE sports_tournament;

CREATE TABLE Teams (
    team_id INT PRIMARY KEY AUTO_INCREMENT,
    team_name VARCHAR(100) NOT NULL,
    coach_name VARCHAR(100),
    city VARCHAR(50)
);
CREATE TABLE Players (
    player_id INT PRIMARY KEY AUTO_INCREMENT,
    team_id INT,
    player_name VARCHAR(100),
    position VARCHAR(50),
    jersey_no INT,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);
CREATE TABLE Matches (
    match_id INT PRIMARY KEY AUTO_INCREMENT,
    team1_id INT, team2_id INT,
    match_date DATE, venue VARCHAR(100),
    team1_score INT, team2_score INT,
    winner_team_id INT,
    FOREIGN KEY (team1_id) REFERENCES Teams(team_id),
    FOREIGN KEY (team2_id) REFERENCES Teams(team_id)
);
CREATE TABLE Stats (
    stat_id INT PRIMARY KEY AUTO_INCREMENT,
    match_id INT, player_id INT,
    goals INT, assists INT, points INT,
    FOREIGN KEY (match_id) REFERENCES Matches(match_id),
    FOREIGN KEY (player_id) REFERENCES Players(player_id)
);

-- Sample Data
INSERT INTO Teams VALUES 
(1,'Mumbai Warriors','Rahul Dravid','Mumbai'),
(2,'Delhi Dynamos','Sourav Ganguly','Delhi'),
(3,'Chennai Kings','MS Dhoni','Chennai'),
(4,'Kolkata Knights','Gautam Gambhir','Kolkata');

INSERT INTO Players (team_id, player_name, position, jersey_no) VALUES
(1,'Virat Sharma','Forward',10),
(1,'Rohit Patil','Midfielder',7),
(2,'KL Rahul','Forward',9),
(3,'Jadeja','All-rounder',12),
(4,'Shreyas Iyer','Forward',10);

INSERT INTO Matches (team1_id, team2_id, match_date, venue, team1_score, team2_score, winner_team_id) VALUES
(1,2,'2026-09-20','Wankhede',3,2,1),
(3,4,'2026-09-21','Chepauk',1,1,NULL),
(1,3,'2026-09-22','Wankhede',2,0,1);

-- Views for Leaderboard
CREATE VIEW PointsTable AS
SELECT t.team_name,
SUM(CASE WHEN m.winner_team_id = t.team_id THEN 3 WHEN m.winner_team_id IS NULL THEN 1 ELSE 0 END) AS total_points
FROM Teams t LEFT JOIN Matches m ON t.team_id=m.team1_id OR t.team_id=m.team2_id
GROUP BY t.team_id ORDER BY total_points DESC;

CREATE VIEW Leaderboard AS
SELECT p.player_name, t.team_name, SUM(s.goals) as goals, SUM(s.points) as points
FROM Players p JOIN Teams t ON p.team_id=t.team_id JOIN Stats s ON p.player_id=s.player_id
GROUP BY p.player_id ORDER BY points DESC;

-- CTE for average performance
WITH PlayerAvg AS (
 SELECT p.player_name, AVG(s.points) AS avg_points FROM Players p JOIN Stats s ON p.player_id=s.player_id GROUP BY p.player_id
)
SELECT * FROM PlayerAvg WHERE avg_points > 4;
