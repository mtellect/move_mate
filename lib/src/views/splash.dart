import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:move_mate/src/routes/app_routes.dart';
import 'package:move_mate/src/utils/colors.dart';
import 'package:move_mate/src/utils/custom_assets.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, value: 0, duration: Duration(seconds: 3));
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
    _controller.forward();
    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        context.goNamed(AppRoutes.shipHome.name!);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kIsWeb ? Colors.white : primaryColor400,
      child: ScaleTransition(
        scale: _animation,
        alignment: Alignment.center,
        child: Center(
          child: Image.asset(
            CustomAssets.move,
            height: 150,
            width: 280,
          ),
        ),
      ),
    );
  }
}
