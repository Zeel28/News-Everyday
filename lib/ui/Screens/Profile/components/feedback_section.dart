import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../theme/colors.dart';

class FeedbackMenuList extends StatelessWidget {
  FeedbackMenuList({Key? key}) : super(key: key);

  final List<String> Menu = <String>[
    'Report a bug',
    'Send feedback',
  ];
  final List<String> leadingIcon = <String>[
    'bug.png',
    'feedback.png',
  ];
  static List<Widget> navigatepages = <Widget>[
    ReportBugandReportNews(),
    FeedBack(),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //You can make the ListView widget never scrollable by setting physics property to NeverScrollableScrollPhysics().
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: Menu.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () => Get.to(navigatepages[index]),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
            padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 2.0,
                  spreadRadius: 2.0,
                  offset: Offset(
                    5.0,
                    5.0,
                  ),
                )
              ],
            ),
            child: ListTile(
                tileColor: Colors.white,
                leading: Image.asset(
                    "assets/icons/profile_page/${leadingIcon[index]}",
                    height: 35,
                    width: 35),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: primaryColor,
                ),
                title: Text(
                  Menu[index],
                  style: const TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                )),
          ),
        );
      },
    );
  }
}


class ReportBugandReportNews extends StatelessWidget {
  const ReportBugandReportNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Report Bug and Report News"),
      ),
    );
  }
}

class FeedBack extends StatelessWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feed Back"),
      ),
    );
  }
}