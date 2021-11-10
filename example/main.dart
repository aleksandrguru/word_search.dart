import 'package:word_search/word_search.dart';

/// The main file to test out the word search library
void main() {
  // ignore: avoid_print
  print('Библиотека поиска слов!');

  // Create a list of words to be jumbled into a puzzle
  final List<String> wl = [
    'привет',
    'буквы',
    'армавир',
    'квитанция',
    'голова',
    'дом'
  ];

  // Create the puzzle sessting object
  final WSSettings ws = WSSettings(
    width: 10,
    height: 10,
    orientations: List.from([
      WSOrientation.horizontal,
      WSOrientation.vertical,
      WSOrientation.diagonal,
    ]),
  );

  // Создайте новый экземпляр класса WordSearch
  final WordSearch wordSearch = WordSearch();

  // Создать новую головоломку
  final WSNewPuzzle newPuzzle = wordSearch.newPuzzle(wl, ws);

  /// Проверьте, нет ли ошибок при создании пазла
  if (newPuzzle.errors.isEmpty) {
    // The puzzle output
    // ignore: avoid_print
    print('Пазл 2D Список');
    // ignore: avoid_print
    print(newPuzzle.toString());

    // Решить головоломку для данного списка слов
    final WSSolved solved =
        wordSearch.solvePuzzle(newPuzzle.puzzle, ['буквы', 'дом', 'голова']);
    // Все найденные слова путем решения головоломки
    // ignore: avoid_print
    print('Найденные слова!');
    for (var element in solved.found) {
      // ignore: avoid_print
      print('слова: ${element.word}, орентация: ${element.orientation}');
      // ignore: avoid_print
      print('x:${element.x}, y:${element.y}');
    }

    // Все слова, которые не удалось найти
    // ignore: avoid_print
    print('Не найденые слова!');
    for (var element in solved.notFound) {
      // ignore: avoid_print, unnecessary_brace_in_string_interps
      print('слова: ${element}');
    }
  } else {
    // Сообщите пользователю об ошибках
    for (var error in newPuzzle.errors) {
      // ignore: avoid_print
      print(error);
    }
  }
}
