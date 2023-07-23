import 'package:flutter/material.dart';

class BurcField extends StatelessWidget {
  BurcField({
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
      child: Row(
        children: [
          Image.asset(
            imageText,
            width: 80,
            height: 80,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  bodyText,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}