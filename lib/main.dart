import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:ecommerce/src/rutes/rutes.dart';
import 'package:ecommerce/src/blocs/blocs_provider.dart';
import 'package:ecommerce/src/pages/rute_error_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
}

class MyApp extends StatelessWidget {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
    //     .copyWith(statusBarColor: Colors.teal));
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        // statusBarColor: Colors.teal,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark
        //statusBarBrightness: Brightness.dark
        ));

    return BlocProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'), // English, no country code
          const Locale('es', 'ES'), // Hebrew, no country code
        ],
        title: 'E-Commerce',
        initialRoute: '/',
        routes: getAppRoutes(),
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (BuildContext context) => FatalErrorPage()
        ),
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            actionsIconTheme: IconThemeData(color: Colors.black),
            color: Colors.white,
            textTheme: TextTheme(headline6: TextStyle(color: Colors.black, fontSize: 25)),
            iconTheme: IconThemeData(color: Colors.black, size: 35)
          )
        ),
      )
    );
  }
}
