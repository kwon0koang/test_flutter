void main() {
  Point p1 = Point(10, 20, z: 30);
  Point p2 = Point(10, 20);

  p1.move(); // move to x:10, y:20, z:30, xy:300
  p2.move(); // move to x:10, y:20, z:0, xy:0

  // ====================================================================================================================================================================================

  StarcraftUnit.createMarine().walk(); // Marine walk
  StarcraftUnit.createMedic().walk(); // Medic walk
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

class StarcraftUnit {
  StarcraftUnit();

  void walk() {}

  factory StarcraftUnit.createMarine() => Marine();
  factory StarcraftUnit.createMedic() => Medic();
}

class Marine extends StarcraftUnit {
  @override
  void walk() {
    print('Marine walk');
  }
}

class Medic extends StarcraftUnit {
  @override
  void walk() {
    print('Medic walk');
  }
}
