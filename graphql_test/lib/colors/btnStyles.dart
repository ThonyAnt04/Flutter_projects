import 'package:flutter/material.dart';

class Btnstyles {
  static ButtonStyle btnsUses = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(Color.fromRGBO(182, 48, 76, 1)),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), 
      ),
          ),
  );

  static ButtonStyle btnUsesSecondary = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(Color.fromRGBO(82, 22, 35, 1)),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
          ),
  );
}