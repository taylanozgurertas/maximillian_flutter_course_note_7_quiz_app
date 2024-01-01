import 'package:flutter/material.dart';
import 'package:flutter_application_2/quiz.dart';

/*

if Statements & Comparison Operators

The if statement is a crucial feature of the Dart language - actually, it's a core feature of pretty much all programming languages.

In addition to what you learned in the previous lecture, in Dart, you may also use if inside of lists to conditionally add items to lists:

final myList = [
  1,
  2,
  if (condition)
    3
];

In this example, the number 3 will only be added to myList if condition was met

final myList = [
  1,
  2,
  if (condition)
    3
  else
    4
];


Using this feature is optional. Alternatively, you could, for example, also work with a ternary expression:

final myList = [
  1,
  2,
  condition ? 3 : 4
];


Especially when inserting more complex values (e.g., a widget with multiple parameters being set) into a more complex list (e.g., a list of widgets passed to a Column() or Row()), this feature can lead to more readable code.
 
 Examples:

 if (true) {
  // do something ...
}
// or
true ? 'this' : 'that'



veya


if (randomNumber == 5) {
  // do something
}

karıştırma

var userName = 'Max'; // assignment operator used
if (userName == 'Max') { ... } // comparison operator used

!= to check for inequality (randomNumber != 5 expects randomNumber to NOT be 5, i.e., to be any other value)

> to check for the value on the left to be greater than the value on the right (randomNumber > 5 yields true if randomNumber is greater than 5)

>= to check for the value on the left to be greater than or equal to the value on the right (randomNumber >= 5 yields true if randomNumber is greater than 5 or equals 5)

< to check for the value on the left to be smaller than the value on the right (randomNumber < 5 yields true if randomNumber is smaller than 5)

<= to check for the value on the left to be smaller than or equal to the value on the right (randomNumber <= 5 yields true if randomNumber is smaller than 5 or equals 5)
 
 


 !PUB.DEV

 pub.dev dart package larının toplandığı bir yer bir sürü package var kullanılabilecek. 
 */

void main() {
  runApp(const Quiz());
}
