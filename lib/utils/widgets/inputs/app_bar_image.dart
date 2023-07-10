import 'package:flutter/material.dart';

class CustomImageTitleAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;

  const CustomImageTitleAppBar({
    Key? key,
    this.bottom,
    this.backgroundColor,
  }) : super(key: key);

  @override
  State<CustomImageTitleAppBar> createState() => _CustomImageTitleAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomImageTitleAppBarState extends State<CustomImageTitleAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Image.asset('assets/images/logo/smile_api_intro.png'),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: widget.backgroundColor ?? Colors.transparent,
      automaticallyImplyLeading: false,
      bottom: widget.bottom,
    );
  }
}
