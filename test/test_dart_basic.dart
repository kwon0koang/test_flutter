void main() {
  int num1 = 0;
  double num2 = 2.0;
  num num3 = 3;
  num num4 = 4.0;
  String str1 = 'hello';
  bool bool1 = true;

  print(num1 is int); // true
  print(num2 is int); // false
  print(num1.runtimeType); // int

  // ===================================================================================================================================

  List<String> strings = ['aaa', 'bbb', 'ccc'];

  print(strings is List<String>); // true
  print(strings.runtimeType); // List<String>

  // ===================================================================================================================================

  // dynamic은 런타임 때 타입 결정되서 잘 사용하지 않지만, Map에서는 많이 사용함
  Map<String, dynamic> kyk = {
    'name': 'kyk',
    'age': 20
  };

  print(kyk.keys);  // (name, age)
  print(kyk.entries); // (MapEntry(name: kyk), MapEntry(age: 20))
  print(kyk['name']); // kyk
  print(kyk['age']);  // 20

  // ===================================================================================================================================

  var varHello = 'hello'; // 컴파일 때 타입 결정
  dynamic dynamicHello = 'hello'; // 런타임 때 타입 결정 (특별한 경우 아니면 사용 X)

  // ===================================================================================================================================

  String? name = null; // Nullable
  name = name ?? 'hello'; // name이 null이면 hello를 넣어라
  name ??= 'hello'; // name이 null이면 hello를 넣어라 (위와 동일)

  // ===================================================================================================================================

  Human human = Human();
  human.name = 'kwonname';
  human.age = 20;
  human.major = "IT";
  Human human2 = Human() // 위와 동일
    ..name = 'kwonname' // .. 은 cascade 연산자
    ..age = 20
    ..major = 'IT';

  // ===================================================================================================================================

  num i = 1;
  int ii = i as int;
  num d = 1.234;
  double dd = d as double;
  print("ii:$ii, dd:$dd"); // ii:1, dd:1.234

  // ===================================================================================================================================

  // Named parameter
  print(sum(b: 2, a: 1)); // 3
  print(sum(a: 1)); // 1
  print(sum()); // 0

  print(sum2(1, 2)); // 3
  print(sum2(1)); // 1
  print(sum2()); // 0

  // ===================================================================================================================================

  // Function
  print(calc(10, 20, callback: (a, b) => a + b)); // 30
  print(calc(10, 20, callback: (a, b) => a * b)); // 200

  // ===================================================================================================================================

  // 리스트 결합
  List<int> intItems = [1, 2, 3];
  List<int> intItems2 = [...intItems, 7, 8, ...intItems, 9];
  print(intItems); // [1, 2, 3]
  print(intItems2); // [1, 2, 3, 7, 8, 1, 2, 3, 9]

  // 리스트에 if문도 들어갈 수 있음
  List<int> intItems3 = [1, 2, if (false) 3, 4];
  print(intItems3); // [1, 2, 4]
  List<int> intItems4 = [1, 2, if (true) 3, 4];
  print(intItems4); // [1, 2, 3, 4]

}

// {} 안에 있는 것들은 Optional. Named parameter. 넘기는 파라미터 순서 변경되도 상관없음
int sum({int a = 0, int b = 0}) => a + b;

// [] 안에 있는 것들은 Optional
int sum2([int a = 0, int b = 0]) => a + b;

// required 적으면 기본값을 주지 않아도 됨
int calc(int n1, int n2, {required Function(int, int) callback}) =>
    callback(n1, n2);

class Human {
  String name = '';
  int age = 0;
  String major = '';
}
