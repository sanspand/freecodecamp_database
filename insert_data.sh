#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi
TABLE_TRUNCATE=$($PSQL "TRUNCATE TABLE teams, games;")
echo $TABLE_TRUNCATE
# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS=',' read year round winner opponent winner_goals opponent_goals
do 
if [[ $year != 'year' ]]
then
  team_exists=$($PSQL "SELECT team_id FROM teams WHERE name='$winner';")
  if [[ -z $team_exists ]]; then
    # Insert the team if it doesn't exist
    insert_result=$($PSQL "INSERT INTO teams(name) VALUES('$winner');")
    echo "Inserted team: $winner"
  else
    echo "Team already exists: $winner"
  fi
  team_exists=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent';")
  if [[ -z $team_exists ]]
  then
    # Insert the team if it doesn't exist
    insert_result=$($PSQL "INSERT INTO teams(name) VALUES('$opponent');")
    echo "Inserted team: $opponent"
  else
    echo "Team already exists: $opponent"
  fi
#for games table
  winner_id=$($PSQL "SELECT team_id FROM teams WHERE name='$winner';")
  opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent';")
  insert_result=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ('$year', '$round', $winner_id, $opponent_id, $winner_goals, $opponent_goals);")
  if [[ $? -eq 0 ]]
  then
  echo "Game record inserted successfully."
  else
  echo "Error inserting game record."
  fi

fi

done