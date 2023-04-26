import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_model.freezed.dart';
part 'todo_model.g.dart';

@freezed
class TodoModel with _$TodoModel {
  const factory TodoModel({
    required int userId,
    required int id,
    required String title,
    required bool completed,
  }) = _TodoModel;

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);
}
