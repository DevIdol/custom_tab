import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'route_type.dart';

@immutable
class RouteTypeState {
  final Set<RouteType> selectedRouteTypes;

  const RouteTypeState({required this.selectedRouteTypes});

  RouteTypeState copyWith({Set<RouteType>? selectedRouteTypes}) {
    return RouteTypeState(
      selectedRouteTypes: selectedRouteTypes ?? this.selectedRouteTypes,
    );
  }
}

final routeTypeStateNotifierProvider =
    StateNotifierProvider<RouteTypeStateNotifier, RouteTypeState>(
  (ref) => RouteTypeStateNotifier(),
);

class RouteTypeStateNotifier extends StateNotifier<RouteTypeState> {
  RouteTypeStateNotifier()
      : super(const RouteTypeState(selectedRouteTypes: {}));

  void toggleRouteType(RouteType routeType) {
    final selectedTypes = state.selectedRouteTypes;

    if (routeType == RouteType.All) {
      state = const RouteTypeState(selectedRouteTypes: {RouteType.All});
    } else {
      final updatedSelectedRouteTypes = selectedTypes.contains(routeType)
          ? selectedTypes.difference({routeType})
          : selectedTypes.union({routeType});

      state = RouteTypeState(selectedRouteTypes: updatedSelectedRouteTypes);

      if (updatedSelectedRouteTypes.length > 1 ||
          (updatedSelectedRouteTypes.length == 1 &&
              updatedSelectedRouteTypes.contains(RouteType.All))) {
        state = RouteTypeState(
            selectedRouteTypes:
                updatedSelectedRouteTypes.difference({RouteType.All}));
      }
    }
  }

  void clearRouteTypes() {
    state = const RouteTypeState(selectedRouteTypes: {});
  }

  void addOrRemove(RouteType routeType) {
    final selectedTypes = state.selectedRouteTypes;
    final isSelected = selectedTypes.contains(routeType);

    if (isSelected) {
      final updatedTypes = selectedTypes.difference({routeType});
      state = RouteTypeState(selectedRouteTypes: updatedTypes);
    } else {
      final updatedTypes = selectedTypes.union({routeType});
      state = RouteTypeState(selectedRouteTypes: updatedTypes);
    }
  }
}
