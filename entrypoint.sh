#!/bin/sh -l
set -eu

if [[ -z "$INPUT_TYPE" ]]
then
  echo "Required Args parameter !"
  exit 1
fi

echo $INPUT_SCRIPTS
echo $INPUT_INCLUDE
echo $INPUT_EXCLUDE

LOCAL_PATH="$GITHUB_WORKSPACE/$INPUT_LOCAL_PATH"
REMOTE_PATH="$INPUT_REMOTE_PATH" 

INCLUDE=""
for i in ${INPUT_INCLUDE[@]}
do
  INCLUDE="${INCLUDE}--include ${i} "
done

EXCLUDE=""
for i in ${INPUT_EXCLUDE[@]}
do
  EXCLUDE="${EXCLUDE}--include ${i} "
done

if [[ $INPUT_TYPE == "key" ]]
then
  SSHPATH="$HOME/.ssh"
  mkdir -p $SSHPATH
  chmod 
  echo "$INPUT_KEY" > "$SSHPATH/id_rsa.pem"
  chmod 600 "$SSHPATH/id_rsa.pem"
  sh -c "rsync $INPUT_ARGS -e 'ssh -i $path/id_rsa.pem -p $INPUT_PORT $INPUT_SSH_ARGS -l $INPUT_USERNAME' $INCLUDE $EXCLUDE $LOCAL_PATH $INPUT_USERNAME@$INPUT_HOST:$REMOTE_PATH"

  if [[ -z $INPUT_SCRIPTS ]]
  then
    sh -c "ssh -i $path/id_rsa.pem -p $INPUT_PORT $INPUT_SSH_ARGS -l $INPUT_USERNAME bash -s < $INPUT_SCRIPTS"
  if
elif [[ $INPUT_TYPE == "password" ]]
then
  export SSHPASS=$INPUT_PASSWORD
  sh -c "rsync $INPUT_ARGS -e 'sshpass -e ssh -p $INPUT_PORT $INPUT_SSH_ARGS -l $INPUT_USERNAME' $INCLUDE $EXCLUDE $LOCAL_PATH $INPUT_USERNAME@$INPUT_HOST:$REMOTE_PATH"

  if [[ -z $INPUT_SCRIPTS ]]
  then
    sh -c "sshpass -e ssh -p $INPUT_PORT $INPUT_SSH_ARGS -l $INPUT_USERNAME bash -s < $INPUT_SCRIPTS"
  if
else
  echo "Parameter error !"
  exit 1
fi
