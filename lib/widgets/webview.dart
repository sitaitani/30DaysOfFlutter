import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class WebviewExample extends StatefulWidget {
  const WebviewExample({Key? key, required this.url, required this.title})
      : super(key: key);

  final String url;
  final String title;

  @override
  _WebviewExampleState createState() => _WebviewExampleState();
}

class _WebviewExampleState extends State<WebviewExample> {
  int position = 1;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Color.fromRGBO(218, 55, 50, 1),
        ),
        body: IndexedStack(index: position, children: <Widget>[
          WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onPageStarted: (value) {
              setState(() {
                position = 1;
              });
            },
            onPageFinished: (value) {
              setState(() {
                position = 0;
              });
            },
          ),
          Container(
            child: Center(
                child: CircularProgressIndicator(
              color: Colors.red,
            )),
          ),
        ]));
  }
}
