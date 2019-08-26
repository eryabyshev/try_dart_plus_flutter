
class BMI {

  double _height;
  double _weight;

  BMI(double height, double weight) {
    this._height = height;
    this._weight = weight;
  }

  double get weight => _weight;

  set weight(double value) {
    _weight = value;
  }

  double get height => _height;

  set height(double value) {
    _height = value;
  }
  
  double getIndex() {
    try {
      return (_weight / (_height * _height)) * 10000;
    } on IntegerDivisionByZeroException catch (e) {
      return -1;

    }

  }
  
  String getCatergory(double index) {

    if(index == -1) return "";

    if(index < 15) return "Very severely underweight";

    if(index == 16 || index == 15) return "Severely underweight";

    if(index > 16 && index <= 18.5) return "Underweight";

    if(index > 18.5 && index <= 25) return "Normal";

    if(index > 25 && index <= 30) return "Overweight";

    if(index > 30 && index <= 35) return "Moderately obese";

    if(index > 35 && index <= 40) return "Severely obese";

    if(index > 40 && index <= 45) return "Very severely obese";

    if(index > 45 && index <= 50) return "Morbidly Obese";

    if(index > 50 && index <= 60) return "Super Obese";

    if(index > 60) return "Hyper Obese";

  }

}