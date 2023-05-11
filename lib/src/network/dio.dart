import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_flutter/src/common/log.dart';

part 'dio.g.dart';

@riverpod
Dio dio(DioRef ref) {
  var options = BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 3),
      receiveTimeout: const Duration(seconds: 3),
      baseUrl: "https://jsonplaceholder.typicode.com");

  final dio = Dio(options);

  if (kIsWeb) {
    dio.interceptors.add(TestInterceptor());
  }

  return dio;
}

class TestInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Log.d('[REQ] [${options.method}] ${options.uri}');

    return super.onRequest(options, handler);
    // super.onRequest(
    //   options.copyWith(
    //     path: 'https://api.codetabs.com/v1/proxy/?quest=${options.path}',
    //   ),
    //   handler,
    // );
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Log.d(
    //     '[RES] [${response.requestOptions.method}] ${response.requestOptions.uri}');

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    Log.d('[ERR] [${err.requestOptions.method}] ${err.requestOptions.uri}');

    return super.onError(err, handler);
    // // 401 에러가 날때 (status code)
    // // 토큰을 재발급 받는 시도를 한다.
    // // 토큰이 재발급되면, 다시 새로운 토큰으로 요청을 한다.
    // print('[ERR] [${err.requestOptions.method}] ${err.requestOptions.uri}');

    // final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);

    // // refreshToken 이 없으면
    // // 당연히 에러를 던진다.
    // if (refreshToken == null) {
    //   // 에러를 던질때는 handler.reject 를 사용한다.
    //   return handler.reject(err);
    // }

    // final isStatus401 = err.response?.statusCode == 401;
    // final isPathRefresh = err.requestOptions.path == '/auth/token';

    // if (isStatus401 && !isPathRefresh) {
    //   final dio = Dio();

    //   try {
    //     final res = await dio.post(
    //       'http://$ip/auth/token',
    //       options: Options(headers: {
    //         'authorization': 'Bearer $refreshToken',
    //       }),
    //     );
    //     final accessToken = res.data['accessToken'];

    //     final options = err.requestOptions;

    //     // 토큰 변경하기
    //     options.headers.addAll({
    //       'authorization': 'Bearer $accessToken',
    //     });

    //     await storage.write(key: ACCESS_TOKEN_KEY, value: accessToken);

    //     // 요청 재전송
    //     final response = await dio.fetch(options);

    //     return handler.resolve(response);
    //   } on DioError catch (e) {
    //     // on DioError : 오직 DioError 만!
    //     return handler.reject(e);
    //   }
    // }
    // return handler.reject(err);
  }
}
