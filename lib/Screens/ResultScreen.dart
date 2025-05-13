import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../AppState.dart';
import '../Dimensions.dart';
import 'package:petector_app/widgets/TopBar/TopBar.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    double vw = Dimensions.width(context);
    double vh = Dimensions.height(context);
    final primaryColor = Color(0xFF1A1B41);
    final secondaryColor = Color(0xFFB9FE29);

    return Container(
      color: secondaryColor,
      width: vw,
      height: vh,
      child: Column(
        children: [
          TopBar(logoIsNegative: false),
          SizedBox(height: vh * 0.05),
          Container(
            width: vw * 0.648,
            height: vh * 0.424,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    appState.resultText == "Dog" ?
                    "assets/img/dogIlustrationNegative.png" : appState.resultText == "Cat"?  "assets/img/CatlustrationNegative.png" :"assets/img/UnknownIlustrationNegative.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Text(
                  appState.resultText,
                  style: TextStyle(
                    fontSize: 85,
                    color: Color(0xFF1A1B41),
                    fontFamily: 'MPlus2',
                    fontWeight: FontWeight.w800,
                  ),

              ),
              Text(
                  "Detected",
                style: TextStyle(
                  fontSize:40,
                  color: Color(0xFF1A1B41),
                  fontFamily: 'MPlus2',
                  fontWeight: FontWeight.w700,
                ),

              ),
              GestureDetector(
                onTap: () => {
                Navigator.of(context).pushNamed('/')
                } ,
                child: Container(
                  width: vw *0.46,
                  height: vh *0.074,
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/img/blueButtonBg.png")
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Image.asset(
                        "assets/img/ArrowIcon.png",
                        height: 35,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                          "Back",
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'MPlus2',
                            fontWeight: FontWeight.w800,
                          ),

                      )
                    ],
                  ),
                ),
              )

              // Use Provider state
            ],
          ),
        ],
      ),
    );
  }
}
