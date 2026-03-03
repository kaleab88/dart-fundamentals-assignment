// Task 1:  Number Analysis App
// Name: Kaleab Bantayehu

final numbers = <int>[34, -7, 89, 12, -45, 67, 3, 100, -2, 55];

// Finds the largest number using loop
int? findMax(List<int> numbers) {
  if (numbers.isEmpty) {
    print('Error : The list of numbers is empty. Cannot find maximum value.');
    return null; //null safety
  }
  int runningMaximum = numbers[0];
  for (var i = 1; i < numbers.length; i++) {
    if (runningMaximum < numbers[i]) {
      runningMaximum = numbers[i];
    }
  }
  return runningMaximum;
}

// Finds the smallest  number using loop
int? findMin(List<int> numbers) {
  if (numbers.isEmpty) {
    print('Error : The list of numbers is empty. Cannot find minimum value.');
    return null; //null safety
  }
  int minNumber = numbers[0];
  for (var i = 1; i < numbers.length; i++) {
    if (minNumber > numbers[i]) {
      minNumber = numbers[i];
    }
  }
  return minNumber;
}

// calculates the total sum
int? calculateSum(List<int> numbers) {
  if (numbers.isEmpty) {
    print('Error : The list of numbers is empty. Cannot calculate sum.');
    return null;
  }
  int totalValue = 0;
  for (var i = 0; i < numbers.length; i++) {
    totalValue += numbers[i];
  }
  return totalValue;
}

// calculates the average
double? calculateAverage(List<int> numbers) {
  if (numbers.isEmpty) {
    print('Error : The list of numbers is empty. Cannot calculate average.');
    return null;
  }
  int? total = calculateSum(numbers);
  if (total == null) {
    return null;
  }
  return total / numbers.length;
}

int? countNegatives(List<int> numbers) {
  if (numbers.isEmpty) {
    print('Error :  The list of numbers is empty. Cannot count negatives.');
    return null;
  }
  int negativeNumber = 0;
  for (var i = 0; i < numbers.length; i++) {
    if (numbers[i] < 0) {
      negativeNumber++;
    }
  }
  return negativeNumber;
}

// implemented sorting  using bubble sort
List<int>? sortAscending(List<int> numbers) {
  if (numbers.isEmpty) {
    print('Error : The list of numbers is empty. Cannot sort numbers');
    return null;
  }
  for (var i = 0; i < numbers.length - 1; i++) {
    for (var j = 0; j < numbers.length - 1; j++) {
      if (numbers[j] > numbers[j + 1]) {
        int temp = numbers[j];
        numbers[j] = numbers[j + 1];
        numbers[j + 1] = temp;
      }
    }
  }
  return numbers;
}

// rewritten using built in dart methods

// using reduce built in method we compare and return the maximum
var maximumNumber = numbers.reduce((a, b) => a > b ? a : b);
// using reduce method we compare and return the minimum
var minimumNumber = numbers.reduce((a, b) => a < b ? a : b);
// using fold built in  method we sum all the numbers on the list
var sumNumber = numbers.fold(0, (acc, n) => n + acc);
// using where built in method we get the negative number based on our condition
var negativeCount = numbers.where((a) => a < 0).length;

// manually written code is more easier for us learners to understand when learning but it is more code to be written

// collection methods  are short are optimized internally but can feel abstract specially if when we are not familiar or used to functional programming.

void main() {
  int? runningMaximum = findMax(numbers);
  int? minNumber = findMin(numbers);
  int? totalValue = calculateSum(numbers);
  double? averageValue = calculateAverage(numbers);
  int? negativeNumber = countNegatives(numbers);
  List<int>? sortedNumbers = sortAscending(numbers);

  print('Number Analysis Results');
  print('========================');
  print('Numbers        : ${numbers}');
  print(
    'Maximum Value  : ${runningMaximum ?? "No result because it is empty list"}',
  );
  print(
    'Minimum Value  : ${minNumber ?? "No result because it is empty list"}',
  );
  print(
    'Sum            : ${totalValue ?? "No result because it is empty list"}',
  );
  print(
    'Average        : ${averageValue ?? "No result because it is empty list"}',
  );
  print(
    'Negative       : ${negativeNumber ?? "No result because it is empty list"}',
  );
  print(
    'Sorted List   : ${sortedNumbers ?? "No result because it is empty list"}',
  );
  print('Maximum by reduce  : $maximumNumber');
  print('Minimum by reduce  : $minimumNumber');
  print('Sum by fold        : $sumNumber');
  print('Negative by where  : $negativeCount');
}
