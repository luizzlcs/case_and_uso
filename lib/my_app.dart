import 'package:case_and_uso/home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {

  const MyApp({ super.key });

   @override
   Widget build(BuildContext context) {
       return MaterialApp(
        title: 'Contador',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home:  HomePage(),
       );
       
  }
}



 
