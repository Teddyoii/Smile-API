import 'package:flutter/material.dart';
import 'package:smile_api_new/gameService.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget titleWidget;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final List<Widget>? actions;
  const CustomAppBar({
    Key? key,
    this.title,
    this.titleWidget = const SizedBox(),
    this.leading,
    this.automaticallyImplyLeading = true,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(      
      title: title == null ? titleWidget : Text(
        title ?? "",
        style: TextStyle(
          fontSize: 16,
          color: Theme.of(context).colorScheme.onBackground,
        )
      ),
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leading: leading ?? (automaticallyImplyLeading ? Center(
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          onTap: ()  {
            gameLevel = 1;
            Navigator.pop(context);
          } ,
          child: Icon(
            Icons.arrow_back_ios_new_rounded, 
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ) : null),
      actions: actions,
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
