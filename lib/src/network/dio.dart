import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio.g.dart';

// final dioProvider = Provider<Dio>(
//   (ref) {
//     var options = BaseOptions(
//         receiveDataWhenStatusError: true,
//         connectTimeout: const Duration(seconds: 3),
//         receiveTimeout: const Duration(seconds: 3),
//         baseUrl: "https://jsonplaceholder.typicode.com");

//     return Dio(options);
//   },
// );

@riverpod
Dio dio(DioRef ref) {
  var options = BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 3),
      receiveTimeout: const Duration(seconds: 3),
      baseUrl: "https://jsonplaceholder.typicode.com");

  return Dio(options);
}
