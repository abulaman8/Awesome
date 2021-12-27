import 'package:flutter/material.dart';
import 'package:testapp/constants.dart';

class IncomingMessage extends StatelessWidget {
  final int index;
  final Map<String, dynamic> data;
  

  const IncomingMessage(
      {Key? key, required this.index, required this.data,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 10),
          Container(
            constraints: BoxConstraints(
              maxWidth: 300,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: Constants.maroon,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${data['author']} said:',
                  style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(data['value']),
              ],
            ),
          )
        ],
      ),
    );
  }
}