import 'package:flutter/widgets.dart';
import './../../Dimensions.dart';
import 'package:widget_mask/widget_mask.dart';
import 'package:provider/provider.dart';
import './../../AppState.dart';
class PhotoContainer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double vw = Dimensions.width(context);
    double vh = Dimensions.height(context);
    final photo = Provider.of<AppState>(context).photo;
    return Container(
      width: vw * 0.64,
      height: vh *0.523,
      margin: EdgeInsets.only(bottom: vh *0.02),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/img/pictureMargin.png"),
                fit:BoxFit.cover

            )
        ),
      child:Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: vw * 0.64,
                  height: vh *0.503,

                  child: WidgetMask(
                      blendMode: BlendMode.dstIn,
                      childSaveLayer: true,
                      mask:SizedBox(

                        child:  Image.asset("assets/img/mask.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    child: photo != null
                        ? Image.file(
                      photo,
                      fit: BoxFit.cover,
                      key: ValueKey(photo.path),
                    )
                        : Image.asset(
                      "assets/img/emptyImage.png",
                      fit: BoxFit.contain,
                      key: ValueKey("default_picture"),
                    ),
                  )
              ),
            ],
          ),
          Image.asset(
            "assets/img/pictureMargin.png",
            width: vw * 0.64,
            height: vh *0.529,
            fit: BoxFit.contain,
          ),
        ],
      )
    );
  }
}