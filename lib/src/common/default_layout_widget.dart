import 'package:flutter/material.dart';

class DefaultLayoutWidget extends StatelessWidget {
  final Color? backgroundColor;
  final Widget child;
  final String? title;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;

  const DefaultLayoutWidget({
    required this.child,
    this.backgroundColor,
    this.title,
    this.bottomNavigationBar,
    this.floatingActionButton,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return SafeArea(
    //   child: Scaffold(
    //     backgroundColor: backgroundColor ?? Colors.white,
    //     appBar: renderAppBar(),
    //     body: SingleChildScrollView(
    //       scrollDirection: Axis.vertical,
    //       child: child,
    //     ),
    //     bottomNavigationBar: bottomNavigationBar,
    //     floatingActionButton: floatingActionButton,
    //   ),
    // );
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: renderAppBar(),
        body: child,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
      ),
    );
  }

  AppBar? renderAppBar() {
    if (title == null) {
      return null;
    } else {
      return AppBar(
        elevation: 0,
        title: Text(
          title!,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        foregroundColor: Colors.black,
      );
    }
  }
}
