#!/bin/sh -l
set -eu

#echo "type: $INPUT_TYPE"
#echo "username: $INPUT_USERNAME"
#echo "host: $INPUT_HOST"
#echo "port: $INPUT_PORT"
#echo "password: $INPUT_PASSWORD"
#echo "private_key: $INPUT_PRIVATE_KEY"
#echo "remote_path: $INPUT_REMOTE_PATH"
#echo "local_path: $INPUT_LOCAL_PATH"
#echo "include: $INPUT_INCLUDE"
#echo "exclude: $INPUT_EXCLUDE"
#echo "args: $INPUT_ARGS"

if [ -z "$INPUT_TYPE" ]; then
  echo 'Required Args parameter'
  exit 1
fi

deploy_args="$INPUT_USERNAME@$INPUT_HOST:$INPUT_REMOTE_PATH"

if [[ $INPUT_TYPE == "private_key" ]]
then
  path="$HOME/.ssh"
  mkdir -p "$path"
  echo "$INPUT_PRIVATE_KEY" > "$path/id_rsa"
  chmod 600 "$path/id_rsa"
  sh -c "rsync -ratlz $INPUT_ARGS --rsh='ssh -i $path/id_rsa -p $INPUT_PORT -o StrictHostKeyChecking=no -l $INPUT_USERNAME' $GITHUB_WORKSPACE/$INPUT_LOCAL_PATH $deploy_args"
elif [[ $INPUT_TYPE == "password" ]]
then
  export SSHPASS=$INPUT_PASSWORD
  sh -c "rsync -ratlz $INPUT_ARGS --rsh='sshpass -e ssh -p $INPUT_PORT -o StrictHostKeyChecking=no -l $INPUT_USERNAME' $GITHUB_WORKSPACE/$INPUT_LOCAL_PATH $deploy_args"
fi
