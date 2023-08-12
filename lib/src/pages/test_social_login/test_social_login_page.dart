import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_flutter/src/common/default_layout_widget.dart';
import 'package:test_flutter/src/pages/test_social_login/login/kakao_login.dart';
import 'package:test_flutter/src/pages/test_social_login/test_social_login_view_model.dart';

@RoutePage()
class TestSocialLoginPage extends HookConsumerWidget {
  const TestSocialLoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginStatusNotifier = ref.read(loginStatusProvider.notifier);

    final asyncLoginStatus = ref.watch(loginStatusProvider);
    String profileImgUrl = '';

    asyncLoginStatus.whenData(
      (user) =>
          profileImgUrl = user?.kakaoAccount?.profile?.profileImageUrl ?? '',
    );

    return DefaultLayoutWidget(
      title: '',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              profileImgUrl,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox.shrink();
              },
            ),
            ElevatedButton(
              onPressed: () {
                loginStatusNotifier.login(KakaoLogin());
              },
              child: const Text('카카오 로그인'),
            ),
            ElevatedButton(
              onPressed: () {
                loginStatusNotifier.logout(KakaoLogin());
              },
              child: const Text('카카오 로그아웃'),
            ),
            ElevatedButton(
              onPressed: () {
                loginStatusNotifier.disconnect(KakaoLogin());
              },
              child: const Text('카카오 연결 끊기'),
            ),
          ],
        ),
      ),
    );
    // return DefaultLayoutWidget(
    //   title: '',
    //   child: asyncKakaoLoginStatus.when(
    //     data: (data) {
    //       return Center(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Image.network(
    //               data?.kakaoAccount?.profile?.profileImageUrl ?? '',
    //             ),
    //           ],
    //         ),
    //       );
    //     },
    //     error: (error, stackTrace) {
    //       return const SizedBox.shrink();
    //     },
    //     loading: () {
    //       return const SizedBox.shrink();
    //     },
    //   ),
    // );
  }
}
