import 'dart:isolate';

void main() async {
  MySingleton mySingleton01 = MySingleton();
  MySingleton mySingleton02 = MySingleton();

  print('mySingleton01.hashCode:${mySingleton01.hashCode}');
  print('mySingleton02.hashCode:${mySingleton02.hashCode}');

  // 하나의 isolate는 별도의 메모리와 하나의 스레드, 이벤트 루프를 가지고 있다.
  // flutter앱도 main isolate에서 실행된다. 이러한 점은 자바에서 여러 스레드가 하나의 메모리를 공유한다는 점에서 차이가 있다.
  Isolate? isolate = await Isolate.spawn<String>((message) {
    MySingleton mySingleton03 = MySingleton();
    print('mySingleton03.hashCode:${mySingleton03.hashCode}');
  }, 'message');

  // flutter: MySingleton._internal
  // flutter: mySingleton01.hashCode:453718299
  // flutter: mySingleton02.hashCode:453718299
  // flutter: MySingleton._internal
  // flutter: mySingleton03.hashCode:120842792
}

class MySingleton {
  static final MySingleton _instance = MySingleton._internal();

  factory MySingleton() {
    return _instance;
  }

  MySingleton._internal() {
    print('MySingleton._internal');
  }
}
