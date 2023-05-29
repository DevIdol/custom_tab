import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'utils/route_type.dart';
import 'utils/route_type_state.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Route Types',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeTypeState = ref.watch(routeTypeStateNotifierProvider);

    // Check if all other tabs are unselected
    final areOtherTabsUnselected = RouteType.values
        .where((route) => route != RouteType.All)
        .every((route) => !routeTypeState.selectedRouteTypes.contains(route));

    // Check if only RouteType.All is selected
    final isOnlyRouteTypeAllSelected =
        routeTypeState.selectedRouteTypes.length == 1 &&
            routeTypeState.selectedRouteTypes.contains(RouteType.All);

    // Update the state to meet the requirements
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (areOtherTabsUnselected && !isOnlyRouteTypeAllSelected) {
        ref.read(routeTypeStateNotifierProvider.notifier).clearRouteTypes();
        ref
            .read(routeTypeStateNotifierProvider.notifier)
            .addOrRemove(RouteType.All);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Route Types'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 45, 8, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: RouteType.values.map((route) {
              final isSelected =
                  routeTypeState.selectedRouteTypes.contains(route);
              return GestureDetector(
                onTap: () {
                  ref
                      .read(routeTypeStateNotifierProvider.notifier)
                      .toggleRouteType(route);
                },
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: isSelected
                        ? RouteTypeData.typeData[route]!.color
                        : Colors.white,
                  ),
                  child: Text(
                    RouteTypeData.typeData[route]!.routeName,
                    style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : RouteTypeData.typeData[route]!.color),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
