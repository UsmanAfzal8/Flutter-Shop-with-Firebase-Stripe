import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttershop/const/Icon.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

class Userscreen extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _UserscreenState createState() => _UserscreenState();
}

class _UserscreenState extends State<Userscreen> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "User Information",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Divider(thickness: 2.0),
            userListTile(0, context),
            userListTile(1, context),
            userListTile(2, context),
            userListTile(3, context),
            Text(
              "User Setting",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Divider(thickness: 2.0),
            ListTileSwitch(
              value: _value,
              leading: Icon(Icons.dark_mode),
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              },
              visualDensity: VisualDensity.comfortable,
              switchType: SwitchType.cupertino,
              switchActiveColor: Colors.black,
              title: Text('Dark'),
            ),
            userListTile(4, context),
          ],
        ),
      ),
    ));
  }

  List userListTileIcons = [
    MyIcon.Email,
    MyIcon.phone,
    MyIcon.shipping,
    MyIcon.Date,
    MyIcon.logout,
  ];

  List userListTileNames = [
    'Email',
    'Phone',
    'Shipping Address',
    'Date',
    'Logout',
  ];

  var userListSubTileNames = [
    '**********',
    '**********',
    '**********',
    '**********',
    '',
  ];

  Widget userListTile(int index, BuildContext context) {
    return Material(
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
          onTap: () {},
          leading: Icon(userListTileIcons[index]),
          title: Text(userListTileNames[index]),
          subtitle: Text(userListSubTileNames[index]),
        ),
      ),
    );
  }
}
