import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'utils/route_type.dart';
import 'utils/route_type_state.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Route Types',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeTypeStateNotifier =
        ref.read(routeTypeStateNotifierProvider.notifier);
    final routeTypeState = ref.watch(routeTypeStateNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Route Types'),
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
              final isAllSelected =
                  routeTypeState.selectedRouteTypes.contains(RouteType.All);

              Color containerColor = Colors.white;
              if (isAllSelected && route == RouteType.All) {
                containerColor = RouteTypeData.typeData[RouteType.All]!.color;
              } else if (!isAllSelected && isSelected) {
                containerColor = RouteTypeData.typeData[route]!.color;
              }

              return GestureDetector(
                onTap: () {
                  routeTypeStateNotifier.addOrRemove(route);
                },
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: containerColor,
                  ),
                  child: Text(
                    RouteTypeData.typeData[route]!.routeName,
                    style: TextStyle(
                      color: isSelected
                          ? Colors.red
                          : RouteTypeData.typeData[route]!.color,
                    ),
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
