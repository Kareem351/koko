
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:koko/views/widgets/custom_searsh_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.icon, this.onPressed});

  final String title;
  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
          style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
        Spacer(),
        CustomSearchIcon(
          onPressed: onPressed,
          icon: icon,
        ),
      ],
    );
  }
}

