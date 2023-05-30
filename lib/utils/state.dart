import 'package:freezed_annotation/freezed_annotation.dart';
import 'route_type.dart';
part 'state.freezed.dart';

@freezed
class RouteTypeState with _$RouteTypeState {
  const factory RouteTypeState({
    @Default({RouteType.All}) Set<RouteType> selectedRouteTypes,
  }) = _RouteTypeState;
}