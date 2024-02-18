import 'package:flutter/material.dart';
import 'package:flutter_cool_toolbar_challenge/models/menu_item.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({super.key,required this.item});


  final IconItem item;
  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late Animation<double> _scaleAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this,duration: const Duration(milliseconds: 300))..forward();
  _scaleAnimation=Tween<double>(begin: 0.5,end: 1).animate(CurvedAnimation(parent: _animationController,curve: Curves.easeInOut));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SizedBox(
          height: 65,
          width: 65,
          child: ScaleTransition(scale: _scaleAnimation,
          child:  ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Card(
            color: widget.item.color,
                child: IconButton(onPressed: (){}, icon:  Icon(widget.item.icon,color: Colors.white,))),
          )),
        ),
      ),
    );
  }
}
