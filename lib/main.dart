import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:saviorcare/views/styles/b_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controller/cubit/cubit/patient_cubit.dart';
import 'controller/theme.dart';
import 'controller/theme/them_notifier.dart';
import 'views/screens/startup/splash_log.dart';
import 'views/screens/startup/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences.getInstance().then((prefs) {
    var darkModeOn = prefs.getBool('darkMode') ?? true;
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) =>
                ThemeNotifier(darkModeOn ? darkTheme : lightTheme)),
      ],
      child: const MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    SharedPreferences.getInstance().then((prefs) {
      var darkModeOn = prefs.getBool('darkMode') ?? true;
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: darkModeOn ? KColor.darkBg : KColor.lightBg,
        systemNavigationBarColor: darkModeOn ? KColor.darkBg : KColor.lightBg,
      ));
    });

    return BlocProvider(
      create: (context) => PatientCubit(),
      child: MaterialApp(
          title: 'Patient Care',
          theme: themeNotifier.getTheme(),
          debugShowCheckedModeBanner: false,
          home: const SplashLog()
          // StreamBuilder(
          //   stream: FirebaseAuth.instance.authStateChanges(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return const SplashLog();
          //     } else {
          //       return const SplashScreen();
          //     }
          //   },
          // ),
          ),
    );
  }
}
