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
          vertical: 18, horizontal: largeHorizontal ? 50 : 30)),
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
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 30),
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
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 30),
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
      padding: mst(const EdgeInsets.symmetric(vertical: 18, horizontal: 20)),
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

InputDecoration generalInputDecoration(String placeholder) {
  return InputDecoration(
      fillColor: Colors.white.withOpacity(.4),
      filled: true,
      floatingLabelAlignment: FloatingLabelAlignment.center,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: const EdgeInsets.all(5),
      isDense: true,
      isCollapsed: true,
      label: Opacity(
          opacity: .5,
          child: Text(
            placeholder,
          )),
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
    opacity: .35,
    child: Text(
      str,
      style: const TextStyle(fontWeight: FontWeight.w600),
    ),
  );
}
