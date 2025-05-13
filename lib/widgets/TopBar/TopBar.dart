import 'package:flutter/widgets.dart';

import '../../Dimensions.dart';
class TopBar extends StatelessWidget{

  final bool logoIsNegative;
  const TopBar({
    required this.logoIsNegative
});
  @override
  Widget build(BuildContext context) {
    double vw = Dimensions.width(context);
    double vh = Dimensions.height(context);

    final String logoPath = logoIsNegative ? "assets/img/logoWideNegative.png" :"assets/img/logoWide.png";


    return Container(
      width: vw,
      height: vh *0.12,
      margin: EdgeInsets.only(top: vh * 0.06),
      child:  Image.asset(logoPath),
    );



  }

}