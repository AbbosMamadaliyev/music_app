import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:music_app/ui/auto_biography_page/autobiography_model.dart';
import 'package:music_app/ui/home_page/home_page.dart';
import 'package:music_app/ui/home_page/home_page_model.dart';
import 'package:music_app/ui/music_playing_page/music_playing_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => MusicPlayingModel(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => HomePageModel(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => AutobiographyModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  color: Color(0xff091227),
                  elevation: 0,
                ),
                scaffoldBackgroundColor: Color(0xff091227),
              ),
              home: const HomePage(),
            );
          },
        );
      },
    );
  }
}
