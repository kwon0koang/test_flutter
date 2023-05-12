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
    const itemLength = 10;
    const subItemLength = 300;
    return DefaultLayoutWidget(
      title: 'Test sliver list page',
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: itemLength,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    buildTestWidget(
                        '❤️ List #$index ========================================='),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: subItemLength,
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
                for (int i = 0; i <= itemLength; i++) ...[
                  SliverToBoxAdapter(
                    child: buildTestWidget(
                        '❤️ List #$i ========================================='),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: subItemLength,
                      (context, subIndex) {
                        return buildTestWidget(' - #$i-$subIndex');
                      },
                    ),
                  ),
                ]
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
