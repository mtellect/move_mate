import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:move_mate/src/controller/index_controller.dart';
import 'package:move_mate/src/views/common/ship_buttom_nav.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final ValueNotifier<bool> isHidden = ValueNotifier(false);

class IndexPage extends StatelessWidget {
  const IndexPage({super.key, required this.navShell});
  final StatefulNavigationShell navShell;

  @override
  Widget build(BuildContext context) {
    late GoRouterState state = GoRouterState.of(context);
    int currentIndex = navShell.currentIndex;

    log("state ${state.fullPath}");

    final indexController = context.watch<IndexController>();
    final isTabVisible = indexController.isTabVisible;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 0, bottom: currentIndex > 0 ? 0 : 70),
            child: navShell,
          ),
          if (isTabVisible)
            ValueListenableBuilder(
              valueListenable: isHidden,
              builder: (context, value, child) {
                return IgnorePointer(
                  ignoring: value,
                  child: AnimatedOpacity(
                    opacity: currentIndex == 0 ? 1 : 0,
                    duration: Duration(milliseconds: 1200),
                    curve: Curves.ease,
                    onEnd: () {
                      isHidden.value = currentIndex != 0;
                      log("onEnd $value");
                    },
                    child: ShipButtomNav(
                        currentPage: currentIndex,
                        onTap: (index) {
                          // final shell = navShell.route.branches[index];
                          // final defaultRoute = shell.defaultRoute;
                          // final name = defaultRoute!.name;
                          // final path = defaultRoute.path;
                          // log("location name $name path $path");
                          // if (index != 0) {
                          //   context.go(path);
                          //   return;
                          // }
                          if (currentIndex == 3) return;
                          navShell.goBranch(
                            index,
                            initialLocation: index == navShell.currentIndex,
                          );
                        }),
                  ),
                );
              },
            )
        ],
      ),
    );
  }
}
