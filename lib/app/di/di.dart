import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => getIt.init();

Provider<T> getItProvider<T extends Object>() => Provider(
      (ref) => getIt<T>(),
);