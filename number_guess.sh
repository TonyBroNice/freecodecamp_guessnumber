#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

USERNAME_IN_BASE=$($PSQL "SELECT username FROM users where username='$USERNAME'")
GAMES_PLAYED=$($PSQL "SELECT count(game_id) FROM games INNER JOIN users USING (user_id) where username='$USERNAME'")
BEST_GAME=$($PSQL "SELECT min(result) FROM games INNER JOIN users USING (user_id) where username='$USERNAME'")
if [[ $USERNAME_IN_BASE == $USERNAME ]]
then
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses." 
else 
  INSERT_USERNAME=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
fi
#Guess number
echo "Guess the secret number between 1 and 1000:"
#Get random number
RANDOM_NUM=$(( 1 + $RANDOM % 1000 ))
ATTEMPT=1
while read NUM
do
    if [[ ! $NUM =~ ^[0-9]+$ ]]
    then
    echo "That is not an integer, guess again:"
    else
      if [[ $NUM == $RANDOM_NUM ]]
      then
      echo "You guessed it in $ATTEMPT tries. The secret number was $RANDOM_NUM. Nice job!" 
      break
      else
        if [[ $NUM > $RANDOM_NUM ]]
        then
        echo "It's higher than that, guess again:"
        elif [[ $NUM < $RANDOM_NUM ]]
        then
        echo "It's lower than that, guess again:"
        fi
      fi
    fi
    #Count attempts
    (( ATTEMPT ++ ))
done


#Insert result
INSERT_RESULT=$($PSQL "INSERT INTO games(user_id, result) VALUES((SELECT user_id FROM users where username='$USERNAME'), $ATTEMPT)")
