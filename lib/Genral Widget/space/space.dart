import 'package:flutter/material.dart';
class HeightSpace extends StatelessWidget {
  const HeightSpace({Key? key, required this.space}) : super(key: key);
  final double space;

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return SizedBox(height: size.height * space,);
  }
}


class WidthSpace extends StatelessWidget {
  const WidthSpace({Key? key, required this.space}) : super(key: key);
  final double space;

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return SizedBox(width: size.width * space,);
  }
}
