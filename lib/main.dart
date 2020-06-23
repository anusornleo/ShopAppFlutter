import 'package:flutter/material.dart';
import 'package:shopapp/Components/ZoomScaffold.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Provider/MenuProvider.dart';

import 'Pages/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (_) => MenuProvider(),
        child: ZoomScaffold(),
      ),
    );
  }
}
