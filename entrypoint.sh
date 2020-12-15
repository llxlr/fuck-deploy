#!/bin/sh -l
set -eu

if [ -z "$INPUT_TYPE" ]; then
  echo 'Required Args parameter'
  exit 1
fi

deploy_args="$INPUT_USERNAME@$INPUT_HOST:$INPUT_REMOTE_PATH" 
include=(${INPUT_INCLUDE//,/})
for var in ${include[@]}
do
  echo $var >> include.txt
done
exclude=(${INPUT_EXCLUDE//,/})
for var in ${exclude[@]}
do
  echo $var >> exclude.txt
done

if [[ $INPUT_TYPE == "private_key" ]]
then
  path="$HOME/.ssh"
  mkdir -p "$path"
  echo "$INPUT_PRIVATE_KEY" > "$path/id_rsa"
  chmod 600 "$path/id_rsa"
  sh -c "rsync -ratlz --rsh='ssh -i $path/id_rsa -p $INPUT_PORT $INPUT_ARGS -l $INPUT_USERNAME' $GITHUB_WORKSPACE/$INPUT_LOCAL_PATH $deploy_args"
elif [[ $INPUT_TYPE == "password" ]]
then
  export SSHPASS=$INPUT_PASSWORD
  sh -c "rsync -ratlz --rsh='sshpass -e ssh -p $INPUT_PORT $INPUT_ARGS -l $INPUT_USERNAME' $GITHUB_WORKSPACE/$INPUT_LOCAL_PATH $deploy_args"
fi
