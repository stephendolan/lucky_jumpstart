#!/bin/sh

EXIT_STATUS=0

RED='\033[0;31m'
GREEN='\033[0;32m'
NO_COLOR='\033[0m'

function run_crystal_format_check {
  local OUTPUT
  local EXIT_CODE

  OUTPUT=$(crystal tool format --check 2>&1)
  EXIT_CODE=$?

  if [ $EXIT_CODE -eq 0 ]
  then
    echo "${GREEN}Crystal format check succeeded.${NO_COLOR}"
  else
    echo "${RED}Crystal format check failed.${NO_COLOR}"
    echo "$OUTPUT"
    EXIT_STATUS=1
  fi
}

function verify_ameba_installation {
  if ! [[ -f bin/ameba ]]; then
    echo "${RED}Unable to find Ameba binary in \`bin/ameba\`.${NO_COLOR}"
    echo "Please ensure that Ameba is in your \`shards.yml\` file, run \`shards install\`, and verify that \`bin/ameba\` is created."
    echo "You can modify this check in \`.git/hooks/pre-commit\`."

    exit 1
  fi
}

function run_ameba_check {
  verify_ameba_installation

  local OUTPUT
  local EXIT_CODE

  OUTPUT=$(./bin/ameba --format flycheck)
  EXIT_CODE=$?

  if [ $EXIT_CODE -eq 0 ]
  then
    echo "${GREEN}Ameba check succeeded.${NO_COLOR}"
  else
    echo "${RED}Ameba check failed.${NO_COLOR}"
    echo "$OUTPUT\n"
    EXIT_STATUS=1
  fi
}

run_crystal_format_check && echo
run_ameba_check

exit $EXIT_STATUS
