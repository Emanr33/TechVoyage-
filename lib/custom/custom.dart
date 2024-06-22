import 'package:flutter/material.dart';
import 'package:wardrobe/custom/constant.dart';

Text customText({required String data}) {
  return Text(
    data,
    style: const TextStyle(
        fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
  );
}

Text customTextbold({required String data}) {
  return Text(
    data,
    style: const TextStyle(
        fontWeight: FontWeight.bold, fontSize: 55, color: Colors.white),
  );
}

TextFormField customTextFormField({
  required Controller,
  required PrefixIcon,
  Suffix,
  //bool? ObscureText=true,

  HintText = '',
  LabelText = '',
}) {
  return TextFormField(
    controller: Controller,
    // obscureText: ObscureText!,
    decoration: InputDecoration(
        prefixIcon: PrefixIcon,
        hintText: HintText,
        labelText: LabelText,
        suffix: Suffix,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        )),
  );
}

TextFormField customTextFormField1({
  required Controller,
  required PrefixIcon,
  Suffix,
  //bool? ObscureText=true,

  HintText = '',
  LabelText = '',
}) {
  return TextFormField(
    controller: Controller,
    // obscureText: ObscureText!,
    decoration: InputDecoration(
      prefixIcon: PrefixIcon,
      hintText: HintText,
      labelText: LabelText,
      suffix: Suffix,
      labelStyle: TextStyle(fontWeight: FontWeight.bold, color: whiteColor),
      //   focusedBorder: OutlineInputBorder(
      //   borderSide: BorderSide(color: whiteColor), // Border color when focused
      // ),
      // enabledBorder: OutlineInputBorder(
      //   borderSide: BorderSide(color: whiteColor), // Border color when not focused
      // ),
    ),
    style: TextStyle(color: whiteColor),
  );
}

TextFormField customTextFormFieldPassword({
  required Controller,
  required PrefixIcon,
  Suffix,
  bool? ObscureText = true,
  HintText = '',
  LabelText = '',
}) {
  return TextFormField(
    controller: Controller,
    obscureText: ObscureText!,
    decoration: InputDecoration(
        prefixIcon: PrefixIcon,
        hintText: HintText,
        labelText: LabelText,
        suffix: Suffix,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        )),
  );
}

//blue pages k leya hai
TextFormField customTextFormField2({
  required Controller,
  required PrefixIcon,
  Suffix,
  //bool? ObscureText=true,

  HintText = '',
  LabelText = '',
}) {
  return TextFormField(
    controller: Controller,
    style: TextStyle(color: whiteColor),
    // obscureText: ObscureText!,
    decoration: InputDecoration(
      prefixIcon: PrefixIcon,
      hintText: HintText,
      labelText: LabelText,
      suffix: Suffix,
      labelStyle: TextStyle(fontWeight: FontWeight.bold, color: whiteColor),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
            color: whiteColor), // Setting focused border color to white
      ),
    ),
  );
}

ElevatedButton customElevatedButton(
    {required OnPressed, required String data}) {
  return ElevatedButton(
    onPressed: OnPressed,
    child: customText(data: data),
    style: ElevatedButton.styleFrom(
      backgroundColor: appbarColor,
    ),
  );
}

Widget customcheckboxlisttitle({
  required String Title,
  required bool Value,
  required Function(bool?) Onchanged,
}) {
  return CheckboxListTile(
    title: Text(
      Title,
      style: TextStyle(
        color: Colors.white, // Setting the title color to white
      ),
    ),
    controlAffinity: ListTileControlAffinity.leading,
    value: Value,
    onChanged: Onchanged,
    activeColor: Colors.white, // Setting the checkbox checked color to white
    checkColor: Colors.white, // Setting the checkmark color to white
  );
}
