///3.Реализуйте метод, который принимает строку слов, разделённых пробелами.
///Задача — найти в данной строке числа и вернуть коллекцию num этих чисел.
/// 4.Есть коллекция слов. Реализуйте метод, возвращающий Map.
/// Данный Map должен соотносить слово и количество его вхождений в данную коллекцию.
/// 5. Есть коллекция строк вида ‘one, two, three, cat, dog’ или любого другого.
/// Реализуйте метод, возвращающий цифры без повторений, которые встречаются в данной строке.
/// Однако цифры встречаются в виде английских слов от zero до nine.
/// Например, в результате строки ‘one, two, zero, zero’ мы получим следующий результат: [1, 2, 0].
/// Если в строке есть слова, не являющиеся цифрами от 0 до 9, пропускайте их.
class SearchNumbers {
  ///Найти в данной строке числа и вернуть коллекцию num этих чисел
  List<int> findNumber(String text) {
    List<int> result = [];
    List<String> textList = text.split(' ');
    textList.forEach((element) {
      int? number = int.tryParse(element);
      if (number != null) {
        result.add(number);
      }
    });
    return result;
  }

  ///Метод, возвращающий Map. Данный Map должен соотносить слово и количество его вхождений в данную коллекцию.
  Map<String, int> findCountWord(List<String> textList) {
    Map<String, int> result = {};

    textList.forEach((element) {
      if (result.containsKey(element)) {
        result[element] = result[element]! + 1;
      } else {
        result.addAll({element: 1});
      }
    });
    return result;
  }

  ///Метод, возвращающий цифры без повторений, которые встречаются в данной строке.
  Set<int> findWordNumber(String text) {
    Set<int> result = {};
    List<String> textList = text.split(', ');
    const Map<String, int> numbers = {
      'one': 1,
      'two': 2,
      'three': 3,
      'four': 4,
      'five': 5,
      'six': 6,
      'seven': 7,
      'eight': 8,
      'nine': 9,
      'zero': 0
    };
    textList.forEach((element) {
      if (numbers.containsKey(element)) {
        result.add(numbers[element]!);
      }
    });
    return result;
  }
}
