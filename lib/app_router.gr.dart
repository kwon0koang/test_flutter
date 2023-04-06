// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:test_flutter/src/pages/main/main_page.dart' as _i1;
import 'package:test_flutter/src/pages/test_counter/test_counter_page.dart'
    as _i2;
import 'package:test_flutter/src/pages/test_retrofit/test_retrofit_page.dart'
    as _i3;
import 'package:test_flutter/src/pages/test_retrofit2/test_retrofit2_page.dart'
    as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.MainPage(),
      );
    },
    TestCounterRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.TestCounterPage(),
      );
    },
    TestRetrofitRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.TestRetrofitPage(),
      );
    },
    TestRetrofit2Route.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.TestRetrofit2Page(),
      );
    },
  };
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i5.PageRouteInfo<void> {
  const MainRoute({List<_i5.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.TestCounterPage]
class TestCounterRoute extends _i5.PageRouteInfo<void> {
  const TestCounterRoute({List<_i5.PageRouteInfo>? children})
      : super(
          TestCounterRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestCounterRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.TestRetrofitPage]
class TestRetrofitRoute extends _i5.PageRouteInfo<void> {
  const TestRetrofitRoute({List<_i5.PageRouteInfo>? children})
      : super(
          TestRetrofitRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestRetrofitRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.TestRetrofit2Page]
class TestRetrofit2Route extends _i5.PageRouteInfo<void> {
  const TestRetrofit2Route({List<_i5.PageRouteInfo>? children})
      : super(
          TestRetrofit2Route.name,
          initialChildren: children,
        );

  static const String name = 'TestRetrofit2Route';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
