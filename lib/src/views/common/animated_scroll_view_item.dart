import 'package:flutter/material.dart';

class AnimatedScrollViewItem extends StatefulWidget {
  const AnimatedScrollViewItem({Key? key, required this.child, this.isFading = false})
      : super(key: key);

  final Widget child;
  final bool isFading;

  @override
  State<AnimatedScrollViewItem> createState() => _AnimatedScrollViewItemState();
}

class _AnimatedScrollViewItemState extends State<AnimatedScrollViewItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..forward();

    // _scaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(
    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isFading) {
      return FadeTransition(
        opacity: _scaleAnimation,
        child: widget.child,
      );
    }
    return ScaleTransition(
      scale: _scaleAnimation,
      child: widget.child,
    );
  }
}
