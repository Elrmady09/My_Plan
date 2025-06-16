import 'package:flutter/material.dart';
import 'dart:ui';

class BackGroungHomeTask extends StatelessWidget {
  const BackGroungHomeTask({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C1760),

      body: Stack(
        children: [
          Positioned(
              left: -220,
              bottom: -200,
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xff8369de).withOpacity(0.1),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xff8369de),
                        spreadRadius: 90,
                        blurRadius: 100,
                      )
                    ]),
              )),
          Positioned(
              top: 130,
              left: 220,
              child: Container(
                width: 300,
                height: 300,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: [
                      Color(0xff744ff9),
                      Color(0xff8369de),
                      Color(0xff8da0cb)
                    ])),
              )),
          Positioned(
              bottom: 250,
              right: 150,
              child: Transform.rotate(
                angle: 8,
                child: Container(
                  width: 180,
                  height: 180,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [
                        Color(0xff744ff9),
                        Color(0xff8369de),
                        Color(0xff8da0cb)
                      ])),
                ),
              )),

        ],
      ),
    );
  }
}