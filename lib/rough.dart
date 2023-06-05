class Human {
  double height;
  double weight;

  // Constructor
  Human(this.height, this.weight);
}

void main() {
  var jenny = Human(15, 3.5);
  var james = Human(20, 4.2);

  print(jenny.height); // Output: 15
  print(james.height); // Output: 20
}
