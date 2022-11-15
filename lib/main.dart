import 'package:flutter/material.dart';
import 'package:posts/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

import 'views/home_view.dart';

void main() async {
  runApp(
    (MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewmodel()),
      ],
      child: const MyApp(),
    )),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Posts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeView(),
    );
  }
}
