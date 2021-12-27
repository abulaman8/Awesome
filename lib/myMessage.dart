import 'package:flutter/material.dart';
import 'package:testapp/constants.dart';

class MyMessage extends StatelessWidget {
  final int index;
  final Map<String, dynamic> data;
  final bool hasPadding;

  const MyMessage({
    Key? key,
    required this.index,
    required this.data,
    this.hasPadding = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: hasPadding == true ? 15 : 5,
        bottom: 5,
        left: 10,
        right: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: 300),
            decoration: BoxDecoration(
              color: Constants.beige,
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 12,
            ),
            child: Text(
              data['value'],
              style: TextStyle(color: Constants.cream),
            ),
          )
        ],
      ),
    );
  }
}