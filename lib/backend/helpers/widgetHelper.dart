import 'package:flutter/material.dart';
import 'package:get/utils.dart';

Widget cardText(String str) {
  return Text(
    str,
    textScaleFactor: 1.5,
    maxLines: 1,
    style: const TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.w700,
    ),
  );
}

ButtonStyle get primaryBtn => ButtonStyle(
    iconColor: mst(Colors.white),
    backgroundColor: mst(Colors.red),
    shape: mst(const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
    padding: mst(const EdgeInsets.symmetric(vertical: 6, horizontal: 16)),
    textStyle: mst(const TextStyle(fontWeight: FontWeight.w600)));

ButtonStyle get secondaryBtn => OutlinedButton.styleFrom(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.red,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: BorderSide(width: 10, color: Colors.red)),
    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
    textStyle: const TextStyle(fontWeight: FontWeight.w600));

MaterialStateProperty<T>? mst<T>(T value) {
  return MaterialStatePropertyAll<T>(value);
}

Widget primaryButton(String text, Function onPressed,
    {bool largeHorizontal = false}) {
  return TextButton(
    onPressed: () {
      onPressed();
    },
    style: ButtonStyle(
      side: mst(const BorderSide(color: Colors.red, width: 3)),
      shape: mst(const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
      padding: mst(EdgeInsets.symmetric(
          vertical: 18, horizontal: largeHorizontal ? 50 : 20)),
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
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
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
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
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
