import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Animated_Text extends StatefulWidget {
  const Animated_Text({Key? key}) : super(key: key);

  @override
  _Animated_TextState createState() => _Animated_TextState();
}

class _Animated_TextState extends State<Animated_Text> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3));
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      totalRepeatCount: 1,
      animatedTexts: [
        FadeAnimatedText('do IT!'),
        FadeAnimatedText('do IT Right!'),
        FadeAnimatedText('do IT Right Now!'),
      ],
    );
  }
}
