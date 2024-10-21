import 'dart:math';

class Customer {
  String name;
  int age;

  Customer(this.name, this.age);

  @override
  String toString() {
    return '{ ${this.name}, ${this.age} }';
  }
}

List <Customer> getCustomers() {
  List<String> names = [
    'Emma',
    'Liam',
    'Olivia',
    'Noah',
    'Ava',
    'Ethan',
    'Isabella',
    'Mason',
    'Sophia',
    'James',
    'Mia',
    'Benjamin',
    'Charlotte',
    'Lucas',
    'Amelia',
    'Harper',
    'Elijah',
    'Abigail',
    'Henry',
    'Emily'
  ];
  List <Customer> customers = [];

  Random random = new Random();
  for(int i=0; i< names.length; i++) {
    String randomName = names[i];
    int randomAge = random.nextInt(100);
    customers.add(Customer(randomName, randomAge));
  }
  return customers;
}
