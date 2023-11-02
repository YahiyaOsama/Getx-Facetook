import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton(
      {super.key,
      required this.icon,
      required this.isLiked,
      required this.onClickListener});

  VoidCallback onClickListener;
  bool isLiked;
  Icon icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.1,
      child: IconButton(
        onPressed: onClickListener, icon: icon,
        // child: Text(
        //   text,
        //   style: TextStyle(color: isLiked ? Colors.grey : Colors.blue),
        // ),
      ),
    );
  }
}
