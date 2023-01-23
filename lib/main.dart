import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'internal/internal.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    Application(),
  );
}
