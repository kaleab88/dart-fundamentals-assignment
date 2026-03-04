// Task 2: Async Calculator App
// Name: Kaleab Bantayehu

import 'dart:async';

class InvalidOperationException implements Exception {
  final String message;
  InvalidOperationException(this.message);

  @override
  String toString() => 'InvalidOperationException: $message';
}

class Calculator {
  final String name;
  List<String> history = []; // stores past results
  Calculator(this.name);
  // Adds two numbers and returns the result
  double add(double a, double b) => a + b;
  // Subtract two numbers and returns the result
  double subtract(double a, double b) => a - b;
  // Multiply two numbers and returns the result
  double multiply(double a, double b) => a * b;
  // First checks if the B is not zero then Divides two numbers and returns the result
  double divide(double a, double b) {
    if (b == 0) {
      throw ArgumentError('Cannot divide $a by zero.');
    }
    return a / b;
  }

  Future<double> computeAsync(double a, double b, String op) async {
    double result;
    switch (op) {
      case 'add':
        result = add(a, b);
        break;
      case 'subtract':
        result = subtract(a, b);
        break;
      case 'multiply':
        result = multiply(a, b);
        break;
      case 'divide':
        result = divide(a, b);
        break;
      default:
        throw InvalidOperationException(
          'Unknown operation: $op. Valid options are add, subtract, multiply, divide.',
        );
    }
    const delay = Duration(milliseconds: 1500);
    await Future.delayed(delay);
    return result;
  }

  Future<void> displayResult(double a, double b, String op) async {
    try {
      final result = await computeAsync(a, b, op);
      print(
        '$op(${a.toStringAsFixed(1)}, ${b.toStringAsFixed(1)}) = ${result.toStringAsFixed(1)}',
      );
      // Print the formatted result
      history.add(
        '$op(${a.toStringAsFixed(1)}, ${b.toStringAsFixed(1)}) = ${result.toStringAsFixed(1)}',
      );
    } catch (e) {
      print('Error: $e');
      history.add('Error during $op($a, $b): $e');
    }
  }

  void printHistory() {
    print('--- Calculation History ---');
    for (var record in history) {
      print(record);
    }
    print('--- End of History ---');
  }
// calculates the computed chain from the list 
  Future<double> computeChained(List<double> values, String op) async {
    if (values.isEmpty) {
      throw ArgumentError('Values cannot be empty');
    }
    double result = values[0];
    for (var i = 1; i < values.length; i++) {
      switch (op) {
        case 'add':
          result = add(result, values[i]);
          break;
        case 'subtract':
          result = subtract(result, values[i]);
          break;
        case 'multiply':
          result = multiply(result, values[i]);
          break;
        case 'divide':
          result = divide(result, values[i]);
          break;
        default:
          throw InvalidOperationException(
            'Unknown operation: $op. Valid options are add, subtract, multiply, divide.',
          );
      }
    }
    const delay = Duration(milliseconds: 1500);
    await Future.delayed(delay);
    return result;
  }
// display the chained calculated results 
  Future<void> displayChained(List<double> values, String op) async {
    try {
      final result = await computeChained(values, op);
      print('$op(${values.join(", ")}) = ${result.toStringAsFixed(1)}');
      history.add('$op(${values.join(", ")}) = ${result.toStringAsFixed(1)}');
    } catch (e) {
      print('Error: $e');
      history.add('Error during $op(${values.join(", ")}): $e');
    }
  }
}
// Main function demonstrates sequential vs parallel execution of async calculator operations

Future<void> main() async {
  final calc = Calculator('MyCalculator');
  print('--- ${calc.name} ---');

  print(
    '--- Sequential Execution ---',
  ); // Sequential execution: each call waits 1.5s, total ~15s.
  await calc.displayResult(10, 4, 'add');

  await calc.displayResult(10, 4, 'subtract');

  await calc.displayResult(4, 5, 'multiply');

  await calc.displayResult(20, -3, 'multiply');

  await calc.displayResult(10, 2, 'divide');

  await calc.displayResult(10, 0, 'divide'); // Test error

  await calc.displayChained([1, 2, 3, 4], 'add');

  await calc.displayChained([2, 3, 4], 'multiply');

  await calc.displayChained([100, 20, 5], 'divide');

  await calc.displayResult(10, 4, 'modulus'); // Invalid operation test

  print(
    '--- Parallel Execution ---',
  ); // Parallel execution: all calls run together, total ~1.5s.
  await Future.wait([
    calc.displayResult(40, 34, 'add'),
    calc.displayResult(17, 10, 'subtract'),
    calc.displayResult(10, 8, 'multiply'),
  ]);
  // This shows why parallel futures are faster.

  print('All calculations complete.');
  calc.printHistory();
}
