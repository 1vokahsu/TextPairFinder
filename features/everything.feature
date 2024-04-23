Feature: поиск пары слов на определённом расстоянии в файле

    Scenario: поиск пары слов на точном расстоянии
        Given подготовили тестовый файл "Налоговый_кодекс.txt"
        When ищем пару слов "налоги" "России" на расстоянии, не превышающем 5
        Then находим 1 такую пару в тестовом файле

    Scenario: поиск пары слов на большом расстоянии
        Given подготовили тестовый файл "Налоговый_кодекс.txt"
        When ищем пару слов "налоги" "России" на расстоянии, не превышающем 100
        Then находим 1 такую пару в тестовом файле

    Scenario: поиск пары слов на нулевом расстоянии
        Given подготовили тестовый файл "Налоговый_кодекс.txt"
        When ищем пару слов "налоги" "на" на расстоянии, не превышающем 0
        Then находим 2 такие пары в тестовом файле

    Scenario: поиск пары слов на расстоянии равном меньше нужного
        Given подготовили тестовый файл "Налоговый_кодекс.txt"
        When ищем пару слов "налоги" "доходы" на расстоянии, не превышающем 0
        Then находим 0 таких пар в тестовом файле

    Scenario: поиск пары слов, когда слова отсутствуют в файле
        Given подготовили тестовый файл "Налоговый_кодекс.txt"
        When ищем пару слов "налоги" "Белоруси" на расстоянии, не превышающем 2
        Then находим 0 таких пар в тестовом файле

    Scenario: ошибка во входных параметрах
        Given подготовили тестовый файл "Налоговый_кодекс.txt"
        When запускаем приложение search_pairs с недостаточным числом аргументов
        Then получаем сообщение об ошибке

    Scenario: поиск пары слов на расстоянии равном меньше допустимого
        Given подготовили тестовый файл "Налоговый_кодекс.txt"
        When запускаем приложение search_pairs с расстоянием меньше допустимого
        Then получаем сообщение об ошибке

    Scenario: поиск пары слов в несуществующем файле
        Given подготовили тестовый файл "Налоговый_кодекс.txt"
        When запускаем приложение search_pairs c несуществующем файлом
        Then получаем сообщение об ошибке
