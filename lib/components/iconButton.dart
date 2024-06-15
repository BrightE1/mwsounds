import 'package:flutter/material.dart';

import '../model/const.dart';

class IconButtonWidget extends StatelessWidget {
  IconButtonWidget({
    Key? key,
    required this.iconX,
    this.onTap,
  }) : super(key: key);

  final IconData iconX;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: false,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: (() {}),
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(
            iconX,
            color: Colors.white,
          )),
    );
  }
}
