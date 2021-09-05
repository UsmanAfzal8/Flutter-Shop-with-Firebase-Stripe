import 'package:flutter/material.dart';
import 'package:fluttershop/homeScreen/feedScreenextend.dart';
import 'package:fluttershop/provider/feedScreen.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late ScrollController _scrollController;
  late TextEditingController _searchTextController;
  final FocusNode _node = FocusNode();
  var top = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
    _searchTextController = TextEditingController();
    _searchTextController.addListener(() {
      setState(() {});
    });
  }

  void dispose() {
    super.dispose();
    _node.dispose();
    _searchTextController.dispose();
  }

  List _searchList = [];
  Widget build(BuildContext context) {
    final feederprovider = Provider.of<feedProvider>(context);
    List feederlist = feederprovider.FeedScreenprovider;
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                leading: BackButton(
                  color: Colors.black,
                ),
                centerTitle: true,
                title: Text(
                  'Search',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                expandedHeight: 100,
                floating: false,
                pinned: true,
                backgroundColor: Colors.orange.withOpacity(0.3),
              ),
              // SliverList(
              //     delegate: SliverChildBuilderDelegate(
              //   (context, index) => ListTile(title: Text('Item ')),
              //   childCount: 15,
              // ))
              SliverPadding(padding: EdgeInsets.only(bottom: 30)),
              SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return feedScreenExtend(
                        id: _searchList[index].id,
                        imageurl: _searchList[index].imageurl,
                        title: _searchList[index].name,
                        decription: _searchList[index].Decription,
                        price: _searchList[index].price,
                      );
                    },
                    childCount: _searchList.length,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    //crossAxisSpacing: 8,

                    childAspectRatio: 150 / 230,
                  ))
            ],
          ),
          _customtextfield(feederprovider),
        ],
      ),
    );
  }

  Widget _customtextfield(feedProvider feederprovider) {
    final double defaultTopMargin = 110;
    final double scaleStart = 80.0;
    final double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 1.0;
    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      top -= offset;
      if (offset < defaultTopMargin - scaleStart) {
        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        scale = 0.0;
      }
    }
    return Positioned(
      top: top,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: Container(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 0,
                blurRadius: 3,
              ),
            ],
          ),
          margin: EdgeInsets.only(left: 16, right: 16),
          child: TextField(
            cursorColor: Colors.red,
            controller: _searchTextController,
            minLines: 1,
            //focusNode: _node,
            autofocus: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: Icon(
                Icons.search,
              ),
              hintText: 'Search',
              filled: true,
              fillColor: Colors.white,
              suffixIcon: IconButton(
                onPressed: _searchTextController.text.isEmpty
                    ? null
                    : () {
                        _searchTextController.clear();
                        // _node.unfocus();
                      },
                icon: Icon(Icons.close,
                    color: _searchTextController.text.isEmpty
                        ? Colors.grey
                        : Colors.red),
              ),
            ),
            onChanged: (Value) {
              _searchTextController.text.toLowerCase();
              setState(() {
                _searchList = feederprovider.searchText(Value);
              });
            },
          ),
        ),
      ),
    );
  }
}
