import 'package:flutter/material.dart';
import 'package:testapp/constants.dart';


class MessageBox extends StatefulWidget {
  final ValueChanged<String> onSubmit;

  const MessageBox({Key? key, required this.onSubmit}) : super(key: key);

  @override
  _MessageBoxState createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {
  final _controller = TextEditingController();

  String? _message;

  void _onPressed() {
    widget.onSubmit(_message as String);
    _message = '';
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Type a message',
                filled: true,
                fillColor: Constants.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.all(10),
              ),
              minLines: 1,
              maxLines: 10,
              onChanged: (value) {
                setState(() {
                  _message = value;
                });
              },
            ),
          ),
          SizedBox(width: 5),
          RawMaterialButton(
            onPressed: _message == null || _message!.isEmpty ? null : _onPressed,
            fillColor: _message == null || _message!.isEmpty
                ? Constants.grey
                : Constants.maroon,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'SEND',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
