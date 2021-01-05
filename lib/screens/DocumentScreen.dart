import 'package:flutter/material.dart';
import 'package:flutter_get_project/screens/Home.dart';
import 'package:get/get.dart';

class DocumentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Get 기능"),),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(onPressed: (){},child: Text("Navigator"),),
            RaisedButton(onPressed: (){
              Get.to(Home());
            }, child: Text("Todo Page"),)
          ],
        ),
      ),
    );
  }
}
