import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/cv_home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const CVApp());
}

class CVApp extends StatelessWidget {
  const CVApp({super.key});

  static const Color primaryGreen = Color(0xFF4ADE80);
  static const Color secondaryGreen = Color(0xFF22C55E);
  static const Color bgDark = Color(0xFF0A1628);
  static const Color cardDark = Color(0xFF112240);
  static const Color borderColor = Color(0xFF1E3A5F);
  static const Color textMuted = Color(0xFF94A3B8);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rizky Fadhillah - CV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: primaryGreen,
          secondary: secondaryGreen,
          surface: cardDark,
          onPrimary: Colors.black,
          onSurface: Colors.white,
          outline: borderColor,
        ),
        scaffoldBackgroundColor: bgDark,
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
        appBarTheme: AppBarTheme(
          backgroundColor: bgDark,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: cardDark,
          selectedItemColor: primaryGreen,
          unselectedItemColor: textMuted,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: GoogleFonts.poppins(
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: GoogleFonts.poppins(fontSize: 11),
          elevation: 0,
        ),
        cardTheme: CardThemeData(
          color: cardDark,
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: borderColor, width: 1),
          ),
        ),
        chipTheme: ChipThemeData(
          backgroundColor: const Color(0xFF1E3A5F),
          labelStyle: GoogleFonts.poppins(color: Colors.white70, fontSize: 11),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: Color(0xFF2A4A7F)),
          ),
        ),
      ),
      home: const CVHome(),
    );
  }
}
