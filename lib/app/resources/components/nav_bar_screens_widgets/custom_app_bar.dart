import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
    this.trailing,
  });

  final Widget title;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.white,
      elevation: 4,
      backgroundColor: Colors.white,
      title:title,
      centerTitle: true,
      leading: leading,
      actions: [
        if (trailing != null) ...[
          trailing!,
          const SizedBox(width: 10),

        ],
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
