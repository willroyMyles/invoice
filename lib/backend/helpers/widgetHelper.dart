import 'package:flutter/material.dart';
import 'package:get/utils.dart';

Widget cardText(String str) {
  return Text(
    str.capitalize!,
    textScaleFactor: 1.5,
    maxLines: 1,
    style: const TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.w700,
    ),
  );
}

MaterialStateProperty<T>? mst<T>(T value) {
  return MaterialStatePropertyAll<T>(value);
}

double largeWidth = GetPlatform.isMobile ? 30 : 50;
double width = GetPlatform.isMobile ? 10 : 30;
double height = GetPlatform.isMobile ? 6 : 18;

Widget primaryButton(String text,
    {Function? onPressed, bool largeHorizontal = false}) {
  return TextButton(
    onPressed: onPressed != null
        ? () {
            onPressed();
          }
        : null,
    style: ButtonStyle(
      side: mst(const BorderSide(color: Colors.red, width: 3)),
      shape: mst(const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
      padding: mst(EdgeInsets.symmetric(
          vertical: height, horizontal: largeHorizontal ? largeWidth : width)),
      foregroundColor: mst(Colors.white),
      backgroundColor: mst(Colors.red),
      textStyle: mst(const TextStyle(fontWeight: FontWeight.w700)),
    ),
    child: Text(
      text.capitalize!,
      textScaleFactor: .9,
    ),
  );
}

Widget secondaryButton(String text, Function onPressed) {
  return OutlinedButton(
    onPressed: () {
      onPressed();
    },
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: Colors.red, width: 3),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      padding: EdgeInsets.symmetric(vertical: height, horizontal: width),
      foregroundColor: Colors.red,
      textStyle: const TextStyle(fontWeight: FontWeight.w700),
    ),
    child: Text(
      text.capitalize!,
      textScaleFactor: .9,
    ),
  );
}

Widget tertiaryButton(String text, Function onPressed) {
  var col = Colors.grey.shade400;
  return OutlinedButton(
    onPressed: () {
      onPressed();
    },
    style: OutlinedButton.styleFrom(
      side: BorderSide(color: col, width: 2),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      padding: EdgeInsets.symmetric(vertical: height, horizontal: width),
      foregroundColor: col,
      textStyle: const TextStyle(fontWeight: FontWeight.w700),
    ),
    child: Text(
      text.capitalize!,
      textScaleFactor: .9,
    ),
  );
}

Widget hintButton(String text, Function onPressed) {
  var col = Colors.grey.shade400;
  return TextButton(
    onPressed: () {
      onPressed();
    },
    style: ButtonStyle(
      // side: mst(const BorderSide(color: Colors.red, width: 3)),
      shape: mst(const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
      padding: mst(EdgeInsets.symmetric(vertical: height, horizontal: width)),
      foregroundColor: mst(Colors.grey.shade700),
      backgroundColor: mst(Colors.transparent),
      textStyle: mst(const TextStyle(
          fontWeight: FontWeight.w500, decoration: TextDecoration.underline)),
    ),
    child: Text(
      text.capitalize!,
      textScaleFactor: .9,
    ),
  );
}

InputDecoration authInputDecoration(String placeholder) {
  return InputDecoration(
      fillColor: Colors.yellow.withOpacity(.4),
      filled: true,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide:
              BorderSide(color: Colors.black.withOpacity(.2), width: 1)));
}

InputDecoration generalInputDecoration(String placeholder,
    {bool leftAlign = true}) {
  return InputDecoration(
      fillColor: Colors.white.withOpacity(.4),
      filled: true,
      floatingLabelAlignment: FloatingLabelAlignment.center,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: const EdgeInsets.all(5),
      isDense: true,
      isCollapsed: true,
      label: Row(
        mainAxisAlignment:
            leftAlign ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          Opacity(
              opacity: .5,
              child: Container(
                // color: Colors.red,
                child: Text(
                  placeholder,
                  textAlign: TextAlign.end,
                ),
              )),
        ],
      ),
      border: InputBorder.none);
}

BoxDecoration boxInputDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(3),
    border: Border.all(color: Colors.grey.shade400.withOpacity(.3), width: 1.5),
  );
}

Widget inputHolder(Widget child) => Container(
      margin: const EdgeInsets.only(bottom: 20, top: 5),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: boxInputDecoration(),
      child: child,
    );

Widget hintText(String str) {
  return Opacity(
    opacity: .45,
    child: Text(
      str.capitalize!,
      style: const TextStyle(fontWeight: FontWeight.w500),
    ),
  );
}

Widget hintText1(String str) {
  return Opacity(
    opacity: .75,
    child: Text(
      str.capitalize!,
      style: const TextStyle(fontWeight: FontWeight.w500),
    ),
  );
}

Widget get divider => const Opacity(
      opacity: .75,
      child: Divider(),
    );
