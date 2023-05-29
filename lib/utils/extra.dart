// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import 'utils/constants.dart';

// enum RouteType {
//   All,
//   A,
//   B,
//   C,
//   D,
//   E,
//   F,
// }

// class RouteTypeInfo {
//   final Color color;
//   final IconData iconData;
//   final int scrollIndex;
//   final String routeName;

//   RouteTypeInfo({
//     required this.color,
//     required this.iconData,
//     required this.scrollIndex,
//     required this.routeName,
//   });
// }

// class RouteTypeData {
//   static final Map<RouteType, RouteTypeInfo> typeData = {
//     RouteType.All: RouteTypeInfo(
//       color: Color(0xFF333333),
//       iconData: Icons.all_inclusive,
//       scrollIndex: 0,
//       routeName: 'All',
//     ),
//     RouteType.A: RouteTypeInfo(
//       color: AppColor.routeAOrange,
//       iconData: Icons.directions_bus,
//       scrollIndex: 1,
//       routeName: 'Route A',
//     ),
//     RouteType.B: RouteTypeInfo(
//       color: AppColor.routeBYellow,
//       iconData: Icons.directions_bus,
//       scrollIndex: 2,
//       routeName: 'Route B',
//     ),
//     RouteType.C: RouteTypeInfo(
//       color: AppColor.routeCGreen,
//       iconData: Icons.directions_bus,
//       scrollIndex: 3,
//       routeName: 'Route C',
//     ),
//     RouteType.D: RouteTypeInfo(
//       color: AppColor.routeDPurple,
//       iconData: Icons.directions_bus,
//       scrollIndex: 4,
//       routeName: 'Route D',
//     ),
//     RouteType.E: RouteTypeInfo(
//       color: AppColor.routeEDarkYellow,
//       iconData: Icons.directions_bus,
//       scrollIndex: 5,
//       routeName: 'Route E',
//     ),
//     RouteType.F: RouteTypeInfo(
//       color: AppColor.routeFBlue,
//       iconData: Icons.directions_bus,
//       scrollIndex: 6,
//       routeName: 'Route F',
//     ),
//   };
// }

// class CircularRouteButton extends StatelessWidget {
//   final RouteType routeType;
//   final bool isSelected;
//   final VoidCallback onTap;

//   const CircularRouteButton({
//     required this.routeType,
//     required this.isSelected,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final routeTypeInfo = RouteTypeData.typeData[routeType]!;
//     final selectedColor = routeTypeInfo.color;
//     const defaultColor = Colors.grey;

//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 80,
//         height: 80,
//         decoration: BoxDecoration(
//           color: isSelected ? selectedColor : defaultColor,
//           shape: BoxShape.circle,
//         ),
//         child: Icon(
//           routeTypeInfo.iconData,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }

// @immutable
// class RouteTypeState {
//   final Set<RouteType> selectedRouteTypes;

//   const RouteTypeState({required this.selectedRouteTypes});

//   RouteTypeState copyWith({Set<RouteType>? selectedRouteTypes}) {
//     return RouteTypeState(
//       selectedRouteTypes: selectedRouteTypes ?? this.selectedRouteTypes,
//     );
//   }

//   bool get isAllSelected => selectedRouteTypes.contains(RouteType.All);
// }

// final routeTypeStateNotifierProvider =
//     StateNotifierProvider<RouteTypeStateNotifier, RouteTypeState>(
//   (ref) => RouteTypeStateNotifier(),
// );

// class RouteTypeStateNotifier extends StateNotifier<RouteTypeState> {
//   RouteTypeStateNotifier()
//       : super(const RouteTypeState(selectedRouteTypes: {RouteType.All}));

//   void toggleRouteType(RouteType routeType) {
//     final selectedTypes = state.selectedRouteTypes;
//     final isSelected = selectedTypes.contains(routeType);

//     if (routeType == RouteType.All) {
//       if (isSelected) {
//         return;
//       } else {
//         state = const RouteTypeState(selectedRouteTypes: {RouteType.All});
//       }
//     } else {
//       final updatedTypes = isSelected
//           ? selectedTypes.difference({routeType})
//           : selectedTypes.union({routeType});

//       if (updatedTypes.contains(RouteType.All)) {
//         updatedTypes.remove(RouteType.All);
//       }

//       state = RouteTypeState(selectedRouteTypes: updatedTypes);
//     }
//   }
// }

// void main() {
//   runApp(ProviderScope(child: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Route App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: RoutePage(),
//     );
//   }
// }

// class RoutePage extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final selectedRouteTypes =
//         ref.watch(routeTypeStateNotifierProvider).selectedRouteTypes;
//     final isAllSelected = selectedRouteTypes.contains(RouteType.All);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Routes'),
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(8, 45, 8, 0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: RouteType.values.map((route) {
//               final isSelected =
//                   (selectedRouteTypes.contains(route) && !isAllSelected);
//               return CircularRouteButton(
//                 routeType: route,
//                 isSelected: isSelected,
//                 onTap: () {
//                   ref
//                       .read(routeTypeStateNotifierProvider.notifier)
//                       .toggleRouteType(route);
//                 },
//               );
//             }).toList(),
//           ),
//         ),
//       ),
//     );
//   }
// }
