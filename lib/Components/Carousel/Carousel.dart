import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'PageCarousel.dart';

class Carousel extends StatefulWidget {
  const Carousel({
    Key key,
  }) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int currentIndex = 0;
  int length;

  @override
  void initState() {
    super.initState();
    length = loadData().length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map> listData = loadData();
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          child: PageView.builder(
            onPageChanged: (current) {
              setState(() {
                currentIndex = current;
              });
            },
            itemCount: listData.length,
            itemBuilder: (context, index) => PageCarousal(
              pathImage: listData[index]["pic"],
            ),
          ),
        ),
        SizedBox(
          height: 14,
        ),
        indicator()
      ],
    );
  }

  List<Map> loadData() {
    return [
      {"pic": "assets/jpg/landscape1.jpg"},
      {"pic": "assets/jpg/landscape2.jpg"},
      {"pic": "assets/jpg/landscape3.jpg"}
    ];
  }

  Widget indicator() {
    List<Widget> _listIndicator = [];

    for (int i = 0; i < loadData().length; i++) {
      _listIndicator.add(
        AnimatedContainer(
          duration: Duration(milliseconds: 100),
          width: (currentIndex == i) ? 24 : 10,
          height: 10,
          margin: EdgeInsets.only(left: (i == 0) ? 0 : 10),
          decoration: BoxDecoration(
            color: (currentIndex == i) ? Colors.blueGrey : Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }

    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _listIndicator,
      ),
    );
  }
}
