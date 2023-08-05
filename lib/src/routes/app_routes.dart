import 'package:flutter/material.dart';

enum RouteGroup { admin, auth, none, web }

enum AppRoutes {
  splash(
    path: "/splash",
    name: "splash",
    navKey: GlobalObjectKey("splash"),
  ),

  shipHome(
    path: "/shipHome",
    name: "shipHome",
    navKey: GlobalObjectKey("shipHome"),
  ),
  shipCalculate(
    path: "/shipCalculate",
    name: "shipCalculate",
    navKey: GlobalObjectKey("shipCalculate"),
  ),
  shipShipment(
    path: "/shipShipment",
    name: "shipShipment",
    navKey: GlobalObjectKey("shipShipment"),
  ),
  shipProfile(
    path: "/shipProfile",
    name: "shipProfile",
    navKey: GlobalObjectKey("shipProfile"),
  ),
  shipCalculated(
    path: "/shipCalculated",
    name: "shipCalculated",
    navKey: GlobalObjectKey("shipCalculated"),
  );

  const AppRoutes(
      {required this.path,
      this.name,
      this.routeGroup = RouteGroup.none,
      this.subRoutes = const [],
      this.navKey});
  final String path;
  final String? name;
  final RouteGroup routeGroup;
  final List<AppRoutes> subRoutes;
  final GlobalObjectKey<NavigatorState>? navKey;

  factory AppRoutes.fromPath(String status) {
    return AppRoutes.values.firstWhere(
      (e) => e.path.endsWith(status),
      orElse: () => AppRoutes.shipHome,
    );
  }
}
