import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'route_type.dart';
import 'state.dart';

// Provider to manage the currently selected RouteType
final routeTypeStateNotifierProvider =
    StateNotifierProvider.autoDispose<RouteTypeStateNotifier, RouteTypeState>(
  (ref) {
    final notifier = RouteTypeStateNotifier();
    notifier.init();
    return notifier;
  },
);

class RouteTypeStateNotifier extends StateNotifier<RouteTypeState> {
  RouteTypeStateNotifier() : super(RouteTypeState());

  void init() {
    selectAllRouteTypes(); // Select all Route Types initially
    log('init');
  }

  void addOrRemove(RouteType routeType) {
    if (routeType == RouteType.All) {
      selectAllRouteTypes();
    } else {
      if (state.selectedRouteTypes.length == RouteType.values.length) {
        clearRouteTypes();
        _addRouteType(routeType);
        _updateAllRouteType();
      } else {
        final isSelected = state.selectedRouteTypes.contains(routeType);
        if (isSelected) {
          log('$routeType: remove');
          _removeRouteType(routeType);
        } else {
          log('$routeType: add');
          _addRouteType(routeType);
        }
        _updateAllRouteType();
      }
    }
  }

  void _removeRouteType(RouteType routeType) {
    final routeTypes = Set<RouteType>.of(state.selectedRouteTypes)
      ..remove(routeType);
    state = state.copyWith(selectedRouteTypes: routeTypes);
    log("Remove: $state");

    if (routeTypes.isEmpty) {
      selectAllRouteTypes();
    }
  }

  void _addRouteType(RouteType routeType) {
    final routeTypes = Set<RouteType>.from(state.selectedRouteTypes);
    routeTypes.add(routeType);

    // Remove all routes outside the selected range
    final minIndex =
        routeTypes.map((route) => route.index).reduce((a, b) => a < b ? a : b);
    final maxIndex =
        routeTypes.map((route) => route.index).reduce((a, b) => a > b ? a : b);
    final routesToRemove = RouteType.values
        .where((route) => route.index < minIndex || route.index > maxIndex);
    routeTypes.removeAll(routesToRemove);

    state = state.copyWith(selectedRouteTypes: routeTypes);
    log("Add: $state");
  }

  void _updateAllRouteType() {
    final allRouteType = RouteType.values
        .where((routeType) => routeType != RouteType.All)
        .every(state.selectedRouteTypes.contains);
    if (allRouteType) {
      _addRouteType(RouteType.All);
    } else {
      _removeRouteType(RouteType.All);
    }
  }

  void clearRouteTypes() {
    state = state.copyWith(selectedRouteTypes: {});
  }

  void selectAllRouteTypes() {
    state = state.copyWith(
        selectedRouteTypes: Set<RouteType>.from(RouteType.values));
    log("$state");
  }
}
