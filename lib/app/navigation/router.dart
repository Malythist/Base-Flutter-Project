import 'package:go_router/go_router.dart';

import '../../features/_example/presentation/ui/example_screen.dart';
// Импортируйте ваши экраны здесь

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ExampleScreen(),
    ),

    // Пример экрана с аргументами
    /*
    GoRoute(
      path: '/details',
      builder: (context, state) {
        final arg = state.extra as MyArgumentType; // Получение аргументов через extra
        return DetailsScreen(arg: arg);
      },
    ),
    */
  ],
);