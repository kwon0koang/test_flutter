// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todoListViewModelStateNotifierHash() =>
    r'bcb7afce1a6ea6cf910c25cc9288d04b210a4b7e';

/// See also [TodoListViewModelStateNotifier].
@ProviderFor(TodoListViewModelStateNotifier)
final todoListViewModelStateNotifierProvider =
    AutoDisposeNotifierProvider<TodoListViewModelStateNotifier, void>.internal(
  TodoListViewModelStateNotifier.new,
  name: r'todoListViewModelStateNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todoListViewModelStateNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TodoListViewModelStateNotifier = AutoDisposeNotifier<void>;
String _$todosStateNotifierHash() =>
    r'7d29b5219ca399938ad2335a0946bd786e42b32d';

/// See also [TodosStateNotifier].
@ProviderFor(TodosStateNotifier)
final todosStateNotifierProvider =
    AsyncNotifierProvider<TodosStateNotifier, List<TodoModel>>.internal(
  TodosStateNotifier.new,
  name: r'todosStateNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todosStateNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TodosStateNotifier = AsyncNotifier<List<TodoModel>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
