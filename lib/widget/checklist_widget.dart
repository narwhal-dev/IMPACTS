import 'package:flutter/material.dart';
import 'package:impacts/config/styles.dart';

// ignore: non_constant_identifier_names
class ChecklistWidget extends StatefulWidget {
  const ChecklistWidget({Key? key}) : super(key: key);

  @override
  _ChecklistWidgetState createState() => _ChecklistWidgetState();
}

class _ChecklistWidgetState extends State<ChecklistWidget> {
  List<CheckBoxListTileModel> checkBoxListTileModel =
      CheckBoxListTileModel.symptoms();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        //physics: ClampingScrollPhysics(),
        itemCount: checkBoxListTileModel.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 0.0,
            color: Colors.transparent,
            child: Container(
              child: Column(
                children: [
                  Theme(
                    data: ThemeData(unselectedWidgetColor: Colors.black),
                    child: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Color(0xFF261A0E),
                        dense: true,
                        title: Text(
                          checkBoxListTileModel[index].title,
                          style: Styles.checklistMain,
                        ),
                        subtitle: Text(
                          checkBoxListTileModel[index].subtitle,
                          style: Styles.checklistSubheading,
                        ),
                        value: checkBoxListTileModel[index].isCheck,
                        onChanged: (val) {
                          itemChange(val!, index);
                        }),
                  ),
                  createDivider(index, checkBoxListTileModel.length, context),
                ],
              ),
            ),
          );
        });
  }
  Widget createDivider(int index, int length, BuildContext context){
    if(index < length - 1){
      if(index == length - 2)
        return Column(
          children: [
            SizedBox(height: 10.0),
            Divider(thickness: 3.0, color: Color(0xFF717171), indent: 20.0, endIndent: 20.0, height: 1),
          ],
        );
      else
        return Divider(thickness: 1.0, color: Color(0xFF717171), indent: 20.0, endIndent: 20.0, height: 1);
    }
    return Divider(thickness: 0.0, color: Theme.of(context).canvasColor, height: 0);
  }

  void itemChange(bool val, int index) {
    setState(() {
      checkBoxListTileModel[index].isCheck = val;
    });
  }
}

class CheckBoxListTileModel {
  int userId;
  String title;
  String subtitle;
  bool isCheck;

  CheckBoxListTileModel(
      {required this.userId, required this.title, required this.subtitle, required this.isCheck});

  static List<CheckBoxListTileModel> symptoms() {
    return <CheckBoxListTileModel>[
      CheckBoxListTileModel(userId: 1, title: "Fever", subtitle: "Lagnat", isCheck: false),
      CheckBoxListTileModel(userId: 2, title: "Dry Cough", subtitle: "Tuyong ubo", isCheck: false),
      CheckBoxListTileModel(userId: 3, title: "Fatigue", subtitle: "Pagkapagod", isCheck: false),
      CheckBoxListTileModel(userId: 4, title: "Aches and Pains", subtitle: "Pananakit ng katawan", isCheck: false),
      CheckBoxListTileModel(userId: 5, title: "Runny Nose", subtitle: "Sipon", isCheck: false),
      CheckBoxListTileModel(userId: 6, title: "Sore Throat", subtitle: "Namamagang Lalamunan", isCheck: false),
      CheckBoxListTileModel(userId: 7, title: "Shortness of Breath", subtitle: "Hirap sa paghinga", isCheck: false),
      CheckBoxListTileModel(userId: 8, title: "Diarrhea", subtitle: "Pagdudumi", isCheck: false),
      CheckBoxListTileModel(userId: 9, title: "Headache", subtitle: "Pananakit sa ulo", isCheck: false),
      CheckBoxListTileModel(userId: 10, title: "Loss of Smell and Taste", subtitle: "Pagkawala ng pang-amoy at panglasa", isCheck: false),
      CheckBoxListTileModel(userId: 11, title: "None of the Above", subtitle: "Wala sa Nabanggit", isCheck: false),
    ];
  }
}
