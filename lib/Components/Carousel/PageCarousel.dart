import 'package:flutter/material.dart';

class PageCarousal extends StatelessWidget {
  const PageCarousal({Key key, this.pathImage}) : super(key: key);

  final String pathImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          image: DecorationImage(
              image: AssetImage(pathImage),
              fit: BoxFit.cover)),
    );
  }
}
