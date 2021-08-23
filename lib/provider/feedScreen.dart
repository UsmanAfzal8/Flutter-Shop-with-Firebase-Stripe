import 'package:flutter/cupertino.dart';
import 'package:fluttershop/feedsScreen/feeddatabase.dart';

class feedProvider with ChangeNotifier {
  List<feedScreendatabase> _feeditems = [
    feedScreendatabase(
        '1',
        'Smart Watch',
        'Gen 5E Smartwatch Black Stainless Steel',
        'assets/watch2.png',
        100,
        'watch',
        0,
        false,
        true,
        0),
    feedScreendatabase('2', 'Nike Shoes', 'Nike Zoom Fly Flyknit Running Shoe',
        'assets/shoes.png', 170, 'shoes', 0, false, false, 0),
    feedScreendatabase('3', 'Bata shoes', 'Bata Running Shoes',
        'assets/shoes2.png', 60, 'shoes', 0, false, false, 0),
    feedScreendatabase(
        '4',
        'Iphone 12 Pro ',
        '5G transforms iPhone with accelerated wireless speeds and better performance on congested networks.5 Now you can download huge files on the go or stream high-quality HDR movies. Without. All. The. Lag. iPhone also has the most 5G bands of any smartphone so you get 5G in more places. And all that speed opens up amazing possibilities for the future of apps.',
        'assets/mobile1.png',
        999,
        'mobile',
        0,
        false,
        true,
        0),
    feedScreendatabase(
        '5',
        'Pixel 5a',
        'Beautiful moments,captured beautifully Its the brilliant Pixel camera, now with an ultrawide lens,and new goodies that help you shoot and edit like the pros',
        'assets/mobile2.png',
        599,
        'mobile',
        0,
        false,
        true,
        0),
    feedScreendatabase(
        '6',
        'Teen Boys Clothing',
        'Teen Boys Clothing Sets Summer Boys Clothes Casual Outfit Kids Tracksuit For Boys Sport Suit',
        'assets/cloth.png',
        25,
        'cloths',
        0,
        false,
        false,
        0),
    feedScreendatabase(
        '7',
        'Yves Saint Laurent Mon Paris',
        'Like an indulgent French dessert, Mon Paris has just the right amount of sweet. Red berries and pear intermingle with lush, rich ingredients like white musk, patchouli, and — how fabulous does this sound? — crystal moss. The result: a luminous, sexy scent.',
        'assets/beauty1.png',
        200,
        'beauty',
        0,
        false,
        false,
        0),
    feedScreendatabase(
        '8',
        'Marc Jacobs Daisy',
        'Though the name of this scent makes it sound like it was made for the younger crowd, inside this quirky bottle is an artistic feat. The blend of wild strawberry, violet, gardenia, and jasmine somehow always feels light and airy — even after multiple spritzes. A decade on, perfumers are still scratching their heads.',
        'assets/beauty2.png',
        100,
        'beauty',
        0,
        false,
        true,
        0),
  ];
  List get FeedScreenprovider {
    return _feeditems;
  }

  List get TopViewed {
    return _feeditems.where((element) => element.isPopular).toList();
  }

  List findByCategory(String categoryname) {
    List _categoryList = _feeditems
        .where((element) => element.productcategoryname
            .toLowerCase()
            .contains(categoryname.toLowerCase()))
        .toList();
    return _categoryList;
  }

  List findByID(String categoryid) {
    List _IDList = _feeditems
        .where((element) => element.id.toString().contains(categoryid))
        .toList();
    return _IDList;
  }
}
