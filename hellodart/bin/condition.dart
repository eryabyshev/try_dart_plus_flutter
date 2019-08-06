condition() {
  //if
  var num1 = 5;
  if (num1 > 0) {
    print("number is positive");
  }

  //if ... else
  var num2 = 12;
  if (num2 % 2 == 0) {
    print("Even");
  } else {
    print("Odd");
  }

  //if ... else if ... else
  var num3 = 2;
  if (num3 > 0) {
    print("${num3} is positive");
  } else if (num3 < 0) {
    print("${num3} is negative");
  } else {
    print("${num3} is neither positive nor negative");
  }


  //switch
  var grade = "A";
  switch(grade) {
    case "A": {  print("Excellent"); }
    break;

    case "B": {  print("Good"); }
    break;

    case "C": {  print("Fair"); }
    break;

    case "D": {  print("Poor"); }
    break;

    default: { print("Invalid choice"); }
    break;
  }
}
