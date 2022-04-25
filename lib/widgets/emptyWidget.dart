
import 'package:flutter/material.dart';

import '../utils/Style.dart';

class EmptyWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  EmptyWidget(this.title, this.subTitle, this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image(height: 200, width: 200,
              image: AssetImage('assets/images/'+image)),
              SizedBox(height: 15,),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Style.errorHeaderStyle,
            ),
            SizedBox(height: 7,),

            Padding(padding: EdgeInsets.only(left: 15, right: 15),
              child: Text(
              subTitle,
              textAlign: TextAlign.center,
              style: Style.normalContentStyle,
            ),
            )
            
          ],
        ),
      ),
    );
  }
}