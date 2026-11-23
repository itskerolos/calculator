import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
typedef voidExecuteFunction = void Function(String)?;
class CalculatorButton extends StatelessWidget {
  final int butFlex ;
  final String? butText ;
  final Color?  btnColor;
  final Color? btnTextColor;
  final voidExecuteFunction onTap;
  const CalculatorButton({super.key,this.butFlex = 1, this.butText, this.btnColor, this.btnTextColor,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: butFlex,
      child: GestureDetector(
        onTap:(){
          if(onTap != null){
            onTap!(butText ?? "");
          }
        } ,
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: btnColor ?? AppColors.grey,
          ),
          child:butText == null ? Icon(Icons.backspace_outlined,color: btnTextColor ?? AppColors.lightBlue,) : Text(
            butText!,
            style: TextStyle(
              color: btnTextColor ?? AppColors.lightBlue,
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

}