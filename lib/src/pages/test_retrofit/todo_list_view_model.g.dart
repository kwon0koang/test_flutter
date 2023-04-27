// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredTodosHash() => r'3eac3dff87ae3cfdb34a8b33123ca00cfb59323b';

/// See also [filteredTodos].
@ProviderFor(filteredTodos)
final filteredTodosProvider =
    AutoDisposeProvider<AsyncValue<List<TodoModel>>>.internal(
  filteredTodos,
  name: r'filteredTodosProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredTodosHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FilteredTodosRef = AutoDisposeProviderRef<AsyncValue<List<TodoModel>>>;
String _$todoListViewModelNotifierHash() =>
    r'959957b5edf3e45f5d03290e328468d198b94c99';

/// See also [TodoListViewModelNotifier].
@ProviderFor(TodoListViewModelNotifier)
final todoListViewModelNotifierProvider =
    AutoDisposeNotifierProvider<TodoListViewModelNotifier, void>.internal(
  TodoListViewModelNotifier.new,
  name: r'todoListViewModelNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todoListViewModelNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TodoListViewModelNotifier = AutoDisposeNotifier<void>;
String _$todosNotifierHash() => r'68a28d7e3770fc15345edcb1f24ce8bda08bd38a';

/// See also [TodosNotifier].
@ProviderFor(TodosNotifier)
final todosNotifierProvider =
    AutoDisposeAsyncNotifierProvider<TodosNotifier, List<TodoModel>>.internal(
  TodosNotifier.new,
  name: r'todosNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todosNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TodosNotifier = AutoDisposeAsyncNotifier<List<TodoModel>>;
String _$filterTodoTextNotifierHash() =>
    r'ab3c1d974de50e6d944cc4314eae5c05a549ae0a';

/// See also [FilterTodoTextNotifier].
@ProviderFor(FilterTodoTextNotifier)
final filterTodoTextNotifierProvider =
    AutoDisposeNotifierProvider<FilterTodoTextNotifier, String>.internal(
  FilterTodoTextNotifier.new,
  name: r'filterTodoTextNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filterTodoTextNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FilterTodoTextNotifier = AutoDisposeNotifier<String>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
