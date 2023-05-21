import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_flutter/src/common/default_layout_widget.dart';
import 'package:test_flutter/src/pages/test_social_login/kakao_login.dart';
import 'package:test_flutter/src/pages/test_social_login/test_social_login_view_model.dart';

@RoutePage()
class TestSocialLoginPage extends HookConsumerWidget {
  const TestSocialLoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final kakaoLoginStatus = ref.watch(kakaoLoginStatusProvider);
    final kakaoLoginStatusNotifier =
        ref.read(kakaoLoginStatusProvider.notifier);

    final asyncKakaoLoginStatus = ref.watch(kakaoLoginStatusProvider);
    String profileImgUrl = '';
    asyncKakaoLoginStatus.whenData(
      (value) =>
          profileImgUrl = value?.kakaoAccount?.profile?.profileImageUrl ?? '',
    );

    return DefaultLayoutWidget(
      title: 'Test social login page',
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
                kakaoLoginStatusNotifier.login(KakaoLogin());
              },
              child: const Text('카카오 로그인'),
            ),
            ElevatedButton(
              onPressed: () {
                kakaoLoginStatusNotifier.logout(KakaoLogin());
              },
              child: const Text('카카오 로그아웃'),
            ),
            ElevatedButton(
              onPressed: () {
                kakaoLoginStatusNotifier.disconnect(KakaoLogin());
              },
              child: const Text('카카오 연결 끊기'),
            ),
          ],
        ),
      ),
    );
    // return DefaultLayoutWidget(
    //   title: 'Test social login page',
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
