import './Enums.dart';
import 'dart:async';

abstract class ICoffee {

  double coffeeBeans();
  double milk();
  double water();
  double cash();

}

class Resources {

  double coffeeBeans;
  double milk;
  double water;
  double cash;

  Resources({this.coffeeBeans = 0, this.milk = 0, this.water = 0, this.cash = 0});

}

class Espresso implements ICoffee {

  @override
  double coffeeBeans() => 50;

  @override
  double milk() => 0;

  @override
  double water() => 100;

  @override
  double cash() => 80;

}

class Cappuccino implements ICoffee {

  @override
  double coffeeBeans() => 40;

  @override
  double milk() => 100;

  @override
  double water() => 80;

  @override
  double cash() => 140;

}

class Latte implements ICoffee {

  @override
  double coffeeBeans() => 30;

  @override
  double milk() => 60;

  @override
  double water() => 150;

  @override
  double cash() => 120;

}

ICoffee createCoffee(coffeType type) {

  switch(type) {
    case coffeType.espresso:
      return Espresso();

    case coffeType.cappuccino:
      return Cappuccino();

    case coffeType.latte:
      return Latte();

  }

}

class Machine {

  Resources _resources;

  Machine(this._resources);

  void fillResources(double coffeeBeans, double milk, double water, double cash) {

    _resources.coffeeBeans += coffeeBeans;
    _resources.milk += milk;
    _resources.water += water;
    _resources.cash += cash;

    print("Ресурсы пополнены! Текущие запасы: кофе - ${_resources.coffeeBeans}, молоко - ${_resources.milk}, вода - ${_resources.water}, деньги - ${_resources.cash}");

  }

  Future<void> _heatWater() async {

    print("Нагрев воды...");
    await Future.delayed(Duration(seconds: 3));
    print("Вода нагрета!");

  }

  Future<void> _brewCoffee() async {

    print("Заваривание кофе...");
    await Future.delayed(Duration(seconds: 5));
    print("Кофе заварен!");

  }

  Future<void> _frothMilk() async {

    print("Взбивание молока...");
    await Future.delayed(Duration(seconds: 5));
    print("Молоко взбито!");

  }

  bool _isAvailableResources(ICoffee coffee) {

    return _resources.cash >= coffee.cash() &&
    _resources.water >= coffee.water() &&
    _resources.milk >= coffee.milk() &&
    _resources.coffeeBeans >= coffee.coffeeBeans();

  }

  void _subtractResources(ICoffee coffee) {

    _resources.coffeeBeans -= coffee.coffeeBeans();
    _resources.milk -= coffee.milk();
    _resources.water -= coffee.water();
    _resources.cash -= coffee.cash();

  }

  void makingCoffeeByType(coffeType type) {

    ICoffee coffee = createCoffee(type);

    if (_isAvailableResources(coffee)) {

      _subtractResources(coffee);

      print("${coffee.runtimeType}  приготовлен!");

    }
    else{

      print("Нехватка ресурсов для ${coffee.runtimeType} .");

    }
  }
}