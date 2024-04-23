#include <algorithm>
#include <fstream>
#include <iostream>
#include <sstream>
#include <string>
#include <vector>

using namespace std;

// Функция для разделения строки на слова
vector<string> split(const string &str) {
  vector<string> words;
  istringstream iss(str);
  string word;
  while (iss >> word) {
    // Удаляем знаки препинания
    word.erase(remove_if(word.begin(), word.end(), ::ispunct), word.end());
    words.push_back(word);
  }
  return words;
}

// Функция для подсчета количества встречающихся уникальных пар слов
int countWordPairs(const string &filename, const string &word1,
                   const string &word2, int maxDistance) {
  ifstream file(filename);
  if (!file.is_open()) {
    cerr << "Unable to open file " << filename << endl;
    return -1;
  }

  string line;
  int pairCount = 0;

  while (getline(file, line)) {
    vector<string> words = split(line);

    // Ищем все вхождения обоих слов
    vector<size_t> indices_word1, indices_word2;
    for (size_t i = 0; i < words.size(); ++i) {
      if (words[i] == word1) indices_word1.push_back(i);
      if (words[i] == word2) indices_word2.push_back(i);
    }

    // Проверяем все комбинации расстояний между вхождениями
    for (size_t i : indices_word1) {
      int check_use = 1;
      for (size_t j : indices_word2) {
        if (check_use) {
          int dist = abs(int(i) - int(j)) - 1;
          if ((dist <= maxDistance) and (i <= j)) {
            check_use = 0;
            pairCount++;
          }
        }
      }
    }
  }

  file.close();
  return pairCount;
}

int main(int argc, const char *argv[]) {
  if (argc != 5) {
    cerr << "Usage: " << argv[0] << " <filename> <word1> <word2> <maxDistance>"
         << endl;
    return 1;
  }

  string filename = argv[1];
  string word1 = argv[2];
  string word2 = argv[3];
  int maxDistance = stoi(argv[4]);

  if (maxDistance < 0) {
    cerr << "Usage: " << argv[0] << " maxDistance must be greater than 0"
         << endl;
    return 1;
  }

  int pairCount = countWordPairs(filename, word1, word2, maxDistance);

  if (pairCount == -1) {
    return 1;
  }

  cout << pairCount << endl;

  return 0;
}