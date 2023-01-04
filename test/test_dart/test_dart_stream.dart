void main() async {
  Stream<int> stream = Stream.fromIterable([1, 2, 3]);
  stream.listen((event) {
    print(event);
  });

  // 1
  // 2
  // 3

  await Future.delayed(Duration(seconds: 1));
}