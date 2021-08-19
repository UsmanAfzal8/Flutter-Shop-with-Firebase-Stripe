import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class Headeriamge extends StatefulWidget {
  const Headeriamge({Key? key}) : super(key: key);

  @override
  _HeaderiamgeState createState() => _HeaderiamgeState();
}

class _HeaderiamgeState extends State<Headeriamge> {
  List _iamges = [
    'assets/offer.png',
    'assets/offer2.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Swiper(
        itemCount: _iamges.length,
        autoplay: true,
        autoplayDelay: 10000,
        itemWidth: MediaQuery.of(context).size.width,
        itemHeight: 150.0,
        layout: SwiperLayout.TINDER,
        onTap: (index) {},
        itemBuilder: (BuildContext ctx, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(_iamges[index]), fit: BoxFit.fill),
              ),
            ),
          );
        },
      ),
    );
  }
}
