
loops() {

  outerloop:

  for (var i = 0; i < 5; i++) {
    print("Innerloop: ${i}");
    innerloop:

    for (var j = 0; j < 5; j++) {
      if (j > 3 ) break ;

      // Quit the innermost loop
      if (i == 2) break innerloop;

      // Do the same thing
      if (i == 4) continue outerloop;

      // Quit the outer loop
      print("Innerloop: ${j}");
    }
  }


  var counter = 10;

  while(counter > 0) {
    counter--;

    if(counter % 2 == 0) {
      continue;
    }
    print(counter);
    if(counter == 5) {
      break;
    }
  }

}