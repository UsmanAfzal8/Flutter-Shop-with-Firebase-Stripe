import 'package:flutter/material.dart';

class category extends StatelessWidget {
  List _categrios = [
    'Shoes',
    'Cloths',
    'Beauty',
    'Mobile',
    'watch',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: _categrios.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/CategoryfeedScreen',
                    arguments: _categrios[index]);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 70,
                  height: 70,
                  child: Text(
                    _categrios[index],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.black),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
