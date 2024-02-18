import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({super.key});

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}



class _AnimatedButtonState extends State<AnimatedButton> {

  late Animation<double> _scaleAnimation;
  late AnimationController _animationController;

  @override
  void initState() {


    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: SizedBox(
          height: 65,
          width: 65,
          child: ColoredBox(color: Colors.grey),
        ),
      ),
    );
  }
}
