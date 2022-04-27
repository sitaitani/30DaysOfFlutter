import 'package:flutter/material.dart';
import 'package:flutter_application_2/Models/Homework.dart';
import 'package:flutter_application_2/utils/Style.dart';
import 'package:flutter_application_2/widgets/emptyWidget.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

//import '../Models/Notification.dart';

class readingMaterialDetail extends StatefulWidget {
  const readingMaterialDetail({Key? key, required this.fileName})
      : super(key: key);

    final String fileName;

  @override
  State<readingMaterialDetail> createState() => _readingMaterialDetailState();
}

class _readingMaterialDetailState extends State<readingMaterialDetail> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SfPdfViewer.asset('assets/pdf/'+widget.fileName+'.pdf'));
  }
}
