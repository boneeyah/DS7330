#Provide locations
select distinct TournamentLocation as Locations
from tournaments;

#display all players and their address formatted suitably for a mailing list, sorted by zipcode
select PlayerFirstName as First_Name, PlayerLastName as Last_Name, PlayerAddress as Street, PlayerCity as City, PlayerState as State, PlayerZip as Zipcode
from players
order by PlayerZip;

#display teams and the name of their head coach
select TeamName as Team, concat(Coach_FirstName," ",Coach_LastName) as Coach
from teams;

#Show tournaments that have not been played yet
select S.TourneyID as Tournament_ID
from (select tournaments.tourneyID, GameID
from tournaments left outer join matches on tournaments.TourneyID=matches.TourneyID
where GameID is null) as S;

#display names of top 10 scorers along with scores
select Player, Points_scored
from(select PlayerID, concat(PlayerFirstName," ", PlayerLastName) as Player, sum(PlayerScore) as Points_scored
from players natural join scores
group by PlayerID
order by Points_scored desc
limit 10) as S;

#display players' names along with their highest score
select Player, Points_scored
from(select PlayerID, concat(PlayerFirstName," ", PlayerLastName) as Player, sum(PlayerScore) as Points_scored
from players natural join scores
group by PlayerID
order by PlayerLastName, PlayerFirstName) as S;

#list the player names whose highest score in a game is more than 10 points higher than their average
select distinct Player, Average, max(PlayerScore) as Max_Points_Scored
from(select PlayerID, GameID, Player, Average, PlayerScore
from(select PlayerID, concat(PlayerFirstName, " ", PlayerLastName) as Player, avg(PlayerScore) as Average
from players natural join scores
group by PlayerID)as S natural join scores
where PlayerScore > Average + 10) as T
group by Player;
