import 'package:flutter/material.dart';
import 'package:shopapp/Components/Carousel/Carousel.dart';
import 'package:shopapp/Components/CustomAppBar.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Provider/MenuProvider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: CustomAppBar(),
          body: Container(
            child: Column(
              children: [
                Carousel(),
              ],
            ),
          )),
    );
  }
}
