// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:test_flutter/src/model/todo_model.dart' as _i12;
import 'package:test_flutter/src/pages/error/error_page.dart' as _i6;
import 'package:test_flutter/src/pages/main/main_page.dart' as _i5;
import 'package:test_flutter/src/pages/test_counter/test_counter_page.dart'
    as _i9;
import 'package:test_flutter/src/pages/test_method_channel/test_method_channel_page.dart'
    as _i8;
import 'package:test_flutter/src/pages/test_retrofit/todo_detail_page.dart'
    as _i1;
import 'package:test_flutter/src/pages/test_retrofit/todo_list_page.dart'
    as _i2;
import 'package:test_flutter/src/pages/test_riverpod/test_riverpod_page.dart'
    as _i4;
import 'package:test_flutter/src/pages/test_sliver_list/test_sliver_list_page.dart'
    as _i3;
import 'package:test_flutter/src/pages/test_social_login/test_social_login_page.dart'
    as _i7;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    TodoDetailRoute.name: (routeData) {
      final args = routeData.argsAs<TodoDetailRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.TodoDetailPage(
          key: args.key,
          todoModel: args.todoModel,
        ),
      );
    },
    TodoListRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.TodoListPage(),
      );
    },
    TestSliverListRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.TestSliverListPage(),
      );
    },
    TestRiverpodRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.TestRiverpodPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.MainPage(),
      );
    },
    ErrorRoute.name: (routeData) {
      final args = routeData.argsAs<ErrorRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ErrorPage(
          key: args.key,
          errMsg: args.errMsg,
        ),
      );
    },
    TestSocialLoginRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.TestSocialLoginPage(),
      );
    },
    TestMethodChannelRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.TestMethodChannelPage(),
      );
    },
    TestCounterRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.TestCounterPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.TodoDetailPage]
class TodoDetailRoute extends _i10.PageRouteInfo<TodoDetailRouteArgs> {
  TodoDetailRoute({
    _i11.Key? key,
    required _i12.TodoModel todoModel,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          TodoDetailRoute.name,
          args: TodoDetailRouteArgs(
            key: key,
            todoModel: todoModel,
          ),
          initialChildren: children,
        );

  static const String name = 'TodoDetailRoute';

  static const _i10.PageInfo<TodoDetailRouteArgs> page =
      _i10.PageInfo<TodoDetailRouteArgs>(name);
}

class TodoDetailRouteArgs {
  const TodoDetailRouteArgs({
    this.key,
    required this.todoModel,
  });

  final _i11.Key? key;

  final _i12.TodoModel todoModel;

  @override
  String toString() {
    return 'TodoDetailRouteArgs{key: $key, todoModel: $todoModel}';
  }
}

/// generated route for
/// [_i2.TodoListPage]
class TodoListRoute extends _i10.PageRouteInfo<void> {
  const TodoListRoute({List<_i10.PageRouteInfo>? children})
      : super(
          TodoListRoute.name,
          initialChildren: children,
        );

  static const String name = 'TodoListRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.TestSliverListPage]
class TestSliverListRoute extends _i10.PageRouteInfo<void> {
  const TestSliverListRoute({List<_i10.PageRouteInfo>? children})
      : super(
          TestSliverListRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestSliverListRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.TestRiverpodPage]
class TestRiverpodRoute extends _i10.PageRouteInfo<void> {
  const TestRiverpodRoute({List<_i10.PageRouteInfo>? children})
      : super(
          TestRiverpodRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestRiverpodRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i5.MainPage]
class MainRoute extends _i10.PageRouteInfo<void> {
  const MainRoute({List<_i10.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ErrorPage]
class ErrorRoute extends _i10.PageRouteInfo<ErrorRouteArgs> {
  ErrorRoute({
    _i11.Key? key,
    required String errMsg,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          ErrorRoute.name,
          args: ErrorRouteArgs(
            key: key,
            errMsg: errMsg,
          ),
          initialChildren: children,
        );

  static const String name = 'ErrorRoute';

  static const _i10.PageInfo<ErrorRouteArgs> page =
      _i10.PageInfo<ErrorRouteArgs>(name);
}

class ErrorRouteArgs {
  const ErrorRouteArgs({
    this.key,
    required this.errMsg,
  });

  final _i11.Key? key;

  final String errMsg;

  @override
  String toString() {
    return 'ErrorRouteArgs{key: $key, errMsg: $errMsg}';
  }
}

/// generated route for
/// [_i7.TestSocialLoginPage]
class TestSocialLoginRoute extends _i10.PageRouteInfo<void> {
  const TestSocialLoginRoute({List<_i10.PageRouteInfo>? children})
      : super(
          TestSocialLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestSocialLoginRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.TestMethodChannelPage]
class TestMethodChannelRoute extends _i10.PageRouteInfo<void> {
  const TestMethodChannelRoute({List<_i10.PageRouteInfo>? children})
      : super(
          TestMethodChannelRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestMethodChannelRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.TestCounterPage]
class TestCounterRoute extends _i10.PageRouteInfo<void> {
  const TestCounterRoute({List<_i10.PageRouteInfo>? children})
      : super(
          TestCounterRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestCounterRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
