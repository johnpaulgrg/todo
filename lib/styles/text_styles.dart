import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final Shader linearGradient = LinearGradient(
  colors: <Color>[Color(0xffffffff), Color(0xffebebeb)],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

var subheadingStyle = GoogleFonts.inter(
  color: Color(0xff575767),
  fontSize: 14,
  fontWeight: FontWeight.w600,
);
var completeHeadStyle = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    foreground: Paint()..shader = linearGradient);

var incompleteTaskStyle = GoogleFonts.inter(
  color: Color(0xffdadada),
  fontSize: 18,
  fontWeight: FontWeight.w500,
);
var completeTaskStyle = GoogleFonts.inter(
  color: Color(0xff575767),
  decoration: TextDecoration.lineThrough,
  fontSize: 18,
  fontWeight: FontWeight.w500,
);

var createTaskHead = GoogleFonts.inter(
  foreground: Paint()..shader = linearGradient,
  fontSize: 24,
  fontWeight: FontWeight.w700,
);

var hintStyle = GoogleFonts.inter(
  color: Color(0xff575767),
  fontSize: 18,
  fontWeight: FontWeight.w500,
);
var saveTask = GoogleFonts.inter(
  foreground: Paint()..shader = linearGradient,
  fontSize: 18,
  fontWeight: FontWeight.w700,
);
