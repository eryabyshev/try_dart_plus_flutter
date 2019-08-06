
simpleFunction() {
  print("simple");
}


String returnString() {
  return "STRING";
}

int add(int a, int b) {
  return a + b;
}

//Optional Positional Parameter
optionalParmert(n1,[s1]) {
  print(n1);
  print(s1);
}

//Optional Named Parameter
namedParamert(n1,{s1,s2}) {
  print(n1);
  print(s1);
}

namedParamertExample() {
  namedParamert(123);
  namedParamert(123,s1:'hello');
  namedParamert(123,s2:'hello',s1:'world');
}

//Optional Parameters with Default Values
defaultParamer(n1,{s1:12}) {
  print(n1);
  print(s1);
}

defaultParametrExample() {
  defaultParamer(12);
}


//Lambda Functions
printMsg()=>
    print("hello");

int sum(int a, int b) => a + b;


lambdaExample(){
  printMsg();
  sum(2, 6);
}
