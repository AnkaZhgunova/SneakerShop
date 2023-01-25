import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sneakers_shop/domain/bloc/export.dart';
import 'package:sneakers_shop/presentation/export.dart';

import 'core/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  Injector().init();
  runApp(
    Application(),
  );
}

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BagBloc>(
      create: (context) => GetIt.I.get(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomBar(
          initialIndex: 0,
        ),
      ),
    );
  }
}
