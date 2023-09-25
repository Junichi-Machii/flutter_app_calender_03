import 'package:flutter/material.dart';
import 'package:flutter_clendar_app03/contents/color.dart';
import 'package:flutter_clendar_app03/contents/theme.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class MyInputField extends StatelessWidget {
  const MyInputField({
    super.key,
    required this.hintText,
    required this.title,
    this.controller,
    this.widget,
  });

  final String title;
  final String hintText;
  final TextEditingController? controller;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            padding: EdgeInsets.only(left: 16),
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: ThemeColors.grey,
                width: 1.0,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: widget == null ? false : true,
                    autofocus: false,
                    cursorColor:
                        Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
                    controller: controller,
                    style: subTitleStyle,
                    decoration: InputDecoration(
                        hintText: hintText,
                        hintStyle: subTitleStyle,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: context.theme.scaffoldBackgroundColor,
                              width: 0),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: context.theme.scaffoldBackgroundColor,
                              width: 0),
                        )),
                  ),
                ),
                widget == null
                    ? Container()
                    : Container(
                        child: widget,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
