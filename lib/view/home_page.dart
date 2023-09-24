import 'package:flutter/material.dart';
import 'package:flutter_clendar_app03/contents/theme.dart';
import 'package:flutter_clendar_app03/services/notification_services.dart';
import 'package:flutter_clendar_app03/services/theme_services.dart';
import 'package:flutter_clendar_app03/ui/widgets/button.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notifyHelper;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Column(
        children: [
          _appTaskBar(),
        ],
      ),
    );
  }

  _appTaskBar() {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMEd().format(DateTime.now()),
                  style: subHeadingStyle,
                ),
                Text(
                  "today",
                  style: headingStyle,
                ),
              ],
            ),
          ),
          MyButton(label: '+ Add Task', onTap: () {}),
          // SizedBox(width: 20),
        ],
      ),
    );
  }

  _appbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.appBarTheme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          ThemeService().switchTheme();
          notifyHelper.displayNotification(
            title: "Theme changed",
            body: Get.isDarkMode
                ? "Activated Light theme"
                : "Activated Dark theme",
          );

          notifyHelper.scheduledNotification();
        },
        child: Icon(
          Get.isDarkMode ? Icons.sunny : Icons.dark_mode_rounded,
          size: 20,
          color: Get.isDarkMode ? Colors.white : Colors.black87,
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundImage: AssetImage(
            "images/person.png",
          ),
        ),
        SizedBox(width: 20),
      ],
    );
  }
}
