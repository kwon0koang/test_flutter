// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:test_flutter/src/model/todo_model.dart' as _i9;
import 'package:test_flutter/src/pages/main/main_page.dart' as _i4;
import 'package:test_flutter/src/pages/test_counter/test_counter_page.dart'
    as _i5;
import 'package:test_flutter/src/pages/test_paging/test_paging_page.dart'
    as _i3;
import 'package:test_flutter/src/pages/test_retrofit/todo_detail_page.dart'
    as _i1;
import 'package:test_flutter/src/pages/test_retrofit/todo_list_page.dart'
    as _i2;
import 'package:test_flutter/src/pages/test_sliver_list/test_sliver_list_page.dart'
    as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    TodoDetailRoute.name: (routeData) {
      final args = routeData.argsAs<TodoDetailRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.TodoDetailPage(
          key: args.key,
          todoModel: args.todoModel,
        ),
      );
    },
    TodoListRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.TodoListPage(),
      );
    },
    TestPagingRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.TestPagingPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MainPage(),
      );
    },
    TestCounterRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.TestCounterPage(),
      );
    },
    TestSliverListRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.TestSliverListPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.TodoDetailPage]
class TodoDetailRoute extends _i7.PageRouteInfo<TodoDetailRouteArgs> {
  TodoDetailRoute({
    _i8.Key? key,
    required _i9.TodoModel todoModel,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          TodoDetailRoute.name,
          args: TodoDetailRouteArgs(
            key: key,
            todoModel: todoModel,
          ),
          initialChildren: children,
        );

  static const String name = 'TodoDetailRoute';

  static const _i7.PageInfo<TodoDetailRouteArgs> page =
      _i7.PageInfo<TodoDetailRouteArgs>(name);
}

class TodoDetailRouteArgs {
  const TodoDetailRouteArgs({
    this.key,
    required this.todoModel,
  });

  final _i8.Key? key;

  final _i9.TodoModel todoModel;

  @override
  String toString() {
    return 'TodoDetailRouteArgs{key: $key, todoModel: $todoModel}';
  }
}

/// generated route for
/// [_i2.TodoListPage]
class TodoListRoute extends _i7.PageRouteInfo<void> {
  const TodoListRoute({List<_i7.PageRouteInfo>? children})
      : super(
          TodoListRoute.name,
          initialChildren: children,
        );

  static const String name = 'TodoListRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.TestPagingPage]
class TestPagingRoute extends _i7.PageRouteInfo<void> {
  const TestPagingRoute({List<_i7.PageRouteInfo>? children})
      : super(
          TestPagingRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestPagingRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MainPage]
class MainRoute extends _i7.PageRouteInfo<void> {
  const MainRoute({List<_i7.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.TestCounterPage]
class TestCounterRoute extends _i7.PageRouteInfo<void> {
  const TestCounterRoute({List<_i7.PageRouteInfo>? children})
      : super(
          TestCounterRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestCounterRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.TestSliverListPage]
class TestSliverListRoute extends _i7.PageRouteInfo<void> {
  const TestSliverListRoute({List<_i7.PageRouteInfo>? children})
      : super(
          TestSliverListRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestSliverListRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
