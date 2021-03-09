import 'dart:ui';
import 'package:bulk_sms_service/pages/settingsPage.dart';
import 'package:bulk_sms_service/utils/appData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            color: appData.getMainBgColor(),
          ),
          Positioned(
            top: 0,
            width: devWidth,
            height: devHeight,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: devHeight * 0.05,
                  ),
                  Container(
                    width: devWidth,
                    child: Center(
                      child: SvgPicture.asset("assets/svg/undraw_message_sent_1030.svg", width: devWidth * 0.7, height: devWidth * 0.7,),
                    ),
                  ),
                  SizedBox(
                    height: devHeight * 0.1,
                  ),
                  Container(
                    width: devWidth * 0.7,
                    decoration: BoxDecoration(
                      gradient: appData.linearGradientBt,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                      boxShadow: appData.getBoxShadow(appData.linearGradientBt.colors.last),
                    ),
                    child: Material(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {

                        },
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
                          child: Column(
                            children: [
                              Text(
                                "Send Bulk SMS",
                                style: appData.getMainTextStyle().copyWith(
                                  fontSize: devWidth * 0.06,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "To change the sheet ID press and hold",
                                style: appData.getSecTextStyle().copyWith(
                                  fontSize: devWidth * 0.02,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: devWidth * 0.7,
                    decoration: BoxDecoration(
                      gradient: appData.linearGradientBt,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                      boxShadow: appData.getBoxShadow(appData.linearGradientBt.colors.last),
                    ),
                    child: Material(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SettingsView()),
                          );
                        },
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
                          child: Column(
                            children: [
                              Text(
                                "Manage Sheets",
                                style: appData.getMainTextStyle().copyWith(
                                  fontSize: devWidth * 0.04,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
