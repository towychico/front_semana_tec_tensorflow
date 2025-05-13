import 'package:flutter/widgets.dart';
import 'package:petector_app/widgets/TopBar/TopBar.dart';

import '../Dimensions.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {

    double vw = Dimensions.width(context);  // 100vw
    double vh = Dimensions.height(context); // 100vh
    final primaryColor = Color(0xFF1A1B41);
    final secondaryColor = Color(0xFFB9FE29);
    return Container(
      color: primaryColor,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TopBar(logoIsNegative: true),
          Container(

              margin: EdgeInsets.only(top: vh*0.05),
              child: Column(


              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Image.asset(
                  'assets/img/ClocklustrationNegative.png',
                  width: vw *0.8,

                ),
                Text(
                  "Loading...",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontFamily: 'MPlus2',
                      fontWeight: FontWeight.w800,
                      fontSize: 45
                  ),
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}

