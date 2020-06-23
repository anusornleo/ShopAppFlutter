import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Pages/Home.dart';
import 'package:shopapp/Provider/MenuProvider.dart';

import 'MenuLeft.dart';
import 'MenuRight.dart';

class ZoomScaffold extends StatefulWidget {
  @override
  _ZoomScaffoldState createState() => _ZoomScaffoldState();
}

class _ZoomScaffoldState extends State<ZoomScaffold>
    with TickerProviderStateMixin {
  AnimationController _scaleController;
  Animation<double> _scale;
  bool showMenu = false;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _scale = Tween<double>(
      begin: 1.0,
      end: 0.7,
    ).animate(CurvedAnimation(parent: _scaleController, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    super.dispose();
    _scaleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProvider>(builder: (context, value, _) {
      if (value.showMenu == true) {
        _scaleController.forward();
      } else {
        _scaleController.reverse();
      }
      return Scaffold(
        body: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: value.side == "left"
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.end,
                children: [
                  value.side == "left" ? MenuLeft() : MenuRight(),
                ],
              ),
              ScaleTransition(
                scale: _scale,
                alignment: Alignment(value.side == "left" ? 4.5 : -4.5, 0),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(value.showMenu?30:0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey.withOpacity(.4),
                          offset: Offset(0,0),
                          spreadRadius: 0,
                          blurRadius: 30
                        )
                      ]),
                  child: GestureDetector(
                    onTap: (){
                      // ignore: unnecessary_statements
                      value.showMenu?value.switchMenu():null;
                    },
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(30),
                      child: Home(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
