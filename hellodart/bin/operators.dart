
operators() {

  num add = 2 + 2;
  num subtract = 4 - 3;

  /*
  Unary minus, also known as negation
  (reverse the sign of the expression)
  num expr = -add;
  */

  num multiply = 5 * 5;
  num divide = 3 / 7;

  //Divide, returning an integer result
  divide = 5 ~/ 4;

  num modulo = 100 % 10;

  num increment = modulo++;

  num decriment = modulo--;

  var a = 11;
  var b = 33;

  a > b;
  a < b;
  a >= b;
  a <= b;
  a == b;
  a != b;

  //True if the object has the specified type
  a is int;
  //False if the object has the specified type
  a is! int;

  //Bitwise Operators

  var and =  a & b;
  var or = a | b;
  var xor = a ^ b;
  var not = ~a;
  var leftShift = a << b;
  var rightShift = a >> b;

  //Assignment operators https://dart.dev/guides/language/language-tour#assignment-operators

  var a1 = null;
  var b1 = 10;
  // Assign value to a
  var c1 = a1;
  // Assign value to b if b is null; otherwise, b stays the same
  b ??= a1;
  print(b1); // 10


  //Multiply and Assignment
  b *= 10;
  /*
  Same logic applies to Bitwise operators, so they will
  become
  +=,
  -=.
  /=,
  ≪=,
  ≫=,
  ≫=,
  ≫=,
  |=
  and ^=
   */


  //Logical Operators
  true && false;
  true || false;
  !false;

  //Conditional Expressions
  var res = a > 12 ? "true":"false";
}