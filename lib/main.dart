import 'package:app_hortifruti/app/core/theme/app_theme.dart';
import 'package:app_hortifruti/app/data/providers/api.dart';
import 'package:app_hortifruti/app/data/services/cart/cart_service.dart';
import 'package:app_hortifruti/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

void main() {
  Get.put<Api>(Api());
  Get.put<CartService>(CartService());

  Intl.defaultLocale = 'pt-BR';

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.dashboard,
      theme: themeData,
      // defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('pt', 'BR'),
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
    ),
  );
}
