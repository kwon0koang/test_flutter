import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_flutter/gen/assets.gen.dart';
import 'package:test_flutter/src/common/default_layout_widget.dart';

@RoutePage()
class TestSliverListPage extends HookConsumerWidget {
  const TestSliverListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayoutWidget(
      title: 'Test paging page',
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: 1000,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    buildTestWidget(
                        'List #$index ========================================='),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 1000,
                      itemBuilder: (context, subIndex) {
                        return buildTestWidget(' - #$index-$subIndex');
                      },
                    ),
                  ],
                );
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 1000,
                    (context, index) {
                      return Column(
                        children: [
                          buildTestWidget(
                              'List #$index ========================================='),
                          // todo kyk
                          // SliverList(
                          //   delegate: SliverChildBuilderDelegate(
                          //     childCount: 1000,
                          //     (context, subIndex) {
                          //       return buildTestWidget(' - #$index-$subIndex');
                          //     },
                          //   ),
                          // ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildTestWidget(String str) {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.svg.phoneIcon,
        ),
        Flexible(
          child: Text(
            str,
          ),
        ),
      ],
    );
  }
}
