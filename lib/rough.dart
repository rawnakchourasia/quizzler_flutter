mixin ElectricVehicle {
  void charge() {
    print('Charging the electric vehicle...');
  }
}

mixin SelfDriving {
  void navigate() {
    print('Self-driving mode engaged.');
  }
}

class Car with ElectricVehicle, SelfDriving {
  void start() {
    print('Car started.');
  }
}

void main() {
  Car myCar = Car();
  myCar.start();
  myCar.charge();
  myCar.navigate();
}
