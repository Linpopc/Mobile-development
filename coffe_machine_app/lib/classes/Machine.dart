class Machine{
  double _coffeeBeans;
  double _milk;
  double _water;
  double _cash;

  Machine([this._coffeeBeans=0, this._water=0, this._milk=0, this._cash=0]);

  double get coffeeBeans => _coffeeBeans;
  set coffeeBeans(double value) => _coffeeBeans = value;

  double get milk => _milk;
  set milk(double value) => _milk = value;

  double get water => _water;
  set water(double value) => _water = value;

  double get cash => _cash;
  set cash(double value) => _cash = value;

  bool isAvailable() => (_coffeeBeans >= 50 && _water >= 100);


  void _subtractResources(){
    _coffeeBeans -= 50;
    _water -= 100;
  }

  void makingCoffee(){
    if (isAvailable()) {

      _subtractResources();
      print("Эспрессо приготовлен!");

    }
    else{

      print("Нехватка ресурсов для эспрессо.");

    }
  }
}