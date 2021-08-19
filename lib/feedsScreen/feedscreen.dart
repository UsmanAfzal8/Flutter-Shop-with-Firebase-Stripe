import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class feedScreen extends StatefulWidget {
  const feedScreen({Key? key}) : super(key: key);

  @override
  _feedScreenState createState() => _feedScreenState();
}

class _feedScreenState extends State<feedScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Container(
        height: 250,
        width: 200,
        decoration: BoxDecoration(
          color: Color(0xf063970),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 150,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.blue,
                      image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage('assets/watch.png'))),
                ),
                Container(
                  height: 30,
                  width: 45,
                  child: Text(
                    'New',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.oswald(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 0,
                        offset: Offset(2, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 5),
              child: Text(
                ' Samsung Watch',
                style: GoogleFonts.lato(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 5),
              child: Text(
                ' Decription',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 3, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ' Price : ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ' \$ 500',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
