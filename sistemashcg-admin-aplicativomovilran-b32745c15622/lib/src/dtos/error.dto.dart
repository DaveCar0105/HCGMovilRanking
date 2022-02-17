import 'dart:convert';

import 'package:ranking_app/src/database-creator.dart';

ErrorDto errorFromJson(String str) => ErrorDto.fromJson(json.decode(str));
String errorToJson(ErrorDto data) => json.encode(data.toJson());

class ErrorDto {
  ErrorDto({
    this.errorId,
    this.errorDetalle,
  });

  int errorId;
  String errorDetalle;

  factory ErrorDto.fromJson(Map<String, dynamic> json) => ErrorDto(
        errorId: json[DatabaseCreator.errorId],
        errorDetalle: json[DatabaseCreator.errorDetalle],
      );

  Map<String, dynamic> toJson() => {
        "errorId": errorId,
        "errorDetalle": errorDetalle,
      };
}
