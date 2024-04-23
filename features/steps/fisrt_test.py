from behave import given, when, then
import subprocess


@given('подготовили тестовый файл "{filename}"')
def prepare_test_file(context, filename):
    with open(f"tests/{filename}", 'w') as file:
        file.write("налоги на доходы физических лиц в России, налоги на доходы физических лиц в Казахстане.")


@when('запускаем приложение search_pairs с недостаточным числом аргументов')
def run_count_pairs_with_insufficient_arguments(context):
    context.process = subprocess.Popen(
        ['./search_pair', 'insufficient_arguments'])


@when('запускаем приложение search_pairs с расстоянием меньше допустимого')
def run_count_pairs_with_less_distance(context):
    context.process = subprocess.Popen(
        ['./search_pair', 'tests/Налоговый_кодекс.txt', 'налоги', 'на', '-1'])


@when('запускаем приложение search_pairs c несуществующем файлом')
def run_count_pairs_with_less_distance(context):
    context.process = subprocess.Popen(
        ['./search_pair', 'Кодекс.txt', 'налоги', 'на', '0'])


@then('получаем сообщение об ошибке')
def receive_error_message(context):
    assert context.process.wait() == 1, "Ожидалось сообщение об ошибке"


@when('ищем пару слов "{word1}" "{word2}" на расстоянии, не превышающем {max_distance}')
def search_word_pair_within_distance(context, word1, word2, max_distance):
    cmd = f"./search_pair tests/Налоговый_кодекс.txt {word1} {word2} {max_distance} > tests/output.txt"
    subprocess.run(cmd, shell=True)


@then('находим {expected_count} такую пару в тестовом файле')
@then('находим {expected_count} таких пар в тестовом файле')
@then('находим {expected_count} такие пары в тестовом файле')
def find_expected_word_pair_count(context, expected_count):
    with open("tests/output.txt", "r") as file:
        actual_count = int(file.read().strip())
    assert actual_count == int(expected_count), f"Ожидалось {expected_count} пар, но найдено {actual_count} пар"
