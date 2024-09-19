#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"


# Function to output element information
get_element_info() {
   
  if [[ -z $ATOMIC_NUMBER ]]; then
    echo "I could not find that element in the database."
  else
    ELEMENT_INFO=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = '$ATOMIC_NUMBER';")

  echo  "$ELEMENT_INFO" | while IFS="|" read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT 
  do
  #echo $ATOMIC_NUMBER, $NAME, $SYMBOL
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  done
fi
}

if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
elif [[ $1 =~ ^[0-9]+$ ]]; then
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1 ")
  get_element_info "$1"
else
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1' OR name='$1';")
  get_element_info "$1"
fi
