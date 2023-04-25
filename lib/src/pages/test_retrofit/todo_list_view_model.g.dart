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
    r'03697fc09f6c783b70bf7c279bcbc79b4a974d7f';

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
String _$todosNotifierHash() => r'4671e6db5174cff46a9c543005375d52ecc4c13e';

/// See also [TodosNotifier].
@ProviderFor(TodosNotifier)
final todosNotifierProvider =
    AsyncNotifierProvider<TodosNotifier, List<TodoModel>>.internal(
  TodosNotifier.new,
  name: r'todosNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todosNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TodosNotifier = AsyncNotifier<List<TodoModel>>;
String _$filterTodoTextNotifierHash() =>
    r'ca51249e0e39f1581f1d069c358231005ffc72cc';

/// See also [FilterTodoTextNotifier].
@ProviderFor(FilterTodoTextNotifier)
final filterTodoTextNotifierProvider =
    NotifierProvider<FilterTodoTextNotifier, String>.internal(
  FilterTodoTextNotifier.new,
  name: r'filterTodoTextNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filterTodoTextNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FilterTodoTextNotifier = Notifier<String>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
