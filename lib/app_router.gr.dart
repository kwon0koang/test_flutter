// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;
import 'package:test_flutter/src/model/todo_model.dart' as _i17;
import 'package:test_flutter/src/pages/error/error_page.dart' as _i1;
import 'package:test_flutter/src/pages/main/main_page.dart' as _i2;
import 'package:test_flutter/src/pages/test_check_img_cors_error/test_check_img_cors_error_page.dart'
    as _i3;
import 'package:test_flutter/src/pages/test_counter/test_counter_page.dart'
    as _i4;
import 'package:test_flutter/src/pages/test_firebase_database/test_firebase_database_page.dart'
    as _i5;
import 'package:test_flutter/src/pages/test_isolate/test_isolate_page.dart'
    as _i6;
import 'package:test_flutter/src/pages/test_method_channel/test_method_channel_page.dart'
    as _i7;
import 'package:test_flutter/src/pages/test_retrofit/todo_detail_page.dart'
    as _i13;
import 'package:test_flutter/src/pages/test_retrofit/todo_list_page.dart'
    as _i14;
import 'package:test_flutter/src/pages/test_riverpod/test_riverpod_page.dart'
    as _i8;
import 'package:test_flutter/src/pages/test_sliver_list/test_sliver_list_page.dart'
    as _i9;
import 'package:test_flutter/src/pages/test_social_login/test_social_login_page.dart'
    as _i10;
import 'package:test_flutter/src/pages/test_socket/test_tcpsocket_page.dart'
    as _i11;
import 'package:test_flutter/src/pages/test_socket/test_websocket_page.dart'
    as _i12;

abstract class $AppRouter extends _i15.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    ErrorRoute.name: (routeData) {
      final args = routeData.argsAs<ErrorRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ErrorPage(
          key: args.key,
          errMsg: args.errMsg,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.MainPage(),
      );
    },
    TestCheckImgCorsErrorRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.TestCheckImgCorsErrorPage(),
      );
    },
    TestCounterRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.TestCounterPage(),
      );
    },
    TestFirebaseDatabaseRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.TestFirebaseDatabasePage(),
      );
    },
    TestIsolateRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.TestIsolatePage(),
      );
    },
    TestMethodChannelRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.TestMethodChannelPage(),
      );
    },
    TestRiverpodRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.TestRiverpodPage(),
      );
    },
    TestSliverListRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.TestSliverListPage(),
      );
    },
    TestSocialLoginRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.TestSocialLoginPage(),
      );
    },
    TestTcpSocketRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.TestTcpSocketPage(),
      );
    },
    TestWebSocketRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.TestWebSocketPage(),
      );
    },
    TodoDetailRoute.name: (routeData) {
      final args = routeData.argsAs<TodoDetailRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.TodoDetailPage(
          key: args.key,
          todoModel: args.todoModel,
        ),
      );
    },
    TodoListRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.TodoListPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ErrorPage]
class ErrorRoute extends _i15.PageRouteInfo<ErrorRouteArgs> {
  ErrorRoute({
    _i16.Key? key,
    required String errMsg,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          ErrorRoute.name,
          args: ErrorRouteArgs(
            key: key,
            errMsg: errMsg,
          ),
          initialChildren: children,
        );

  static const String name = 'ErrorRoute';

  static const _i15.PageInfo<ErrorRouteArgs> page =
      _i15.PageInfo<ErrorRouteArgs>(name);
}

class ErrorRouteArgs {
  const ErrorRouteArgs({
    this.key,
    required this.errMsg,
  });

  final _i16.Key? key;

  final String errMsg;

  @override
  String toString() {
    return 'ErrorRouteArgs{key: $key, errMsg: $errMsg}';
  }
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i15.PageRouteInfo<void> {
  const MainRoute({List<_i15.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i3.TestCheckImgCorsErrorPage]
class TestCheckImgCorsErrorRoute extends _i15.PageRouteInfo<void> {
  const TestCheckImgCorsErrorRoute({List<_i15.PageRouteInfo>? children})
      : super(
          TestCheckImgCorsErrorRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestCheckImgCorsErrorRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i4.TestCounterPage]
class TestCounterRoute extends _i15.PageRouteInfo<void> {
  const TestCounterRoute({List<_i15.PageRouteInfo>? children})
      : super(
          TestCounterRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestCounterRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i5.TestFirebaseDatabasePage]
class TestFirebaseDatabaseRoute extends _i15.PageRouteInfo<void> {
  const TestFirebaseDatabaseRoute({List<_i15.PageRouteInfo>? children})
      : super(
          TestFirebaseDatabaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestFirebaseDatabaseRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i6.TestIsolatePage]
class TestIsolateRoute extends _i15.PageRouteInfo<void> {
  const TestIsolateRoute({List<_i15.PageRouteInfo>? children})
      : super(
          TestIsolateRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestIsolateRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i7.TestMethodChannelPage]
class TestMethodChannelRoute extends _i15.PageRouteInfo<void> {
  const TestMethodChannelRoute({List<_i15.PageRouteInfo>? children})
      : super(
          TestMethodChannelRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestMethodChannelRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i8.TestRiverpodPage]
class TestRiverpodRoute extends _i15.PageRouteInfo<void> {
  const TestRiverpodRoute({List<_i15.PageRouteInfo>? children})
      : super(
          TestRiverpodRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestRiverpodRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i9.TestSliverListPage]
class TestSliverListRoute extends _i15.PageRouteInfo<void> {
  const TestSliverListRoute({List<_i15.PageRouteInfo>? children})
      : super(
          TestSliverListRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestSliverListRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i10.TestSocialLoginPage]
class TestSocialLoginRoute extends _i15.PageRouteInfo<void> {
  const TestSocialLoginRoute({List<_i15.PageRouteInfo>? children})
      : super(
          TestSocialLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestSocialLoginRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i11.TestTcpSocketPage]
class TestTcpSocketRoute extends _i15.PageRouteInfo<void> {
  const TestTcpSocketRoute({List<_i15.PageRouteInfo>? children})
      : super(
          TestTcpSocketRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestTcpSocketRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i12.TestWebSocketPage]
class TestWebSocketRoute extends _i15.PageRouteInfo<void> {
  const TestWebSocketRoute({List<_i15.PageRouteInfo>? children})
      : super(
          TestWebSocketRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestWebSocketRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i13.TodoDetailPage]
class TodoDetailRoute extends _i15.PageRouteInfo<TodoDetailRouteArgs> {
  TodoDetailRoute({
    _i16.Key? key,
    required _i17.TodoModel todoModel,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          TodoDetailRoute.name,
          args: TodoDetailRouteArgs(
            key: key,
            todoModel: todoModel,
          ),
          initialChildren: children,
        );

  static const String name = 'TodoDetailRoute';

  static const _i15.PageInfo<TodoDetailRouteArgs> page =
      _i15.PageInfo<TodoDetailRouteArgs>(name);
}

class TodoDetailRouteArgs {
  const TodoDetailRouteArgs({
    this.key,
    required this.todoModel,
  });

  final _i16.Key? key;

  final _i17.TodoModel todoModel;

  @override
  String toString() {
    return 'TodoDetailRouteArgs{key: $key, todoModel: $todoModel}';
  }
}

/// generated route for
/// [_i14.TodoListPage]
class TodoListRoute extends _i15.PageRouteInfo<void> {
  const TodoListRoute({List<_i15.PageRouteInfo>? children})
      : super(
          TodoListRoute.name,
          initialChildren: children,
        );

  static const String name = 'TodoListRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}
