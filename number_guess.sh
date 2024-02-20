#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "\n~~~ Number guessing game ~~~"

# get username
echo -e "\nEnter your username:"
read USERNAME

# get username info
CHECK_USERNAME=$($PSQL "SELECT username FROM user_info WHERE username='$USERNAME';")

# if username not found
if [[ -z $CHECK_USERNAME ]]
then 
  # greet and insert into database
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here.\n"
  INSERT_USERNAME=$($PSQL "INSERT INTO user_info(username) VALUES('$USERNAME');")
else
  USER_ID=$($PSQL "SELECT user_id FROM user_info WHERE username='$USERNAME'")
  USER_NAME_DB=$($PSQL "SELECT username FROM user_info WHERE username='$USERNAME'")
  GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM game_info FULL JOIN user_info USING(user_id) WHERE username='$USERNAME';")
  BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM game_info FULL JOIN user_info USING(user_id) WHERE user_id=$USER_ID;")

  echo Welcome back, $USER_NAME_DB\! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
fi

# generate random number
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

# number of guesses
NUMBER_OF_GUESSES=0

echo "Guess the secret number between 1 and 1000:"
read USER_GUESS

GET_NUMBER() {

  # for invalid guess
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
    then
      echo -e "\nThat is not an integer, guess again:"
      read USER_GUESS
      (( NUMBER_OF_GUESSES++ ))
    
    else
      if [[ $USER_GUESS < $SECRET_NUMBER ]]
        then 
          echo "It's higher than that, guess again:"
          read USER_GUESS
          (( NUMBER_OF_GUESSES++ ))

        else
          echo "It's lower than that, guess again:"
          read USER_GUESS
          (( NUMBER_OF_GUESSES++ ))
      fi
  fi
}
GET_NUMBER
# loop until correct guess
until [[ $USER_GUESS == $SECRET_NUMBER ]]
do
  GET_NUMBER again
done  

# correct guess
(( NUMBER_OF_GUESSES++ ))

# Insert result into database
USER_ID_RESULT=$($PSQL "SELECT user_id FROM user_info WHERE username='$USERNAME';")
INSERT_GAME_RESULT=$($PSQL "INSERT INTO game_info(user_id, secret_number, number_of_guesses) VALUES($USER_ID_RESULT, $SECRET_NUMBER, $NUMBER_OF_GUESSES);")

echo You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job\!
