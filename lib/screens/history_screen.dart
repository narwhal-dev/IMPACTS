import 'package:flutter/material.dart';
import 'package:impacts/widget/background.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        background(context),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            slivers: [
              header(context),
              //bodyQRWidgets(context),
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
        height: MediaQuery.of(context).size.height * 0.125,
        padding: const EdgeInsets.only(left: 40.0, right: 40.0),
        alignment: Alignment.topLeft,
        child: SafeArea(
          child: Text(
            'History',
            style: TextStyle(fontFamily: 'SF-Pro', color: Theme.of(context).primaryColor, fontSize: 36, fontWeight: FontWeight.bold),
          ),
          top: true, bottom: false, left: false, right: false,
        ),
      ),
    );
  }
}

