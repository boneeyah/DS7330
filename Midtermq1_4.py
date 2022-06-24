#!/usr/bin/env python
# coding: utf-8

# In[10]:



"""
1.4.1 Provide locations where the association is holding Tournaments
"""
from __future__ import print_function        # make print a function
import mysql.connector                       # mysql functionality
import sys                                   # for misc errors

SERVER   = "localhost"        # db server to connect to
USERNAME = "root"                            # user to connect as
PASSWORD = "No$Veremos3n3l3xilio"                            # user's password
DATABASE = "BasketballTournament"                              # db to user
QUERY    = "select distinct TournamentLocation as Locations from Tournaments;"       # query statement

if __name__ == "__main__":
   try:
      # initialize db connection
      con = mysql.connector.connect(host=SERVER,user=USERNAME,password=PASSWORD,
                                    database=DATABASE)

      print("Connection established.")

      # initialize a cursor
      cursor = con.cursor()

      # query db
      cursor.execute(QUERY)

      print("Query executed: '{0}'\n\nResults:".format(QUERY))

      # print table header
      print("".join(["{:<12}".format(col) for col in cursor.column_names]))
      print("--------------------------------------------")

      # iterate through results
      for row in cursor:
         print("".join(["{:<12}".format(col) for col in row]))

   except mysql.connector.Error as e:        # catch SQL errors
      print("SQL Error: {0}".format(e.msg))
   except:                                   # anything else
      print("Unexpected error: {0}".format(sys.exc_info()[0]))


# In[11]:



"""
1.4.2 Display all Players and their address formatted suitably for a mailing list, sorted by zip code
"""
#from __future__ import print_function        # make print a function
import mysql.connector                       # mysql functionality
import sys                                   # for misc errors

SERVER   = "localhost"        # db server to connect to
USERNAME = "root"                            # user to connect as
PASSWORD = "No$Veremos3n3l3xilio"                            # user's password
DATABASE = "BasketballTournament"                              # db to user
QUERY    = "select PlayerFirstName as First_Name, PlayerLastName as Last_Name, PlayerAddress as Street, PlayerCity as City, Playerstate as State, PlayerZip as Zipcode from Players order by PlayerZip;"       # query statement

if __name__ == "__main__":
   try:
      # initialize db connection
      con = mysql.connector.connect(host=SERVER,user=USERNAME,password=PASSWORD,
                                    database=DATABASE)

      print("Connection established.")

      # initialize a cursor
      cursor = con.cursor()

      # query db
      cursor.execute(QUERY)

      print("Query executed: '{0}'\n\nResults:".format(QUERY))

      # print table header
      print("".join(["{:<12}".format(col) for col in cursor.column_names]))
      print("--------------------------------------------")

      # iterate through results
      for row in cursor:
         print("".join(["{:<12}".format(col) for col in row]))

   except mysql.connector.Error as e:        # catch SQL errors
      print("SQL Error: {0}".format(e.msg))
   except:                                   # anything else
      print("Unexpected error: {0}".format(sys.exc_info()[0]))


# In[14]:



"""
1.4.3 display Teams and the name of the head coach
"""
#from __future__ import print_function        # make print a function
import mysql.connector                       # mysql functionality
import sys                                   # for misc errors

SERVER   = "localhost"        # db server to connect to
USERNAME = "root"                            # user to connect as
PASSWORD = "No$Veremos3n3l3xilio"                            # user's password
DATABASE = "BasketballTournament"                              # db to user
QUERY    = "select TeamName as Team, concat(Coach_FirstName,\" \",Coach_LastName) as Coach from Teams;"       # query statement

if __name__ == "__main__":
   try:
      # initialize db connection
      con = mysql.connector.connect(host=SERVER,user=USERNAME,password=PASSWORD,
                                    database=DATABASE)

      print("Connection established.")

      # initialize a cursor
      cursor = con.cursor()

      # query db
      cursor.execute(QUERY)

      print("Query executed: '{0}'\n\nResults:".format(QUERY))

      # print table header
      print("".join(["{:<12}".format(col) for col in cursor.column_names]))
      print("--------------------------------------------")

      # iterate through results
      for row in cursor:
         print("".join(["{:<12}".format(col) for col in row]))

   except mysql.connector.Error as e:        # catch SQL errors
      print("SQL Error: {0}".format(e.msg))
   except:                                   # anything else
      print("Unexpected error: {0}".format(sys.exc_info()[0]))


# In[15]:



"""
1.4.4 Show Tournaments that have not been played yet
"""
#from __future__ import print_function        # make print a function
import mysql.connector                       # mysql functionality
import sys                                   # for misc errors

SERVER   = "localhost"        # db server to connect to
USERNAME = "root"                            # user to connect as
PASSWORD = "No$Veremos3n3l3xilio"                            # user's password
DATABASE = "BasketballTournament"                              # db to user
QUERY    = "select S.TourneyID as Tournament_ID from (select Tournaments.tourneyID, GameID from Tournaments left outer join Matches on Tournaments.TourneyID=Matches.TourneyID where GameID is null) as S;"       # query statement

