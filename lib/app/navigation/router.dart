import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/_example/presentation/ui/example_screen.dart';

// Указываем файл для генерации
part 'router.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

// Описываем дерево маршрутов через аннотации
@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ExampleScreen();
}

// Пример маршрута с параметрами
// @TypedGoRoute<DetailsRoute>(path: '/details/:id')
// class DetailsRoute extends GoRouteData {
//   final String id;
//   const DetailsRoute({required this.id});
//
//   @override
//   Widget build(BuildContext context, GoRouterState state) => DetailsScreen(id: id);
// }

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: const HomeRoute().location,
    // $appRoutes генерируется автоматически из аннотаций @TypedGoRoute
    routes: $appRoutes,
  );
});