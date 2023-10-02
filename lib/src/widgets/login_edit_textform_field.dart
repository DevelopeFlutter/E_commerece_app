import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoori_ecommerce/src/utils/app_theme_data.dart';
import 'package:flutter/material.dart';

import '../utils/responsive.dart';

class LoginEditTextField extends StatelessWidget {
  final String? hintText;
  final IconData? fieldIcon;
  final TextInputType? keyboardType;
  final TextEditingController? myController;
  final bool? myObscureText;
  final dynamic myValidate;
  final dynamic onSave;
  final String? labelText;
  final Widget? suffixIcon;
  final bool isReadonly;
  const LoginEditTextField({
    Key? key,
    this.isReadonly = false,
    this.labelText,
    this.fieldIcon,
    this.hintText,
    this.myController,
    this.keyboardType,
    this.myObscureText,
    this.suffixIcon,
    this.myValidate,
    this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
          //color: Color(0xfff3f3f4),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: AppThemeData.boxShadowColor.withOpacity(0.15),
              spreadRadius: 2,
              blurRadius: 30,
              offset: const Offset(0, 15), // changes position of shadow
            ),
          ],
        ),
        child: TextFormField(
          style: isMobile(context)? AppThemeData.titleTextStyle_13:AppThemeData.titleTextStyleTab,
          readOnly: isReadonly,
          obscureText: myObscureText!,
          validator: myValidate,
          controller: myController,
          onSaved: onSave,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            suffixIconColor: AppThemeData.textFieldSuffixIconColor,
            hintText: hintText,
            hintStyle: isMobile(context)? AppThemeData.hintTextStyle_13:AppThemeData.hintTextStyle_10Tab,
            contentPadding: EdgeInsets.only(
              left: 8.w,
              right: 8.w,
              top: 15.h,
            ),
            prefixIcon: Icon(
              fieldIcon,
              color: AppThemeData.textFieldSuffixIconColor,
              size: isMobile(context)? 17.r:20.r,
            ),
            border: InputBorder.none,
            filled: false,
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: Colors.red,
                width: 2.w,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: Colors.red,
                width: 2.w,
              ),
            ),

            //border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.w,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.w,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
