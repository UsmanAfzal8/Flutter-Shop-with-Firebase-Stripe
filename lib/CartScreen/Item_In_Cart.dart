import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemInCart extends StatefulWidget {
  const ItemInCart({Key? key}) : super(key: key);

  @override
  _ItemInCartState createState() => _ItemInCartState();
}

class _ItemInCartState extends State<ItemInCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xf063970),
      appBar: AppBar(
        elevation: 0, centerTitle: true,
        title: Column(
          children: [
            Text(
              'My Cart',
              style: GoogleFonts.cuprum(
                  textStyle: TextStyle(
                color: Colors.black,
              )),
            ),
            Text(
              '1 items',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),

        //backgroundColor: Color(0xf063970),
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(
                  top: 16, left: 8.0, right: 8.0, bottom: 8.0),
              child: Stack(
                children: [
                  Container(
                    height: 140,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(children: [
                              Container(
                                height: 100,
                                width: MediaQuery.of(context).size.width * 0.35,
                                decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              Positioned(
                                top: 10,
                                left: 10,
                                right: 10,
                                child: Container(
                                  height: 80,
                                  width: 50,
                                  child: Image(
                                    image: AssetImage('assets/watch.png'),
                                  ),
                                ),
                              ),
                            ]),
                            Text(
                              ' Remove',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Samsung Watch",
                                  style: TextStyle(fontSize: 22),
                                ),
                                Text(
                                  "Branded watch from Samsung",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 17,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$600",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      height: 30,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          border:
                                              Border.all(color: Colors.black)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '1',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 22),
                                            ),
                                            Icon(Icons.expand_more),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Save For Later',
                                  style: TextStyle(
                                      color: Colors.orange,
                                      //fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
