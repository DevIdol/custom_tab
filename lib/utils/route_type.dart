import 'package:flutter/material.dart';
import 'constants.dart';

enum RouteType {
  // ignore: constant_identifier_names
  All,
  A,
  B,
  C,
  D,
  E,
  F,
}

class RouteTypeInfo {
  final Color color;
  final IconData iconData;
  final int scrollIndex;
  final String routeName;

  RouteTypeInfo({
    required this.color,
    required this.iconData,
    required this.scrollIndex,
    required this.routeName,
  });
}

class RouteTypeData {
  static final Map<RouteType, RouteTypeInfo> typeData = {
    RouteType.All: RouteTypeInfo(
      color: Color(0xFF333333),
      iconData: Icons.all_inclusive,
      scrollIndex: 0,
      routeName: 'All',
    ),
    RouteType.A: RouteTypeInfo(
      color: AppColor.routeAOrange,
      iconData: Icons.directions_bus,
      scrollIndex: 1,
      routeName: 'Route A',
    ),
    RouteType.B: RouteTypeInfo(
      color: AppColor.routeBYellow,
      iconData: Icons.directions_bus,
      scrollIndex: 2,
      routeName: 'Route B',
    ),
    RouteType.C: RouteTypeInfo(
      color: AppColor.routeCGreen,
      iconData: Icons.directions_bus,
      scrollIndex: 3,
      routeName: 'Route C',
    ),
    RouteType.D: RouteTypeInfo(
      color: AppColor.routeDPurple,
      iconData: Icons.directions_bus,
      scrollIndex: 4,
      routeName: 'Route D',
    ),
    RouteType.E: RouteTypeInfo(
      color: AppColor.routeEDarkYellow,
      iconData: Icons.directions_bus,
      scrollIndex: 5,
      routeName: 'Route E',
    ),
    RouteType.F: RouteTypeInfo(
      color: AppColor.routeFBlue,
      iconData: Icons.directions_bus,
      scrollIndex: 6,
      routeName: 'Route F',
    ),
  };
}
