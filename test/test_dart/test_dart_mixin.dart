void main() {
  SuperHero superHero = SuperHero();
  superHero.fly();  // fly
  superHero.swim(); // swim
}

mixin Flying {
  void fly() {
    print('fly');
  }
}

mixin Swimming {
  void swim() {
    print('swim');
  }
}

class Hero {}
class SuperHero extends Hero with Flying, Swimming {}