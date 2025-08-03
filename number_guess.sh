#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER=$((RANDOM % 1000 + 1))

echo $RANDOM_NUMBER

echo -e "\nEnter your username:"

read USERNAME_ENTERED

# check if the username is on the database
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME_ENTERED'" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

if [[ -z $USER_ID ]]
then 
  echo "Welcome, $USERNAME_ENTERED! It looks like this is your first time here."

  # insert the new user 
  INSERT_NEW_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME_ENTERED')")

  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME_ENTERED'")
else 
# user is in the database 
# grab the data for that user

NUMBER_OF_GAMES=$($PSQL "SELECT COUNT(guesses) FROM games WHERE user_id=$USER_ID GROUP BY user_id")
BEST_GAME_GUESSES=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id=$USER_ID GROUP BY user_id")

echo "Welcome back, $USERNAME_ENTERED! You have played $NUMBER_OF_GAMES games, and your best game took $BEST_GAME_GUESSES guesses."

fi

# generate random number between 1 and 1000
# SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
SECRET_NUMBER=500

# variable to store number of guesses/tries
GUESS_COUNT=0

echo -e "\nGuess the secret number between 1 and 1000:"

read USER_GUESS

# loop to prompt user to guess until correct
until [[ $USER_GUESS == $SECRET_NUMBER ]]
do
  
  # check guess is valid/an integer
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
    then
      # request valid guess
      echo -e "\nThat is not an integer, guess again:"
      read USER_GUESS
      # update guess count
      ((GUESS_COUNT++))
    
    # if its a valid guess
    else
      # check inequalities and give hint
      if [[ $USER_GUESS < $SECRET_NUMBER ]]
        then
          echo "It's higher than that, guess again:"
          read USER_GUESS
          # update guess count
          ((GUESS_COUNT++))
        else 
          echo "It's lower than that, guess again:"
          read USER_GUESS
          #update guess count
          ((GUESS_COUNT++))
      fi  
  fi

done

((GUESS_COUNT++))

echo You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job\!


# insert the game to the table

INSER_GAME_RESULT=$($PSQL "INSERT INTO games(guesses, user_id) VALUES($GUESS_COUNT, $USER_ID)")
