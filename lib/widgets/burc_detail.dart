import 'package:burc/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BurcDetail extends StatelessWidget {
  BurcDetail({
    Key? key,
    required this.text,
    required this.bodyText,
    required this.imageText,
  }) : super(key: key);

  String text;
  String bodyText;
  String imageText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          SizedBox(height:context.lowValue),
          Image.asset(
            imageText,
            width: context.width*0.5,
            height: context.height*0.2
          ),
          SizedBox(width: context.lowValue),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: context.lowValue),
                Text(bodyText,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
          SizedBox(height: context.lowValue),
        ],
      ),
    );
  }
}