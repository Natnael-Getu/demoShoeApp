import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../theme/custom_app_theme.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text(
        'Discover',
        style: AppThemes.homeAppBar,
      ),
      actions: const [
        Icon(
          CupertinoIcons.search,
          color: Colors.black,
          size: 20,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            CupertinoIcons.bell,
            color: Colors.black,
            size: 20,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
