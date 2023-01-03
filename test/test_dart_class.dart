void main() {
  Point p1 = Point(10, 20, z: 30);
  Point p2 = Point(10, 20);

  p1.move(); // move to x:10, y:20, z:30, xy:300
  p2.move(); // move to x:10, y:20, z:0, xy:0
}

class Point {
  int _x = 0;
  int _y = 0;
  int z = 0;

  // int _xz = 0;
  late int _xz; // 늦은 초기화도 할 수 있음

  Point(this._x, this._y, {this.z = 0}) {
    _xz = _x * z;
  }

  void move() {
    print("move to x:$_x, y:$_y, z:$z, xy:$_xz");
  }
}
