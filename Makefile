all: clean search_pair test

search_pair:
	g++ -Wall -Werror -Wextra -std=c++11 search_pair.cpp -o search_pair

clean:
	rm -rf ./*.o ./search_pair ./*.out ./tests/ ./venv

test:
	python3 -m venv venv
	. ./venv/bin/activate
	pip install -r requirements.txt
	mkdir tests
	behave -i everything.feature

clang:
	clang-format -i search_pair.cpp
	clang-format -n search_pair.cpp