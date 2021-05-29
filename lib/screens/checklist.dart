import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:impacts/config/styles.dart';
import 'package:impacts/widget/background.dart';
import 'package:impacts/widget/checklist_widget.dart';

class Checklist extends StatefulWidget {
  @override
  _ChecklistState createState() => _ChecklistState();
}

class _ChecklistState extends State<Checklist> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        background(context),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            physics: ClampingScrollPhysics(),
            slivers: [
              header(context),
              textbox(context),
              bodyChecklistWidget(context),
              nextWidget(context),
            ],
          ),
        ),
      ],
    );
  }

  SliverToBoxAdapter header(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.115,
        padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
        alignment: Alignment.topLeft,
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Health Checklist',
                style: TextStyle(fontFamily: 'SF-Pro', color: Theme.of(context).primaryColor, fontSize: 36, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(SFSymbols.arrow_left_circle,
                      color: Theme.of(context).primaryColor, size: 30.0),
                ),
              ),
            ],
          ),
          top: true, bottom: false, left: false, right: false,
        ),
      ),
    );
  }

  SliverToBoxAdapter textbox(BuildContext context){
    return SliverToBoxAdapter(
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 5.0),
        child: Text(
          'Are you experiencing:',
          style: TextStyle(
              fontFamily: 'SF-Pro',
              color: Theme.of(context).primaryColor,
              fontSize: 22,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter bodyChecklistWidget(BuildContext context){
    return SliverToBoxAdapter(
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.7,
          margin: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
          padding: const EdgeInsets.only(top: 20.0),
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: MediaQuery.removePadding(
              removeTop: true,
              removeBottom: true,
              context: context,
              child: ChecklistWidget()
          )
        ),
      ),
    );
  }

  SliverToBoxAdapter nextWidget(BuildContext context){
    return SliverToBoxAdapter(
      child: Center(
        child: Container(
          height: 52.0,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
          //color: Colors.red,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Theme.of(context).canvasColor,
          ),
          child: TextButton(
            onPressed: () {print('Clicked!');},
            child: Text('Next', style: TextStyle(
                fontFamily: 'SF-Pro',
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w600,
            ),),
          ),
        ),
      ),
    );
  }
}
