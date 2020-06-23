import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Provider/MenuProvider.dart';

class MenuLeft extends StatelessWidget {
  const MenuLeft({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProvider>(
      builder: (context, menu, _) {
        return Container(
          color: Colors.white,
          width: 300,
          margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 74,
              ),
              Center(
                child: CircleAvatar(
                  maxRadius: 50,
                  backgroundImage: AssetImage("assets/jpg/landscape1.jpg"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                padding: EdgeInsets.only(left: 0),
                height: 60,
                minWidth: double.infinity,
                onPressed: () {},
                child: Text(
                  "Anusorn Mennakred",
                  style: TextStyle(fontSize: 22),
                ),
              ),
              tileCustom("Recommend"),
              tileCustom("New Product"),
              tileCustom("Recommend"),
              IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  menu.switchMenu();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Container tileCustom(String title) {
    return Container(
      height: 60,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[400]))),
      child: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
