class Human {
  String _name; //private
  int age;
  int id;


  Human(String name, int age, int index){
    this._name = name;
    this.age = age;
    id = index;
  }

  //getter
  String get name {
    return _name;
  }
  //setter
  set name(String name) => this._name = name;


  Human.nonamed(int age, int index){
    _name = "Unknown";
    this.age = age;
    id = index;
  }
}

useClassHuman() {
  Human h = new Human("Ivan", 23, 10);

  h.name = 'Ivan Ivanov';
}


//inheritance

class Letter{
  String _letter = '';

  Letter(String letter){
    _letter = letter;
  }

  String getLetter(){
    return _letter;
  }
}

class A extends Letter{
  int _index = 0;
  A(int index):super('A'){
    _index = index;
  }
  int getIndex(){
    return _index;
  }
}

class B extends Letter{
  String _action = null;
  B(String action):super('B'){
    _action = action;
  }
  String getAction(){
    return _action + super.getLetter();
  }
}


//abstract

abstract class A1{
  String getA(){ return 'A';}
  String getAny();
}

class B1 extends A1{
  String getAny(){ return 'B'; }
}

class C extends A1{
  @override
  String getAny(){ return 'C'; } // реализация
}


//interface
abstract class Animal {
  void move();
}

class Dog implements Animal{
  String name = 'dog';
  void move(){ walk(); }
  void walk(){ print ("$name walks");}
}

class Bird implements Animal{
  String name = 'bird';
  void move(){ fly(); }
  void fly(){ print ("$name flies");}
}

intrfaceExample() {
  List<Animal> animals = new List();
  animals.add(new Dog());
  animals.add(new Bird());
}


//mixins

abstract class Walker {
  String name;
  void walk(){ print ("$name walks");}
}

class Man extends Object with Walker{
  String what = 'man';
}

class Cat extends Object with Walker{
  String what = 'cat';
}

void mixIn(){
  Man man = new Man();
  Cat cat = new Cat();

  man.walk();
  cat.walk();
}