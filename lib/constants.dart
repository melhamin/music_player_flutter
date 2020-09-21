import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'models.dart';


final Color kPrimaryColor = Hexcolor('#FFA5A0');
final Color kShadowColor = Hexcolor('#F2C8D5');


final List<Music> FAVORITES = [
  Music(
    title: 'The Rain Dance',
    singer: 'Kiara',
    duration: Duration(seconds: 60),
    asset: 'assets/images/favorite1.png'    
  ),
  Music(
    title: 'Outsider',
    singer: 'Edward',
    duration: Duration(minutes: 4),
    asset: 'assets/images/favorite2.png'    
  ),
  Music(
    title: 'Into The Sea',
    singer: 'Hanna',
    duration: Duration(minutes: 5) + Duration(seconds: 10),
    asset: 'assets/images/favorite3.png'    
  ),
  
];

final List<Music> LATEST = [
  Music(
    title: 'Sweetener',
    singer: 'Ariana Grande',
    duration: Duration(minutes: 4) + Duration(seconds: 40),
    asset: 'assets/images/latest1.png'    
  ),
  Music(
    title: 'Youngblood',
    singer: '5 Seconds of Summer',
    duration: Duration(minutes: 4) + Duration(seconds: 20),
    asset: 'assets/images/latest2.png'    
  ),
  Music(
    title: 'Golden Hour',
    singer: 'Kacey Musgraves',
    duration: Duration(minutes: 3) + Duration(seconds: 30),
    asset: 'assets/images/latest3.png'    
  ),
  Music(
    title: 'Youngblood',
    singer: '5 Seconds of Summer',
    duration: Duration(minutes: 4) + Duration(seconds: 20),
    asset: 'assets/images/latest2.png'    
  ),
  Music(
    title: 'Golden Hour',
    singer: 'Kacey Musgraves',
    duration: Duration(minutes: 3) + Duration(seconds: 30),
    asset: 'assets/images/latest3.png'    
  ),
];


final List<Music> RECENT = [
  Music(
    title: 'Mad Love',
    singer: 'Mabel',
    duration: Duration(minutes: 3) + Duration(seconds: 30),
    asset: 'assets/images/recent1.png'    
  ),
  Music(
    title: 'Solastalgia',
    singer: 'Missy Higgins',
    duration: Duration(minutes: 4) + Duration(seconds: 5),
    asset: 'assets/images/recent2.png'    
  ),
  Music(
    title: 'Someone',
    singer: 'Hanna',
    duration: Duration(minutes: 5) + Duration(seconds: 10),
    asset: 'assets/images/recent3.png'    
  ),
];