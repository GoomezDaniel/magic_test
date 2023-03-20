import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Font styles
class MyStyles {
  /// The style to [titles]
  static final title = GoogleFonts.montserrat(
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontSize: 16,
  );

  /// The style to [subtitles]
  static final subtitle = GoogleFonts.montserrat(
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: 13,
  );
}
