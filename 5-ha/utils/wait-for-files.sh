#!/bin/sh

# This is easier to script in bash, but not all Docker images have
# the bash shell installed. So using sh instead.

CMD_NAME=$(basename $0)

FILES=""
for var in "$@"
do
  FILES="${FILES} $var"
done

echo "${CMD_NAME}: Waiting for ${FILES}"
while true
do

  for file in ${FILES}
  do

    if [ -f $file ]
    then
      echo "${CMD_NAME}: Found $file"
      # Remove the found file from the list
      safe_pattern=$(printf '%s' "$file" | sed 's/[[\.*^$/]/\\&/g')
      FILES=`echo ${FILES} | sed -E "s/${safe_pattern}//"`
    fi

  done

  # Check if the list is empty
  if [ "x${FILES}" = "x" ]
  then
    echo "${CMD_NAME}: All files found, moving on."
    exit 0
  fi

  sleep 1

done
