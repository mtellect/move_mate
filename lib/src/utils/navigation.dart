import 'package:flutter/material.dart'; 

 pushAndResult(context, item,
    {result,
    opaque = false,
    bool dialog = false,
    bool replace = false,
    bool clear = false,
    bool fade = false,
    bool materialRoute = true,
    transitionBuilder,
    transitionDuration,
    bool hideTab = false}) {
  if (fade) transitionBuilder = fadeTransition;

  Route route = PageRouteBuilder(
      transitionsBuilder: transitionBuilder ?? slideTransition,
      transitionDuration:
          transitionDuration ?? const Duration(milliseconds: 30),
      opaque: opaque,
      pageBuilder: (context, _, __) {
        return item;
      });
  if (materialRoute) {
    route = MaterialPageRoute(builder: (c) => item);
  }

  if (dialog) {
    showDialog(
      context: context,
      useRootNavigator: true,
      barrierDismissible: true,
      // routeSettings: routeSettings,
      builder: (BuildContext context) {
        return item;
      },
    ).then((_) {
      if (_ == null) return;
      if (result != null) result(_);
    });
    return;
  }

  transitionDuration = const Duration(milliseconds: 800);

  if (clear) {
    Navigator.of(context, rootNavigator: hideTab)
        .pushAndRemoveUntil(route, (Route<dynamic> route) => false)
        .then((_) {
      if (_ != null) {
        if (result != null) result(_);
      }
    });
    return;
  }

  if (replace) {
    Navigator.of(context, rootNavigator: hideTab)
        .pushReplacement(route)
        .then((_) {
      if (_ != null) {
        if (result != null) result(_);
      }
    });
    return;
  }
  Navigator.of(context, rootNavigator: hideTab).push(route).then((_) {
    if (_ != null) {
      if (result != null) result(_);
    }
  });
}

Widget fadeTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return FadeTransition(
    opacity: animation,
    child: child,
  );
}

Widget slideTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  var begin = Offset(1.0, 0.0);
  var end = Offset.zero;
  var tween = Tween(begin: begin, end: end);
  var offsetAnimation = animation.drive(tween);

  return SlideTransition(
    position: offsetAnimation,
    child: child,
  );
}

 
 