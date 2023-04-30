mixin Expandable {
  bool isExpanded = false;
  toggleExpand() {
    isExpanded = !isExpanded;
  }
}
mixin Checkable {
  bool isChecked = false;
  toggleCheck() {
    isChecked = !isChecked;
  }
}

class ExtendedModel<T> with Expandable, Checkable {
  ExtendedModel({required this.model});
  final T model;
}
