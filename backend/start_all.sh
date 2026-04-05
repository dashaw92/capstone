#!/bin/sh

trap handle_ctrlc INT

handle_ctrlc () {
  echo -e "\nCaught ^C, stopping database."
  ./kill_db.sh
  exit 0
}

./start_db_container.sh
dart run
handle_ctrlc
