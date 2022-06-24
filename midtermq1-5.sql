#create a view of all the tournaments that have been played at red rooster
create view RRooster as
select TourneyID, TournamentLocation
from tournaments
where TournamentLocation = "Red Rooster Arena";

#check View works
select *
from RRooster;
