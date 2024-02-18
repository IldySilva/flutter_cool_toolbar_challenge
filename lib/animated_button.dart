import 'package:flutter/material.dart';
import 'package:flutter_cool_toolbar_challenge/models/menu_item.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({super.key, required this.item});

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
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..forward();
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    super.initState();
  }

  double containerWidth = 65;
  Offset containerOffSet=const Offset(0, 0);
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: containerOffSet,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: UnconstrainedBox(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 65,
              width: containerWidth,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Card(
                  color: widget.item.color,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: GestureDetector(
                      onLongPressDown: (v) {
                        setState(() {
                          containerWidth = 65 * 2.5;
                          containerOffSet=const Offset(20, 0);
                        });
                      },
                      onLongPressEnd: (v) {
                        setState(() {
                          containerWidth = 65;
                          containerOffSet=const Offset(0, 0);

                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            widget.item.icon,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
