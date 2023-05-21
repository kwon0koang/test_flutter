import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_flutter/src/pages/test_social_login/social_login.dart';

part 'test_social_login_view_model.g.dart';

@riverpod
class KakaoLoginStatus extends _$KakaoLoginStatus {
  @override
  FutureOr<User?> build() async {
    return null;
  }

  Future<void> login(SocialLogin socialLogin) async {
    final isLogined = await socialLogin.login();
    if (isLogined) {
      state = AsyncData(
        await UserApi.instance.me(),
      );
    }
  }

  Future<void> logout(SocialLogin socialLogin) async {
    socialLogin.logout();
    state = const AsyncData(null);
  }

  Future<void> disconnect(SocialLogin socialLogin) async {
    socialLogin.disconnect();
    state = const AsyncData(null);
  }
}
