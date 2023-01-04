import 'package:flutter_test/flutter_test.dart';

void main() async {
  await Future.delayed(Duration(seconds: 2))
      .then((value) => print('2초 지남'))
      .catchError((e) => prints(e));

  await hello().then((value) => print(value));

  String str = await hello();
  print(str);

  // 2초 지남
  // hello
  // hello
}

Future<String> hello() async {
  await Future.delayed(Duration(seconds: 2));
  return 'hello';
}