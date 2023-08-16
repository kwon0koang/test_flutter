import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_flutter/src/common/default_layout_widget.dart';
import 'package:test_flutter/src/common/enums.dart';
import 'package:test_flutter/src/const/gaps.dart';
import 'package:test_flutter/src/pages/test_social_login/login/google_login.dart';
import 'package:test_flutter/src/pages/test_social_login/login/kakao_login.dart';
import 'package:test_flutter/src/pages/test_social_login/login/social_login.dart';
import 'package:test_flutter/src/pages/test_social_login/test_social_login_view_model.dart';

@RoutePage()
class TestSocialLoginPage extends HookConsumerWidget {
  const TestSocialLoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncLoginStatus = ref.watch(loginStatusProvider);

    String userName = '';
    String profileImgUrl = '';

    asyncLoginStatus.whenData((loginModel) {
      if (loginModel.loginType == SocialLoginType.google) {
        userName = loginModel.googleUser?.displayName ?? '';
        profileImgUrl = loginModel.googleUser?.photoURL ?? '';
      } else if (loginModel.loginType == SocialLoginType.kakao) {
        userName = loginModel.kakaoUser?.kakaoAccount?.profile?.nickname ?? '';
        profileImgUrl =
            loginModel.kakaoUser?.kakaoAccount?.profile?.profileImageUrl ?? '';
      }
    });

    return DefaultLayoutWidget(
      title: '',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(userName),
            Image.network(
              profileImgUrl,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox.shrink();
              },
            ),
            _socialLogin(
              ref: ref,
              loginType: SocialLoginType.google,
            ),
            _socialLogin(
              ref: ref,
              loginType: SocialLoginType.kakao,
            ),
          ],
        ),
      ),
    );
  }

  Widget _socialLogin({
    required WidgetRef ref,
    required SocialLoginType loginType,
  }) {
    final loginStatusNotifier = ref.watch(loginStatusProvider.notifier);

    SocialLogin login;
    if (loginType == SocialLoginType.google) {
      login = GoogleLogin();
    } else if (loginType == SocialLoginType.kakao) {
      login = KakaoLogin();
    } else {
      return const SizedBox.shrink();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(loginType.name),
        gapW5,
        ElevatedButton(
          onPressed: () {
            loginStatusNotifier.login(login);
          },
          child: const Text('Login'),
        ),
        ElevatedButton(
          onPressed: () {
            loginStatusNotifier.logout(login);
          },
          child: const Text('Logout'),
        ),
        ElevatedButton(
          onPressed: () {
            loginStatusNotifier.disconnect(login);
          },
          child: const Text('Disconnect'),
        ),
      ],
    );
  }
}
