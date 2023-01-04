void main() {
  Box stringBox = Box<String>('hello');
  Box intBox = Box<int>(12345);
  print(stringBox.getValue());  // hello
  print(intBox.getValue()); // 12345
}

class Box<T> {
  T value;
  Box(this.value);

  T getValue() => value;
}