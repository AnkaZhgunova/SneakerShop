import 'package:flutter/material.dart';
import 'package:sneakers_shop/core/router/app_general_router.dart';
import 'package:sneakers_shop/presentation/export.dart';

class Application extends StatefulWidget {
  static const String routeName = '/';

  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomBar(
        initialIndex: 0,
      ),
      onGenerateRoute: ApplicationGeneralRouter.generateRoute,
    );
  }
}
