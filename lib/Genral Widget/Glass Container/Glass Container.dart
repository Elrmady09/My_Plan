import 'package:flutter/material.dart';
import 'dart:ui';

class Glass_Container extends StatelessWidget {
  const Glass_Container({Key? key, this.widget, this.width, this.height,}) : super(key: key);
  final Widget? widget;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
        child: Container(
          width: width ?? size.width * 0.3,
          height: height ?? size.height * 0.13,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              border: Border.all(
                  color: Colors.white.withOpacity(0.2), width: 2.5),
              borderRadius:
              const BorderRadius.all(Radius.circular(15))),
          child: widget,
        ),
      ),
    );
  }
}
