import 'package:flutter/material.dart';
import 'package:sneakers_app/theme/custom_app_theme.dart';

AppBar customDetailViewAppBar(BuildContext context) {
  return AppBar(
    title: const Text(
      'Nike',
      style: AppThemes.detailsAppBar,
    ),
    centerTitle: true,
    actions: const [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Icon(
          Icons.favorite_border,
          color: Colors.white,
        ),
      )
    ],
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    ),
  );
}
