import 'package:chatapp/helpers/widgets/CustomText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/AppColors.dart';

class Custombutton extends StatelessWidget {
  const Custombutton ({super.key, required this.onPressed, required this.widget, required this.color});
  final void Function() onPressed;
   final Widget widget;
   final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical:17),
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.all(Radius.circular(16)),
            side: BorderSide.none
          )
        ),
        onPressed: onPressed, child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget
      ],
    ));
  }
}
