import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:koko/constants.dart';

class CustomTextField extends StatelessWidget {
const CustomTextField({super.key,  required this.hint, this.maxLines = 1, this.onSaved, this.onChanged, });

final String hint;
final int maxLines;
final void Function(String?)? onSaved;
final  Function(String)? onChanged;


@override
  Widget build(BuildContext context) {
    return  TextFormField(
      onChanged:onChanged ,
     onSaved: onSaved,
      validator: (value){
       if(value?.isEmpty ?? true){
         return'field is required';
       }else
         return null;
      },
      cursorColor:kPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText:hint ,
       hintStyle: TextStyle(
         color: kPrimaryColor
       ),
       border: bulldBorder(),
        enabledBorder: bulldBorder(),
        focusedBorder: bulldBorder(kPrimaryColor),
      ),
    );
  }
    OutlineInputBorder bulldBorder([color]){
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Color(0xff62FcD7), ),
      );
    }

}
