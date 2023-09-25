import 'package:flutter/material.dart';
import 'package:flutter_clendar_app03/contents/color.dart';
import 'package:flutter_clendar_app03/contents/theme.dart';
import 'package:flutter_clendar_app03/ui/widgets/input_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DateTime _selectedDate = DateTime.now();
  // TimeOfDay _selectedTime = TimeOfDay.now();
  String _endTime = "9:30 PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: _appbar(context),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Text(
              "Add Task",
              style: headingStyle,
            ),
            MyInputField(hintText: "Enter Your Title", title: "Title"),
            MyInputField(hintText: "Enter Your Note", title: "Note"),
            MyInputField(
              hintText: DateFormat.yMd().format(_selectedDate),
              title: "Date",
              widget: IconButton(
                onPressed: () {
                  _getDateFromUser(context: context);
                },
                icon: Icon(
                  Icons.calendar_today_outlined,
                  color: ThemeColors.grey,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: MyInputField(
                    hintText: _startTime,
                    title: "Start Time",
                    widget: IconButton(
                      onPressed: () {
                        _getTimeFromUser(isStartTime: true);
                      },
                      icon: Icon(
                        Icons.access_time_sharp,
                        color: ThemeColors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: MyInputField(
                    hintText: _endTime,
                    title: "End Time",
                    widget: IconButton(
                      onPressed: () {
                        _getTimeFromUser(isStartTime: false);
                      },
                      icon: Icon(
                        Icons.access_time_sharp,
                        color: ThemeColors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }

  _appbar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.appBarTheme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back,
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

  _getDateFromUser({required BuildContext context}) async {
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2150),
    );
    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    } else {
      print("it`s null or something is wrong");
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String formattedTime = pickedTime.format(context);

    if (pickedTime == null) {
      print("Time canceld");
    } else if (isStartTime == true) {
      setState(() {
        _startTime = formattedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = formattedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(
        hour: int.parse(_startTime.split(":")[0]),
        minute: int.parse(_startTime.split(":")[1].split(" ")[0]),
      ),
    );
  }
}
