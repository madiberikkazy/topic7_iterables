import 'dart:ffi';

void main() {
  //1
  // const numbers = [1, 2, 3, 4];
  // final squares = numbers.map((n) => n);
  // print(squares);

  //2
  // const numbers = [1, 2, 3, 4];
  // if (numbers.isEmpty) {
  //   print("The list is empty.");
  // } else {
  //   final maxNumber = numbers.reduce((a, b) => a > b ? a : b);
  //   final minNumber = numbers.reduce((a, b) => a < b ? a : b);
  //   print("Numbers: $numbers");
  //   print("Maximum number: $maxNumber");
  //   print("Minimum number: $minNumber");
  // }

  //3
  // Iterable<int> numberSequence(int start, int end, int step) sync* {
  //   for (int i = start; i <= end; i += step) {
  //     yield i;
  //   }
  // }

  // final startValue = 1;
  // final endValue = 10;
  // final stepValue = 1;
  // final iterable = numberSequence(startValue, endValue, stepValue);
  // for (final number in iterable) {
  //   print(number);
  // }

  //4
  // Iterable<int> dropPositive(Iterable<int> input) sync* {
  //   for (final element in input) {
  //     if (element <= 0) {
  //       yield element;
  //     } else {
  //       break;
  //     }
  //   }
  // }

  // final inputList = [0, -2, -3, 1, -5, 4, -6];

  // final result = dropPositive(inputList);

  // print("Input List: $inputList");
  // print("Filtered List: ${result.toList()}");

//5
  // Iterable<List<T>> permutations<T>(List<T> elements, int length) sync* {
  //   if (length == 0) {
  //     yield [];
  //   } else {
  //     for (int i = 0; i < elements.length; i++) {
  //       final element = elements[i];
  //       final rest = List<T>.from(elements)..removeAt(i);
  //       final subPermutations = permutations(rest, length - 1);
  //       for (final subPermutation in subPermutations) {
  //         yield [element, ...subPermutation];
  //       }
  //     }
  //   }
  // }

  // final elements = [1, 2, 3];
  // final length = 2;

  // final iterator = permutations(elements, length).iterator;

  // while (iterator.moveNext()) {
  //   print(iterator.current);
  // }

  //6
  // String compressString(String input) {
  //   if (input.isEmpty) {
  //     return input;
  //   }

  //   final List<String> compressed = [];
  //   int count = 1;

  //   for (int i = 1; i < input.length; i++) {
  //     if (input[i] == input[i - 1]) {
  //       count++;
  //     } else {
  //       compressed.add("${input[i - 1]}$count");
  //       count = 1;
  //     }
  //   }
  //   compressed.add("${input[input.length - 1]}$count");
  //   return compressed.join();
  // }

  // final inputString = "Tommmaoodcs";
  // final compressedString = compressString(inputString);

  // print("Original String: $inputString");
  // print("Compressed String: $compressedString");

  //8
  // for (int year = 2000; year <= 2150; year++) {
  //   final DateTime date = DateTime(year, 12, 25);
  //   if (date.weekday == DateTime.sunday) {
  //     print("December 25, $year is a Sunday.");
  //   }
  // }

   print("Enter 4 digits (0-9): ");
  String input = stdin.readLineSync() ?? "";
  
  if (input.length != 4 || !input.contains(RegExp(r'^\d{4}$'))) {
    print("Invalid input. Please enter exactly 4 digits.");
    return;
  }

  List<int> digits = input.split("").map(int.parse).toList();
  digits.sort((a, b) => b - a); // Sort digits in descending order

  int hours = -1;
  int minutes = -1;

  // Try to find a valid time
  for (int i = 0; i < 24; i++) {
    for (int j = 0; j < 60; j++) {
      if (isValidTime(i, j, digits)) {
        hours = i;
        minutes = j;
        break;
      }
    }
    if (hours != -1) {
      break;
    }
  }

  if (hours != -1) {
    String formattedHours = hours.toString().padLeft(2, '0');
    String formattedMinutes = minutes.toString().padLeft(2, '0');
    print("The latest time is: $formattedHours:$formattedMinutes");
  } else {
    print("No valid time could be generated.");
  }
}

bool isValidTime(int hours, int minutes, List<int> digits) {
  List<int> timeDigits = [
    hours ~/ 10, hours % 10,
    minutes ~/ 10, minutes % 10
  ];
  
  for (int digit in timeDigits) {
    if (!digits.contains(digit)) {
      return false;
    }
    digits.remove(digit);
  }
  
  return true;
}
