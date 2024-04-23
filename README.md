# TextPairFinder

Консольное приложение, ищущее в текстовом файле пару заданных слов
на определённом расстоянии друг от друга.

## Стек технологий

![C++](https://img.shields.io/badge/c++-%2300599C.svg?style=for-the-badge&logo=c%2B%2B&logoColor=white) ![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)

## Структура проекта

```tree
.
├── Makefile
├── features
│   ├── everything.feature
│   └── steps
│       └── first_test.py
├── requirements.txt
└── search_pair.cpp
```

## Использование
1. Склонировать репозиторий
    ```bash
    https://github.com/1vokahsu/TextPairFinder.git
    ```
3. Перейдите в директорию `/TextPairFinder` и выполните команду `make`
    ```bash
    cd /TextPairFinder
    make
    ```
2. Вывод должен быть таким
    ```bash
    rm -rf ./*.o ./search_pair ./*.out ./tests/ ./venv
    g++ -Wall -Werror -Wextra -std=c++11 search_pair.cpp -o search_pair
    python3 -m venv venv
    . ./venv/bin/activate
    pip install -r requirements.txt
    Collecting behave==1.2.6 (from -r requirements.txt (line 1))
    Using cached behave-1.2.6-py2.py3-none-any.whl.metadata (6.4 kB)
    Collecting parse==1.20.1 (from -r requirements.txt (line 2))
    Using cached parse-1.20.1-py2.py3-none-any.whl.metadata (22 kB)
    Collecting parse-type==0.6.2 (from -r requirements.txt (line 3))
    Using cached parse_type-0.6.2-py2.py3-none-any.whl.metadata (12 kB)
    Collecting six==1.16.0 (from -r requirements.txt (line 4))
    Using cached six-1.16.0-py2.py3-none-any.whl.metadata (1.8 kB)
    Using cached behave-1.2.6-py2.py3-none-any.whl (136 kB)
    Using cached parse-1.20.1-py2.py3-none-any.whl (20 kB)
    Using cached parse_type-0.6.2-py2.py3-none-any.whl (26 kB)
    Using cached six-1.16.0-py2.py3-none-any.whl (11 kB)
    Installing collected packages: parse, six, parse-type, behave
    Successfully installed behave-1.2.6 parse-1.20.1 parse-type-0.6.2 six-1.16.0
    mkdir tests
    behave -i everything.feature
    Feature: поиск пары слов на определённом расстоянии в файле # features/everything.feature:1

    Scenario: поиск пары слов на точном расстоянии                          # features/everything.feature:3
        Given подготовили тестовый файл "Налоговый_кодекс.txt"                # features/steps/fisrt_test.py:5
        When ищем пару слов "налоги" "России" на расстоянии, не превышающем 5 # features/steps/fisrt_test.py:34
        Then находим 1 такую пару в тестовом файле                            # features/steps/fisrt_test.py:40

    Scenario: поиск пары слов на большом расстоянии                           # features/everything.feature:8
        Given подготовили тестовый файл "Налоговый_кодекс.txt"                  # features/steps/fisrt_test.py:5
        When ищем пару слов "налоги" "России" на расстоянии, не превышающем 100 # features/steps/fisrt_test.py:34
        Then находим 1 такую пару в тестовом файле                              # features/steps/fisrt_test.py:40

    Scenario: поиск пары слов на нулевом расстоянии                     # features/everything.feature:13
        Given подготовили тестовый файл "Налоговый_кодекс.txt"            # features/steps/fisrt_test.py:5
        When ищем пару слов "налоги" "на" на расстоянии, не превышающем 0 # features/steps/fisrt_test.py:34
        Then находим 2 такие пары в тестовом файле                        # features/steps/fisrt_test.py:40

    Scenario: поиск пары слов на расстоянии равном меньше нужного           # features/everything.feature:18
        Given подготовили тестовый файл "Налоговый_кодекс.txt"                # features/steps/fisrt_test.py:5
        When ищем пару слов "налоги" "доходы" на расстоянии, не превышающем 0 # features/steps/fisrt_test.py:34
        Then находим 0 таких пар в тестовом файле                             # features/steps/fisrt_test.py:40

    Scenario: поиск пары слов, когда слова отсутствуют в файле                # features/everything.feature:23
        Given подготовили тестовый файл "Налоговый_кодекс.txt"                  # features/steps/fisrt_test.py:5
        When ищем пару слов "налоги" "Белоруси" на расстоянии, не превышающем 2 # features/steps/fisrt_test.py:34
        Then находим 0 таких пар в тестовом файле                               # features/steps/fisrt_test.py:40

    Scenario: ошибка во входных параметрах                                     # features/everything.feature:28
        Given подготовили тестовый файл "Налоговый_кодекс.txt"                   # features/steps/fisrt_test.py:5
        When запускаем приложение search_pairs с недостаточным числом аргументов # features/steps/fisrt_test.py:11
        Then получаем сообщение об ошибке                                        # features/steps/fisrt_test.py:29

    Scenario: поиск пары слов на расстоянии равном меньше допустимого         # features/everything.feature:33
        Given подготовили тестовый файл "Налоговый_кодекс.txt"                  # features/steps/fisrt_test.py:5
        When запускаем приложение search_pairs с расстоянием меньше допустимого # features/steps/fisrt_test.py:17
        Then получаем сообщение об ошибке                                       # features/steps/fisrt_test.py:29

    Scenario: поиск пары слов в несуществующем файле                 # features/everything.feature:38
        Given подготовили тестовый файл "Налоговый_кодекс.txt"         # features/steps/fisrt_test.py:5
        When запускаем приложение search_pairs c несуществующем файлом # features/steps/fisrt_test.py:23
        Then получаем сообщение об ошибке                              # features/steps/fisrt_test.py:29

    1 feature passed, 0 failed, 0 skipped
    8 scenarios passed, 0 failed, 0 skipped
    24 steps passed, 0 failed, 0 skipped, 0 undefined
    Took 0m0.092s
    ```
- Команда `make clean` удалит созданные файлы и директории
    ```bash
    rm -rf ./*.o ./search_pair ./*.out ./tests/ ./venv
    ```
- Команда `make search_pair` скомпилирует консольное приложение
    ```bash
    g++ -Wall -Werror -Wextra -std=c++11 search_pair.cpp -o search_pair
    ```
- Команда `make test` запустит тесты
    - Настройка виртуального окружения
    ```bash
    python3 -m venv venv
    . ./venv/bin/activate
    ```
    - Установка зависимостей
    ```bash
    pip install -r requirements.txt
    ```
    ```bash
    Collecting behave==1.2.6 (from -r requirements.txt (line 1))
    Using cached behave-1.2.6-py2.py3-none-any.whl.metadata (6.4 kB)
    Collecting parse==1.20.1 (from -r requirements.txt (line 2))
    Using cached parse-1.20.1-py2.py3-none-any.whl.metadata (22 kB)
    Collecting parse-type==0.6.2 (from -r requirements.txt (line 3))
    Using cached parse_type-0.6.2-py2.py3-none-any.whl.metadata (12 kB)
    Collecting six==1.16.0 (from -r requirements.txt (line 4))
    Using cached six-1.16.0-py2.py3-none-any.whl.metadata (1.8 kB)
    Using cached behave-1.2.6-py2.py3-none-any.whl (136 kB)
    Using cached parse-1.20.1-py2.py3-none-any.whl (20 kB)
    Using cached parse_type-0.6.2-py2.py3-none-any.whl (26 kB)
    Using cached six-1.16.0-py2.py3-none-any.whl (11 kB)
    Installing collected packages: parse, six, parse-type, behave
    Successfully installed behave-1.2.6 parse-1.20.1 parse-type-0.6.2 six-1.16.0
    ```
    - Запуск тестов
    ```bash
    behave -i everything.feature
    ```
    ```bash
    Feature: поиск пары слов на определённом расстоянии в файле # features/everything.feature:1

    Scenario: поиск пары слов на точном расстоянии                          # features/everything.feature:3
        Given подготовили тестовый файл "Налоговый_кодекс.txt"                # features/steps/fisrt_test.py:5
        When ищем пару слов "налоги" "России" на расстоянии, не превышающем 5 # features/steps/fisrt_test.py:34
        Then находим 1 такую пару в тестовом файле                            # features/steps/fisrt_test.py:40

    Scenario: поиск пары слов на большом расстоянии                           # features/everything.feature:8
        Given подготовили тестовый файл "Налоговый_кодекс.txt"                  # features/steps/fisrt_test.py:5
        When ищем пару слов "налоги" "России" на расстоянии, не превышающем 100 # features/steps/fisrt_test.py:34
        Then находим 1 такую пару в тестовом файле                              # features/steps/fisrt_test.py:40

    Scenario: поиск пары слов на нулевом расстоянии                     # features/everything.feature:13
        Given подготовили тестовый файл "Налоговый_кодекс.txt"            # features/steps/fisrt_test.py:5
        When ищем пару слов "налоги" "на" на расстоянии, не превышающем 0 # features/steps/fisrt_test.py:34
        Then находим 2 такие пары в тестовом файле                        # features/steps/fisrt_test.py:40

    Scenario: поиск пары слов на расстоянии равном меньше нужного           # features/everything.feature:18
        Given подготовили тестовый файл "Налоговый_кодекс.txt"                # features/steps/fisrt_test.py:5
        When ищем пару слов "налоги" "доходы" на расстоянии, не превышающем 0 # features/steps/fisrt_test.py:34
        Then находим 0 таких пар в тестовом файле                             # features/steps/fisrt_test.py:40

    Scenario: поиск пары слов, когда слова отсутствуют в файле                # features/everything.feature:23
        Given подготовили тестовый файл "Налоговый_кодекс.txt"                  # features/steps/fisrt_test.py:5
        When ищем пару слов "налоги" "Белоруси" на расстоянии, не превышающем 2 # features/steps/fisrt_test.py:34
        Then находим 0 таких пар в тестовом файле                               # features/steps/fisrt_test.py:40

    Scenario: ошибка во входных параметрах                                     # features/everything.feature:28
        Given подготовили тестовый файл "Налоговый_кодекс.txt"                   # features/steps/fisrt_test.py:5
        When запускаем приложение search_pairs с недостаточным числом аргументов # features/steps/fisrt_test.py:11
        Then получаем сообщение об ошибке                                        # features/steps/fisrt_test.py:29

    Scenario: поиск пары слов на расстоянии равном меньше допустимого         # features/everything.feature:33
        Given подготовили тестовый файл "Налоговый_кодекс.txt"                  # features/steps/fisrt_test.py:5
        When запускаем приложение search_pairs с расстоянием меньше допустимого # features/steps/fisrt_test.py:17
        Then получаем сообщение об ошибке                                       # features/steps/fisrt_test.py:29

    Scenario: поиск пары слов в несуществующем файле                 # features/everything.feature:38
        Given подготовили тестовый файл "Налоговый_кодекс.txt"         # features/steps/fisrt_test.py:5
        When запускаем приложение search_pairs c несуществующем файлом # features/steps/fisrt_test.py:23
        Then получаем сообщение об ошибке                              # features/steps/fisrt_test.py:29

    1 feature passed, 0 failed, 0 skipped
    8 scenarios passed, 0 failed, 0 skipped
    24 steps passed, 0 failed, 0 skipped, 0 undefined
    Took 0m0.092s
    ```
    - Команда  исправит и проверит стиль кода в файле `search_pair.cpp`
    ```bash
    clang-format -i search_pair.cpp
	clang-format -n search_pair.cpp
    ```


## Участники проекта
[![GitHub](https://img.shields.io/badge/-galyeonh-333?style=for-the-badge&logo=GitHub&logoColor=fff)](https://github.com/1vokahsu)