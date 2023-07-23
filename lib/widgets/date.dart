import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/datecontroller..dart';
import 'package:intl/intl.dart';



class Date extends StatelessWidget {
  Date({Key? key, required this.text, required this.width, required this.color})
      : super(key: key);

  final String text;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DateController>(
      builder: (controller) {
        String formattedDate = '';
        if (controller.selectedDateController.value.text.isNotEmpty) {
          formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.parse(controller.selectedDateController.value.text));
        }
        return SingleChildScrollView(
          child: Container(
            width: Get.width * width,
            child: TextField(
              readOnly: true,
              onTap: () {
                _selectDate(context, controller);
              },
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusColor: color,
                filled: true,
                labelText: text,
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              controller: TextEditingController(text: formattedDate),
            ),
          ),
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context, DateController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      controller.updateSelectedDate(picked);
    }
  }
}
