void main() {
  Dog dog = Dog();
  Cat cat = Cat();
  Animal dog2 = Dog();
  Animal cat2 = Cat();
  dog.say();  // 멍멍
  cat.say();  // 냐옹
  dog2.say(); // 멍멍
  cat2.say(); // 냐옹
}

abstract class Animal {
  void say() {
    print('...');
  }
}

class Dog extends Animal {
  @override
  void say() {
    print('멍멍');
  }
}

class Cat extends Animal {
  @override
  void say() {
    print('냐옹');
  }
}