import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:o_kay_admin/constants/colors.dart'; // Updated import
import 'package:o_kay_admin/providers/authentication_provider.dart'; // Updated import
import 'package:o_kay_admin/providers/internet_provider.dart'; // Updated import
import 'package:o_kay_admin/router.dart'; // Updated import
import 'package:o_kay_admin/splash_screen/screens/splash_screen.dart'; // Updated import
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (context) => InternetProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'o_kay_admin', // Updated app title
        theme: ThemeData(
          // useMaterial3: true,
          colorScheme: scheme,
          scaffoldBackgroundColor: Colors.white,
          dialogBackgroundColor: Colors white,
          appBarTheme: const AppBarTheme(
            elevation: 0,
          ),
          unselectedWidgetColor: scheme.primary,
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: const SplashScreen(),
      ),
    );
  }
}
