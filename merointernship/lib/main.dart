import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merointernship/widgets/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'utils/authenticationservice.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // We're using the manual installation on non-web platforms since Google sign in plugin doesn't yet support Dart initialization.
  // See related issue: https://github.com/flutter/flutter/issues/96391
  if (!kIsWeb) {
    await Firebase.initializeApp();
  } else {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyCL8hOhPkZHH3_lox3dAueo5BEhTeuR7S8',
        appId: '1:389028409833:web:e887ea2edd46568e7c5b78',
        messagingSenderId: '389028409833',
        projectId: 'merointernship-239b7',
        authDomain: 'merointernship-239b7.firebaseapp.com',
        databaseURL: 'https://react-native-firebase-testing.firebaseio.com',
        storageBucket: 'merointernship-239b7.appspot.com',
        measurementId: 'G-VW04JWFRB1',
      ),
    );
  }

  //await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(
    MyGetMaterialApp(),
  );
}

class MyGetMaterialApp extends StatelessWidget {
  const MyGetMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
      ],
      child: GetMaterialApp(
        theme: a,
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

ThemeData a = ThemeData.light();
