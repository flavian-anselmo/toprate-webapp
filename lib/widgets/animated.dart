import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedTxt extends StatelessWidget {
  const AnimatedTxt({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 30.0,
          fontFamily: 'Agne',
          color: Colors.blue,
        ),
        child: AnimatedTextKit(
          pause: const Duration(milliseconds: 10000),
          animatedTexts: [
            TypewriterAnimatedText('Toprate'),
          ],
        ),
      ),
    );
  }
}