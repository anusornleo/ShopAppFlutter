import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Provider/MenuProvider.dart';

class MenuRight extends StatelessWidget {
  const MenuRight({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProvider>(
      builder: (context, menu, _) {
        return Container(
          color: Colors.red,
          width: 300,
          margin: EdgeInsets.only(top: 12, right: 0, left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Text(
                    "My Cart",
                    style: TextStyle(fontSize: 24),
                  ),
                  Icon(Icons.shopping_cart),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      menu.switchMenu();
                    },
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  color: Colors.green,
                  child: ListView.separated(
                      itemBuilder: (context, i) {
                        return Container(
                          height: 122,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              topLeft: Radius.circular(15)
                            ),
                          ),
                          child: Stack(children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/jpg/landscape3.jpg')
                                )
                              ),
                            )
                          ],),
                        );
                      },
                      separatorBuilder: (context, i) {
                        return SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: 5),
                ),
              ),
              Container(height: 130, color: Colors.orangeAccent)
            ],
          ),
        );
      },
    );
  }
}
