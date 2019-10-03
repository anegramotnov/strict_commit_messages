# Набор хуков для стандартизации сообщений коммитов и веток

TODO: настройка

### `pre-commit`

* `check_branch_name.sh`

    Скрипт проверки именования ветки по формату `[feature|hotfix]/<issue_number>_short_description`.
    Например, `feature/1234_new_billing`

### `prepare-commit-msg`
* `add_issue_to_commit.sh`
    Тест
    Скрипт добавляет в сообщение коммита закомментированный номер задачи в YT по
    шаблону [LB-<issue_number>] в интерактивном режиме (git commit в терминале),
    либо самостоятельно вставляет `[LB-<issue_number>]` перед сообщением коммита
    (`git commit -m "<commit_msg>"` или в диалоге создания коммита через PyCharm)

### `commit-msg`
* `check_commit_message.sh`

    Скрипт проверяет сообщение коммита на соответствие шаблону [LB-<issue_number>] <commit_message>

### `gitlab_push_rules`

Регулярные выражения для проверки веток и сообщений коммитов при push'е в репозиторий. Добавляются в соответствующие\
разделы настроек проекта в GitLab.
