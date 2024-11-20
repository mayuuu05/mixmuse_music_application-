import 'package:flutter/material.dart';
import 'package:mixmuse_music_application/provider/song_provider.dart';
import 'package:mixmuse_music_application/view/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>  SongProvider(),
      builder: (context, child) =>  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}