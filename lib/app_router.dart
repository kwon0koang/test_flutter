import 'package:auto_route/auto_route.dart';
import 'package:test_flutter/app_router.gr.dart';

export 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(path: '/', page: MainRoute.page),
    AutoRoute(page: TestCounterRoute.page),
    AutoRoute(page: TodoListRoute.page),
    AutoRoute(page: TodoDetailRoute.page),
    AutoRoute(page: TestSliverListRoute.page),
    AutoRoute(page: TestMethodChannelRoute.page),
    AutoRoute(page: TestRiverpodRoute.page),
    AutoRoute(page: TestSocialLoginRoute.page),
    AutoRoute(page: TestFirebaseDatabaseRoute.page),
    AutoRoute(page: TestCheckImgCorsErrorRoute.page),
    AutoRoute(page: TestIsolateRoute.page),
    AutoRoute(
      page: ErrorRoute.page,
    ),
  ];
}
