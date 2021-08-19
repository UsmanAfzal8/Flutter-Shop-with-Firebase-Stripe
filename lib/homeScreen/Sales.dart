import 'package:flutter/material.dart';

class SalesItem extends StatelessWidget {
  List<Map<String, Object>> Items = [
    {
      'off': '50',
      'Name': 'Samsung Watch',
      'Image': 'assets/watch.png',
      'oldPrice': '1000',
      'CurrentPrice': '500',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      //color: Colors.black,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int Index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 180,
                width: 130,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(16)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(1, 0),
                      blurRadius: 4,
                    )
                  ],
                ),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 5),
                      child: Container(
                        height: 20,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.orange)),
                        child: Text(
                          Items[0]['off'].toString() + '% OFF',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.orange),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 5, left: 30, right: 20),
                      child: Container(
                        height: 70,
                        color: Colors.transparent,
                        child: Image(
                          image: AssetImage(Items[0]['Image'].toString()),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Samsung Watch'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          Text(
                            '\$' + Items[0]['CurrentPrice'].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '\$' + Items[0]['oldPrice'].toString(),
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