if __name__ == "__main__":
   try:
      # initialize db connection
      con = mysql.connector.connect(host=SERVER,user=USERNAME,password=PASSWORD,
                                    database=DATABASE)

      print("Connection established.")

      # initialize a cursor
      cursor = con.cursor()

      # query db
      cursor.execute(QUERY)

      print("Query executed: '{0}'\n\nResults:".format(QUERY))

      # print table header
      print("".join(["{:<12}".format(col) for col in cursor.column_names]))
      print("--------------------------------------------")

      # iterate through results
      for row in cursor:
         print("".join(["{:<12}".format(col) for col in row]))

   except mysql.connector.Error as e:        # catch SQL errors
      print("SQL Error: {0}".format(e.msg))
   except:                                   # anything else
      print("Unexpected error: {0}".format(sys.exc_info()[0]))


# In[17]:



"""
1.4.5 Display name of top 10 scorers (Players who scored highest) along with their Scores
"""
#from __future__ import print_function        # make print a function
import mysql.connector                       # mysql functionality
import sys                                   # for misc errors

SERVER   = "localhost"        # db server to connect to
USERNAME = "root"                            # user to connect as
PASSWORD = "No$Veremos3n3l3xilio"                            # user's password
DATABASE = "BasketballTournament"                              # db to user
QUERY    = "select Player, Points_scored from(select PlayerID, concat(PlayerFirstName,\" \", PlayerLastName) as Player, sum(Playerscore) as Points_scored from Players natural join Scores group by PlayerID order by Points_scored desc limit 10) as S;"       # query statement

if __name__ == "__main__":
   try:
      # initialize db connection
      con = mysql.connector.connect(host=SERVER,user=USERNAME,password=PASSWORD,
                                    database=DATABASE)

      print("Connection established.")

      # initialize a cursor
      cursor = con.cursor()

      # query db
      cursor.execute(QUERY)

      print("Query executed: '{0}'\n\nResults:".format(QUERY))

      # print table header
      print("".join(["{:<12}".format(col) for col in cursor.column_names]))
      print("--------------------------------------------")

      # iterate through results
      for row in cursor:
         print("".join(["{:<12}".format(col) for col in row]))

   except mysql.connector.Error as e:        # catch SQL errors
      print("SQL Error: {0}".format(e.msg))
   except:                                   # anything else
      print("Unexpected error: {0}".format(sys.exc_info()[0]))


# In[18]:



"""
1.4.6 Display Players' names along with their highest score
"""
#from __future__ import print_function        # make print a function
import mysql.connector                       # mysql functionality
import sys                                   # for misc errors

SERVER   = "localhost"        # db server to connect to
USERNAME = "root"                            # user to connect as
PASSWORD = "No$Veremos3n3l3xilio"                            # user's password
DATABASE = "BasketballTournament"                              # db to user
QUERY    = "select Player, Points_scored from(select PlayerID, concat(PlayerFirstName,\" \", PlayerLastName) as Player, sum(Playerscore) as Points_scored from Players natural join Scores group by PlayerID order by PlayerLastName, PlayerFirstName) as S;"       # query statement

if __name__ == "__main__":
   try:
      # initialize db connection
      con = mysql.connector.connect(host=SERVER,user=USERNAME,password=PASSWORD,
                                    database=DATABASE)

      print("Connection established.")

      # initialize a cursor
      cursor = con.cursor()

      # query db
      cursor.execute(QUERY)

      print("Query executed: '{0}'\n\nResults:".format(QUERY))

      # print table header
      print("".join(["{:<12}".format(col) for col in cursor.column_names]))
      print("--------------------------------------------")

      # iterate through results
      for row in cursor:
         print("".join(["{:<12}".format(col) for col in row]))

   except mysql.connector.Error as e:        # catch SQL errors
      print("SQL Error: {0}".format(e.msg))
   except:                                   # anything else
      print("Unexpected error: {0}".format(sys.exc_info()[0]))


# In[19]:



"""
1.4.7 List the Players (Names) whose highest score in a game is more than 10 points higer than their average
"""
#from __future__ import print_function        # make print a function
import mysql.connector                       # mysql functionality
import sys                                   # for misc errors

SERVER   = "localhost"        # db server to connect to
USERNAME = "root"                            # user to connect as
PASSWORD = "No$Veremos3n3l3xilio"                            # user's password
DATABASE = "BasketballTournament"                              # db to user
QUERY    = "select distinct Player, Average, max(PlayerScore) as Max_Points from(select PlayerID, GameID, Player, Average, PlayerScore from (select PlayerID, concat(PlayerFirstName,\" \", PlayerLastName) as Player, avg(PlayerScore) as Average from Players natural join Scores group by PlayerID) as S natural join Scores where PlayerScore>Average+10) as T group by Player, Average;"
if __name__ == "__main__":
   try:
      # initialize db connection
      con = mysql.connector.connect(host=SERVER,user=USERNAME,password=PASSWORD,
                                    database=DATABASE)

      print("Connection established.")

      # initialize a cursor
      cursor = con.cursor()

      # query db
      cursor.execute(QUERY)

      print("Query executed: '{0}'\n\nResults:".format(QUERY))

      # print table header
      print("".join(["{:<12}".format(col) for col in cursor.column_names]))
      print("--------------------------------------------")

      # iterate through results
      for row in cursor:
         print("".join(["{:<12}".format(col) for col in row]))

   except mysql.connector.Error as e:        # catch SQL errors
      print("SQL Error: {0}".format(e.msg))
   except:                                   # anything else
      print("Unexpected error: {0}".format(sys.exc_info()[0]))
