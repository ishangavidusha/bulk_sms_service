import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class AppData extends ChangeNotifier {
  Color mainBgColor = Color(0xFFFBFBFD);
  Color mainTextColor = Color(0xFF474C72);
  Color secTextColor = Color(0xff747895);
  TextStyle mainTextStyle = GoogleFonts.poppins(
    color: Color(0xFF474C72),
  );
  TextStyle secTextStyle = GoogleFonts.roboto(
    color: Color(0xff747895),
  );

  LinearGradient linearGradientBt = LinearGradient(colors: [
    Color(0xFFAB9BFE),
    Color(0xFF927CFB),
  ]);

  List<BoxShadow> getBoxShadow(Color color) {
    return [BoxShadow(
      color: color.withOpacity(0.4),
      blurRadius: 16,
      spreadRadius: -6,
      offset: Offset(0, 18),
    )];
  }

  TextStyle getMainTextStyle() => mainTextStyle;
  TextStyle getSecTextStyle() => secTextStyle;
  Color getMainBgColor() => mainBgColor;
  LinearGradient getBtGradient() => linearGradientBt;
}
