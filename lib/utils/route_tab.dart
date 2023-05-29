// SingleChildScrollView(
//   scrollDirection: Axis.horizontal,
//   child: Padding(
//     padding: const EdgeInsets.fromLTRB(8, 45, 8, 0),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: RouteType.values.map((route) {
//         final isSelected =
//             (routeTypeState.selectedRouteTypes.contains(route) &&
//                 !routeTypeState.selectedRouteTypes.contains(RouteType.All));
//         return CircularRouteButton(
//           routeType: route,
//           isSelected: isSelected,
//           onTap: () {
//             if (route == RouteType.All) {
//               routeTypeStateNotifier.clearRouteTypes();
//               routeTypeStateNotifier.addOrRemove(route);
//             } else {
//               routeTypeStateNotifier.addOrRemove(route);
//               routeTypeStateNotifier.removeRouteType(RouteType.All);
//             }
//           },
//         );
//       }).toList(),
//     ),
//   ),
// )
