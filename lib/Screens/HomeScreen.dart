import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../AppState.dart';
import '../widgets/PhotoContainer/PhotoContainer.dart';
import '../widgets/TopBar/TopBar.dart';
import './../Dimensions.dart';
import './../predict_api.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
class HomeScreen extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    double vw = Dimensions.width(context);  // 100vw
    double vh = Dimensions.height(context); // 100vh
    final primaryColor = Color(0xFF1A1B41);
    final secondaryColor = Color(0xFFB9FE29);
    return Container(
      width: vw ,
      height: vh,
      color: primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TopBar(logoIsNegative: true),
          PhotoContainer(),
          GestureDetector(
            onTap: () => _showPhotoSourceActionSheet(context),
            child: Container(
              width: vw *0.66,
              height: vh *0.074,
              margin: EdgeInsets.only(bottom: vh *0.01,top: vh * 0.01),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/whiteButtonBg.png"),
                      fit:BoxFit.cover
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Container(
                    height: vh *0.054,
                    width: vh *0.054,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/img/cameraIcon.png"),
                            fit:BoxFit.contain

                        )
                    ),
                  ),
                  SizedBox(width: 10),
                  Text("Take Photo",
                      style:TextStyle(
                          color: primaryColor,
                          fontFamily: 'MPlus2',
                          fontWeight: FontWeight.w800,
                          fontSize: 31
                      )
                  ),


                ],
              ),
            ),
          ),GestureDetector(
            onTap: () async {
              final appState = Provider.of<AppState>(context, listen: false);
              final photo = appState.photo;

              if (photo == null) {
                print("⚠️ No photo selected");
                return;
              }
              await Future.delayed(Duration(seconds: 2));
              Navigator.of(context).pushNamed('/loading');

              try {
                final result = await sendPhotoToApi(photo);
                appState.setResult(result);
              } catch (e) {
                print("❌ Error calling API: $e");
                appState.setResult("Unknown");
              }

              Navigator.of(context).pushNamed('/result');
            },


            child: Container(
              width: vw *0.66,
              height: vh *0.074,
              margin: EdgeInsets.only(bottom: vh *0.05,top: vh * 0.01),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/greenButtonBg.png"),
                      fit:BoxFit.cover
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Container(
                    height: vh *0.064,
                    width: vh *0.064,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/img/Aiicon.png"),
                            fit:BoxFit.contain

                        )
                    ),
                  ),
                  SizedBox(width: 5),
                  Text("Detect",
                      style:TextStyle(
                          color: primaryColor,
                          fontFamily: 'MPlus2',
                          fontWeight: FontWeight.w800,
                          fontSize: 31

                      )
                  ),


                ],
              ),
            ),
          )

        ],
      ),
    );
  }

  Future<void> _showPhotoSourceActionSheet(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final parentContext = context;

    showCupertinoModalPopup(
      context: parentContext,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text('Select Photo'),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () async {
                Navigator.pop(context);
                final XFile? picked = await picker.pickImage(source: ImageSource.camera);
                if (picked != null) {
                  final photo = File(picked.path);
                  Provider.of<AppState>(parentContext, listen: false).setPhoto(photo);
                }
              },
              child: Text('Take Photo'),
            ),
            CupertinoActionSheetAction(
              onPressed: () async {
                Navigator.pop(context);
                final XFile? picked = await picker.pickImage(source: ImageSource.gallery);
                if (picked != null) {
                  final photo = File(picked.path);
                  Provider.of<AppState>(parentContext, listen: false).setPhoto(photo);
                }
              },
              child: Text('Choose from Gallery'),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
        );
      },
    );
  }

}