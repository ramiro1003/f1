import 'package:f1/constants.dart';
import 'package:f1/models/selected_data.dart';
import 'package:f1/screens/faceoff_screen.dart';
import 'package:f1/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
//Color(0xD20B09FF)
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SelectedData>(create: (_) => SelectedData()),
      ],
      child: MaterialApp(
        title: 'Formula 1 Face-off',
        theme: ThemeData.dark().copyWith(
          colorScheme: const ColorScheme.light(
              primary: kF1OfficialColor, secondary:Colors.black54),
          scaffoldBackgroundColor: Colors.black54,
        ),
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => const WelcomeScreen(),
          FaceoffScreen.id: (context) => const FaceoffScreen()
        },
      ),
    );
  }
}