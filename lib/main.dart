import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ibms/utils/other/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: RouteSetting.navigatorKey,
      onGenerateTitle: (context) {
        return 'IBMS';
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale.fromSubtags(languageCode: 'en'),
        Locale.fromSubtags(languageCode: 'zh'),
      ],
      locale: const Locale("zh"),
      debugShowCheckedModeBanner: false,
      home: RouteSetting.routes[RouteSetting.LOGIN_PAGE_URL]!(context),
      onGenerateRoute: RouteSetting.onGenerateRoute,
      builder: (BuildContext context, Widget? child) {
        child = EasyLoading.init()(context, child);
        child = BotToastInit()(context, child);
        return child;
      },
    );
  }
}
