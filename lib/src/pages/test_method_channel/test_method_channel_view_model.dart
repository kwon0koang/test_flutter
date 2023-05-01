import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'test_method_channel_view_model.g.dart';

@riverpod
class PlatformVersion extends _$PlatformVersion {
  static const MethodChannel _channel =
      MethodChannel('com.example.test_flutter');

  @override
  FutureOr<String> build() async {
    return getPlatformVersion();
  }

  Future<String> getPlatformVersion() async {
    state = const AsyncLoading();
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
