class NumberToWords {
  static const List<String> units = [
    '',
    'One',
    'Two',
    'Three',
    'Four',
    'Five',
    'Six',
    'Seven',
    'Eight',
    'Nine',
    'Ten'
  ];

  static const List<String> teens = [
    'Eleven',
    'Twelve',
    'Thirteen',
    'Fourteen',
    'Fifteen',
    'Sixteen',
    'Seventeen',
    'Eighteen',
    'Nineteen'
  ];

  static const List<String> tens = [
    '',
    '',
    'Twenty',
    'Thirty',
    'Forty',
    'Fifty',
    'Sixty',
    'Seventy',
    'Eighty',
    'Ninety'
  ];

  static String convert(int number) {
    if (number == 0) {
      return 'Zero';
    }
    return _convertToWordsRecursive(number);
  }

  static String _convertToWordsRecursive(int number) {
    if (number <= 10) {
      return units[number];
    } else if (number < 20) {
      return teens[number - 11];
    } else if (number < 100) {
      return tens[number ~/ 10] +
          (number % 10 != 0 ? ' ${units[number % 10]}' : '');
    } else if (number < 1000) {
      return "${units[number ~/ 100]} Hundred${number % 100 != 0 ? " and ${_convertToWordsRecursive(number % 100)}" : ""}";
    } else if (number < 100000) {
      return "${_convertToWordsRecursive(number ~/ 1000)} Thousand${number % 1000 != 0 ? " ${_convertToWordsRecursive(number % 1000)}" : ""}";
    } else if (number < 10000000) {
      return "${_convertToWordsRecursive(number ~/ 100000)} Lakh${number % 100000 != 0 ? " ${_convertToWordsRecursive(number % 100000)}" : ""}";
    } else {
      return "${_convertToWordsRecursive(number ~/ 10000000)} Crore${number % 10000000 != 0 ? " ${_convertToWordsRecursive(number % 10000000)}" : ""}";
    }
  }
}
