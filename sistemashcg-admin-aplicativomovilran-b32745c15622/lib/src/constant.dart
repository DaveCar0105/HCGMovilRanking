import 'package:flutter/material.dart';

class Constant {
  static const URL = '192.168.100.5:3001';
  static const DB_NAME = 'HcgRankingV1';
  static const NAME_PREFERENCE = 'rankingHCG2021';
  static const BANDERA_PREFERENCE = 'rankingHCGBandera';
  static const COLOR_PRIMARY = Colors.white;
  //static const COLOR_SECONDARY = Colors.blueGrey;
  static const COLOR_SECONDARY_HEX = 0xffC4094A;
  static const COLOR_SECONDARY = const MaterialColor(
    COLOR_SECONDARY_HEX,
    const <int, Color>{
      50: const Color(COLOR_SECONDARY_HEX),
      100: const Color(COLOR_SECONDARY_HEX),
      200: const Color(COLOR_SECONDARY_HEX),
      300: const Color(COLOR_SECONDARY_HEX),
      400: const Color(COLOR_SECONDARY_HEX),
      500: const Color(COLOR_SECONDARY_HEX),
      600: const Color(COLOR_SECONDARY_HEX),
      700: const Color(COLOR_SECONDARY_HEX),
      800: const Color(COLOR_SECONDARY_HEX),
      900: const Color(COLOR_SECONDARY_HEX),
    },
  );
  static const ICON_HCG = 'assets/icon/hcg-icon.png';
}

class ConstantDatabase {
  static const DB_COLUMN_TEXT_TAMANIO = 350;
  static const DB_COLUMN_TEXT_PASSWORD = 650;
  static const DB_COLUMN_ESTADO_DEAULT_ACTVIO = 1;
}

class ConstantServicesServer {
  static const CARGUERA_CONTROLLER = 'carguera';
  static const CAUSA_CONTROLLER = 'causa';
  static const CLIENTE_CONTROLLER = 'cliente';
  static const PAIS_CONTROLLER = 'pais';
  static const POSTCOSECHA_CONTROLLER = 'postcosecha';
  static const PRODUCTO_CONTROLLER = 'producto';
  static const TIPO_CAJA_CONTROLLER = 'tipo-caja';
  //static const TIPO_CAJA_CONTROLLER = 'usuario';
  static const VARIEDAD_CONTROLLER = 'variedad';
}
