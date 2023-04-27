import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'test_paging_view_model.g.dart';

@riverpod
String test(TestRef ref) {
  return '';
}


// @riverpod
// Future<TodoModel> fetchTodo(FetchTodoRef ref, int postId) {
//   // some logs for monitoring purposes
//   print('init: fetchPost($postId)');
//   ref.onCancel(() => print('cancel: fetchPost($postId)'));
//   ref.onResume(() => print('resume: fetchPost($postId)'));
//   ref.onDispose(() => print('dispose: fetchPost($postId)'));
//   // get the [KeepAliveLink]
//   final link = ref.keepAlive();
//   // a timer to be used by the callbacks below
//   Timer? timer;
//   // An object from package:dio that allows cancelling http requests
//   final cancelToken = CancelToken();
//   // When the provider is destroyed, cancel the http request and the timer
//   ref.onDispose(() {
//     timer?.cancel();
//     cancelToken.cancel();
//   });
//   // When the last listener is removed, start a timer to dispose the cached data
//   ref.onCancel(() {
//     // start a 30 second timer
//     timer = Timer(const Duration(seconds: 30), () {
//       // dispose on timeout
//       link.close();
//     });
//   });
//   // If the provider is listened again after it was paused, cancel the timer
//   ref.onResume(() {
//     timer?.cancel();
//   });
//   // Fetch our data and pass our `cancelToken` for cancellation to work
//   return ref
//       .watch(postsRepositoryProvider)
//       .fetchPost(postId, cancelToken: cancelToken);
// }
