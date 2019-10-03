#!/bin/bash

# Для .git/hooks/pre-commit

BRANCH_NAME=`git symbolic-ref --short HEAD`

if [[ ! $BRANCH_NAME =~ ^((feature|hotfix)\/[0-9]{4,5}(_[a-z0-9_]{4,40})?|release.+|cherry-pick.+|develop)$ ]]; then
        #                ^^^^^^^^^^^^^^^^^  ^^^^^^^^^^ ^^^^^^^^^^^^^^^^   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        #                | branch_prefix |  | issue  | |    descr     |   |     ignored branches        |
        echo "Ветка $BRANCH_NAME не соответствует шаблону [feature|hotfix]/<issue_number>_short_description.
Для обхода проверки запустите git commit с флагом --no-verify (это, также, отключит добавление миграций при коммите)."
        exit 1
fi

