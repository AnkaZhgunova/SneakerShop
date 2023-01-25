import 'package:get_it/get_it.dart';

import 'package:sneakers_shop/domain/bloc/export.dart';

class Injector {
  final GetIt _getIt = GetIt.instance;

  void init() {
    _getIt.registerLazySingleton<BagBloc>(
      () => BagBloc(),
    );
  }
}
