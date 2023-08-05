import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'controller/index_controller.dart';
import 'routes/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => IndexController()),
      ],
      builder: (context, widget) {
        return MaterialApp.router(
          restorationScopeId: 'app',
          key: RouteHelper.rootNavigatorKey,
          title: 'MoveMate',
          debugShowCheckedModeBanner: false,
          routerConfig: RouteHelper.goRouter,
          theme: ThemeData(fontFamily: GoogleFonts.sourceSansPro().fontFamily),
        );
      },
    );
  }
}
