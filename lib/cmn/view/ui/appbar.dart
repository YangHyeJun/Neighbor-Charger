import 'package:flutter/material.dart';
import 'package:neighbor_chargers/cmn/manager/navigator.dart';

class NCAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NCAppBar({
    super.key,
    this.leading = false,
    required this.title,
    this.trailing,
  });

  final bool? leading;
  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          leading: leading == true
              ? IconButton(
            onPressed: () {
              navigatorKey.currentState?.pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          )
              : SizedBox.shrink(),
          title: Transform(
            transform: Matrix4.translationValues(-20.0, 0.0, 0.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            if (trailing != null) trailing!,
          ],
        ),
        // Expanded(
        //   child: Divider(
        //     height: 1,
        //     thickness: 1,
        //   ),
        // ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
