
class CounterModel {
  var _count = 0;
  get count => _count;

  void increase() => _count++;
  void decrease() => _count--;
}