// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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
String _$todosNotifierHash() => r'b424d6ac273b615aaf3ff69312ef16e141d9f413';

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
    r'a4225e541c9c9bb92b6ba7ed59439f01b6976c3f';

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
