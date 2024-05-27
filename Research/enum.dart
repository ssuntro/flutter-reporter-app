void main() {
  final fruitString = 'banana';
  final fruit = Fruit.values.byName(fruitString);
  print("fruit $fruit");
  final a = Vehicle.bicycle;
  print(a.isTwoWheeled);
  print(Vehicle.bicycle.compareTo(Vehicle.bus));

  printError(NetworkError.badURL);
}

enum NetworkError { badURL, timeout, resourceNotAvilable }

void printError(NetworkError error) {
  switch (error) {
    case NetworkError.badURL:
      print('bad url');
    case NetworkError.timeout:
      print('timeout');
    case NetworkError.resourceNotAvilable:
      print('resource not avilable');
    default: // Without this, you see a WARNING.
      print(error);
  }
}

enum Fruit {
  apple,
  banana,
  orange,
  mango,
}

enum Vehicle implements Comparable<Vehicle> {
  car(tires: 4, passengers: 5, carbonPerKilometer: 400),
  bus(tires: 6, passengers: 50, carbonPerKilometer: 800),
  bicycle(tires: 2, passengers: 1, carbonPerKilometer: 0);

  const Vehicle({
    required this.tires,
    required this.passengers,
    required this.carbonPerKilometer,
  });

  final int tires;
  final int passengers;
  final int carbonPerKilometer;

  int get carbonFootprint => (carbonPerKilometer / passengers).round();

  bool get isTwoWheeled => this == Vehicle.bicycle;

  @override
  int compareTo(Vehicle other) => carbonFootprint - other.carbonFootprint;
}
