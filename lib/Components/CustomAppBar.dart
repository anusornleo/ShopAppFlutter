import 'package:flutter/material.dart';
import 'package:shopapp/Provider/MenuProvider.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(58);

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProvider>(
      builder: (context, menu, _) {
        return AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              menu.switchMenu();
              menu.setSide("left");
            },
          ),
          title: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            height: 58,
            onPressed: () {},
            child: Text(
              "Shopping",
              style: TextStyle(fontSize: 22),
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                menu.switchMenu();
                menu.setSide("right");
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
            )
          ],
        );
      },
    );
  }
}
