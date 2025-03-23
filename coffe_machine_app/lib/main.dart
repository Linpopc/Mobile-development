import 'classes/Machine.dart';
import 'classes/Enums.dart';

void main() {

  Machine coffeeMachine = Machine(
      Resources(coffeeBeans: 200, milk: 500, water: 1000, cash: 500));


  coffeeMachine.makingCoffeeByType(coffeType.latte);
  coffeeMachine.makingCoffeeByType(coffeType.cappuccino);
  coffeeMachine.makingCoffeeByType(coffeType.espresso);


  coffeeMachine.fillResources(100, 200, 300, 50);

}

