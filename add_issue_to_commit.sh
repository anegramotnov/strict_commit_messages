#!/bin/bash

# Для .git/hooks/prepare-commit-msg

COMMIT_MSG_FILE=$1
COMMIT_SOURCE=$2
SHA1=$3

BRANCH_NAME=`git symbolic-ref --short HEAD`

ECHO_ISSUE_ID(){
        echo `echo $BRANCH_NAME | sed -E -n 's/[a-z]+\/([0-9]{3,5})[a-z0-9_]*/\1/p'`
        #                                              ^^^^^^^^^^^^
        #                                                 issue_d
}

if [[ -z "$COMMIT_SOURCE" && ! $BRANCH_NAME =~ ^(release.+|cherry-pick.+)$ ]]; then
        #                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        #                    |             ignore branches              |
        PREV_COMMIT_MSG=`cat $COMMIT_MSG_FILE`
        echo "#[LB-`ECHO_ISSUE_ID`]

        $PREV_COMMIT_MSG" > $COMMIT_MSG_FILE
elif [[ $COMMIT_SOURCE = 'message' && ! $BRANCH_NAME =~ ^(release.+|cherry-pick.+)$ ]]; then
        echo "[LB-`ECHO_ISSUE_ID`] `cat $COMMIT_MSG_FILE`" > $COMMIT_MSG_FILE
fi
