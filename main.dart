import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medical/Screens/Views/Screen1.dart';
import 'package:medical/firebase_options.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const Medics());
}

class Medics extends StatelessWidget {
  const Medics({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        
        home: Screen1(),
      );
    });
  }
}
