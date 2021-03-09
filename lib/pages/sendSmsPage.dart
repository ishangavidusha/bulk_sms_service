import 'package:bulk_sms_service/utils/appData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SendSmsView extends StatefulWidget {
  @override
  _SendSmsViewState createState() => _SendSmsViewState();
}

class _SendSmsViewState extends State<SendSmsView> {
  @override
  Widget build(BuildContext context) {
    double devWidth = MediaQuery.of(context).size.width;
    double devHeight = MediaQuery.of(context).size.height;
    AppData appData = Provider.of<AppData>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: devWidth,
            height: devHeight,
            color: Color(0xFF177AF6),
          ),
        ],
      ),
    );
  }
}