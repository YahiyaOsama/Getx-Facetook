import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton(
      {super.key,
      required this.text,
      required this.isLiked,
      required this.onClickListener});

  VoidCallback onClickListener;
  String text;
  bool isLiked;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.1,
      child: TextButton(
        onPressed: onClickListener,
        child: Text(
          text,
          style: TextStyle(color: isLiked ? Colors.grey : Colors.blue),
        ),
      ),
    );
  }
}
