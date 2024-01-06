import 'package:flutter/material.dart';

typedef ChildBuilder = Widget Function(int Index, BuildContext context);


typedef OnpageChnageCallback = void Function(int index);

class AnimationPages extends StatelessWidget {
  final PageController pageController;
  final double pagevalue;
  final ChildBuilder child;
  final int pageCount;
  final OnpageChnageCallback onpageChnageCallback;
  const AnimationPages({
    super.key,
    required this.pageController,
    required this.pagevalue,
    required this.child,
    required this.pageCount,
    required this.onpageChnageCallback,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      onPageChanged: onpageChnageCallback,
      physics: const ClampingScrollPhysics(),
      itemCount: pageCount,
      itemBuilder: (context, index) {
        if (index == pagevalue.floor() + 1 || index == pagevalue.floor() + 2) {
          return Transform.translate(
            offset: Offset(0.0, 100 * (index - pagevalue)),
            child: child(index, context),
          );
        } else if (index == pagevalue.floor() ||
            index == pagevalue.floor() - 1) {
          return Transform.translate(
              offset: Offset(0.0, 100 * (pagevalue - index)),    child: child(index, context),);
        } else {
          return child(index, context);
        }
      },
    );
  }
}
