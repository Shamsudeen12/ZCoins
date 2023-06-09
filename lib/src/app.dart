import 'package:flutter/material.dart';

import 'package:zcoins/src/constants/constants_export.dart';
import 'package:zcoins/src/routing/app_router.dart';
import 'package:zcoins/src/routing/guards/login_route_guard.dart';
import 'package:zcoins/src/utils/utils.dart';

class ZCoinsApp extends StatelessWidget {
  ZCoinsApp({super.key});

  final _appRouter = AppRouter(loginRouteGuard: LoginRouteGuard());

  @override
  Widget build(BuildContext context) {
    Utils.setDeviceOrientation();

    return MaterialApp.router(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: AppColours.colourPrimary,
        scaffoldBackgroundColor: AppColours.bgDarkMain,
        textTheme: ThemeData.dark().textTheme.apply(
              fontFamily: AppConstants.fontFamily,
            ),
        textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
      ),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
