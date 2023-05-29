import 'package:flutter/material.dart';

enum RouteType { All, A, B, C, D, E, F }

class RouteTypeInfo {
  final Color color;
  final String routeName;

  const RouteTypeInfo({
    required this.color,
    required this.routeName,
  });
}

class RouteTypeData {
  static final Map<RouteType, RouteTypeInfo> typeData = {
    RouteType.All: const RouteTypeInfo(color: Colors.black, routeName: 'All'),
    RouteType.A:
        const RouteTypeInfo(color: Colors.orange, routeName: 'Route A'),
    RouteType.B:
        const RouteTypeInfo(color: Colors.yellow, routeName: 'Route B'),
    RouteType.C: const RouteTypeInfo(color: Colors.green, routeName: 'Route C'),
    RouteType.D:
        const RouteTypeInfo(color: Colors.purple, routeName: 'Route D'),
    RouteType.E: const RouteTypeInfo(color: Colors.amber, routeName: 'Route E'),
    RouteType.F: const RouteTypeInfo(color: Colors.blue, routeName: 'Route F'),
  };
}
