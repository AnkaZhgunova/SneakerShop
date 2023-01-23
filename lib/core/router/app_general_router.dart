import 'package:flutter/cupertino.dart';
import 'package:sneakers_shop/presentation/export.dart';

class ApplicationGeneralRouter {
  static PageRouteBuilder<void> builder(Widget widget, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: Duration(microseconds: 300),
      reverseTransitionDuration: Duration(microseconds: 300),
      pageBuilder: (
        _,
        __,
        ___,
      ) =>
          widget,
      transitionsBuilder: (_, anim, __, child) {
        return FadeTransition(
          opacity: anim,
          child: child,
        );
      },
    );
  }

  static PageRouteBuilder<void> splashBuilder(
    Widget widget,
    RouteSettings settings,
  ) {
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: Duration(seconds: 1),
      reverseTransitionDuration: Duration(microseconds: 300),
      pageBuilder: (
        _,
        __,
        ___,
      ) =>
          widget,
      transitionsBuilder: (_, anim, __, child) {
        return FadeTransition(
          opacity: anim,
          child: child,
        );
      },
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable, prefer_final_locals
    dynamic data = settings.arguments;
    switch (settings.name) {
      case BottomBar.routeName:
        {
          return builder(
            BottomBar(
              initialIndex: data,
            ),
            settings,
          );
        }
      case DetailPage.routeName:
        {
          return builder(DetailPage(), settings);
        }

      default:
        return builder(Container(), settings);
    }
  }
}
