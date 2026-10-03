# 12. Sports Tournament Tracker

**Objective:** Manage match results and player statistics.

**Tools Used:** MySQL

### Project Description
This project creates a complete database for a sports tournament to track teams, players, match results, and individual player performance.

### Database Schema
1.  **Teams:** team_id, team_name, coach_name, city
2.  **Players:** player_id, team_id, player_name, position, jersey_no
3.  **Matches:** match_id, team1_id, team2_id, match_date, venue, scores, winner
4.  **Stats:** stat_id, match_id, player_id, goals, assists, points

### Features Implemented
1.  **Schema Creation:** Created 4 interrelated tables with Primary & Foreign Keys.
2.  **Sample Data:** Inserted 4 teams and 8+ players with 5 match records.
3.  **Queries:** 
    - Match results with team names
    - Top scorers query
4.  **Views:**
    - `PointsTable` - Calculates Wins, Losses, Draws and Total Points (3 for win, 1 for draw)
    - `Leaderboard` - Shows top players by goals and points
5.  **CTE Used:** `PlayerAvg` CTE to calculate average player performance and filter high performers.
6.  **Reports:** Team performance summary report.

### How to Run
1. Run `sports_tournament_tracker.sql` in MySQL Workbench / DBeaver
2. Use `SELECT * FROM PointsTable;` to see points table
3. Use `SELECT * FROM Leaderboard;` to see player leaderboard

### Deliverables
- Schema (4 Tables)
- Sample Data
- Queries for match results
- Views for leaderboards
- CTE for average performance
- Team performance report

Submitted by: Khushi Yadav
Elevate Labs - SQL Task 12
