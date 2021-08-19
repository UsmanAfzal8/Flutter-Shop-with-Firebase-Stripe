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
  late ScrollController _scrollController;
  var top = 0.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              centerTitle: true,
              backgroundColor: Colors.black,
              title: Text('User Screen'),
              expandedHeight: 200,
              elevation: 4,
              pinned: true,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image(
                    fit: BoxFit.fill, image: AssetImage("assets/usman.jpg")),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: const Color(0xf063970),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 20.0, bottom: 10.0),
                  child: Stack(
                    children: [
                      Container(
                        //margin: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(36),
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "  \nUser Information",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Divider(thickness: 2.0),
                            userListTile(0, context),
                            userListTile(1, context),
                            userListTile(1, context),
                            userListTile(1, context),
                            userListTile(1, context),
                            userListTile(1, context),
                            userListTile(1, context),
                            userListTile(2, context),
                            userListTile(3, context),
                            Center(
                              child: Text(
                                "  \nUser Setting",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
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
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        _buildFab(),
      ],
    ));
  }

  Widget _buildFab() {
    //starting fab position
    final double defaultTopMargin = 200.0 - 4.0;
    //pixels from top where scaling should start
    final double scaleStart = 160.0;
    //pixels from top where scaling should end
    final double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 1.0;
    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      top -= offset;
      if (offset < defaultTopMargin - scaleStart) {
        //offset small => don't scale down
        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        //offset between scaleStart and scaleEnd => scale down
        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        //offset passed scaleEnd => hide fab
        scale = 0.0;
      }
    }

    return Positioned(
      top: top,
      right: 16.0,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: FloatingActionButton(
          heroTag: "btn1",
          onPressed: () {},
          child: Icon(Icons.camera_alt_outlined),
        ),
      ),
    );
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
      color: Colors.white,
      borderRadius: BorderRadius.circular(36),
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
