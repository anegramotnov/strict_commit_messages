#!/bin/bash

# Для .git/hooks/commit-msg

COMMIT_MSG_FILE=$1

if [[ ! `cat $COMMIT_MSG_FILE` =~ ^(\[[A-Z]{2,3}\-[0-9]{4,5}\].+|Merge.*)$ ]]; then
        echo "Сообщение коммита не соответствует формату [LB-<issue_number>] <commit_msg>.
Для обхода проверки запустите git commit с флагом --no-verify (это, также, отключит добавление миграций при коммите)."
        exit 1
fi
