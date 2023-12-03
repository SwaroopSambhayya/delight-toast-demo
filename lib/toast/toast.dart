import 'package:delightful_toast_app/toast/utils/mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DelightToast extends StatefulWidget {
  const DelightToast({super.key});

  @override
  State<DelightToast> createState() => _DelightToastState();
}

class _DelightToastState extends State<DelightToast> {
  bool onClicked = false;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            if (count < demoToastBars.length) {
              demoToastBars[count].show(context);
              count++;
            }
            setState(() {
              onClicked = true;
            });
            await Future.delayed(const Duration(milliseconds: 300), () {
              setState(() {
                onClicked = false;
              });
            });
          },
          child: const Text(
            "TOAST!",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ).animate(target: onClicked ? 1 : 0).scaleXY(
              begin: 1,
              end: 0.94,
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 100),
            ),
      ),
    );
  }
}
