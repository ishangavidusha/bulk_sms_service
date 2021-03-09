import 'package:bulk_sms_service/models/sheetIdModel.dart';
import 'package:bulk_sms_service/services/localeDataService.dart';
import 'package:bulk_sms_service/utils/appData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {

  DataService dataService = DataService();
  List<SheetKeyModel> sheetKeyList = [];

  getKeys() async {
    sheetKeyList = await dataService.getSavedSheetKeys();
    sheetKeyList.forEach((element) {
      print(element.key);
    });
    setState(() {});
  }

  @override
  void initState() { 
    super.initState();
    getKeys();
  }


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
                    height: devHeight * 0.02,
                  ),
                  Container(
                    width: devWidth,
                    child: Center(
                      child: SvgPicture.asset("assets/svg/undraw_Code_typing_re_p8b9.svg", width: devWidth * 0.7, height: devWidth * 0.7,)
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: sheetKeyList != null ? sheetKeyList.length : 0,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(
                          sheetKeyList[index].keyName,
                          style: appData.getMainTextStyle().copyWith(
                            fontSize: devWidth * 0.05,
                            color: sheetKeyList[index].selected == "true" ? Colors.blue : Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          sheetKeyList[index].key,
                          style: appData.getSecTextStyle().copyWith(
                            fontSize: devWidth * 0.03,
                            color: sheetKeyList[index].selected == "true" ? Colors.blue : Colors.black,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            dataService.removeSheetKey(sheetKeyList[index]);
                            getKeys();
                          },
                          color: appData.getBtGradient().colors.last,
                          icon: Icon(Icons.delete),
                        ),
                      );
                    }
                  ),
                ],
              )
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool result = await dataService.addSheetKey(
            SheetKeyModel(
              id: "1",
              key: "nvibjdgfiuazbvr",
              keyName: "test key",
              selected: "true"
            )
          );

          print(result);
          setState(() {});
          getKeys();
        },
        backgroundColor: appData.getBtGradient().colors.last,
        child: Icon(Icons.plus_one),
      ),
    );
  }
}