import 'dart:convert';

Range rangeFromJson(String str) => Range.fromJson(json.decode(str));

String rangeToJson(Range data) => json.encode(data.toJson());

class Range {
  Range({
    this.minimo,
    this.maximo,
    this.cantidadaDisminuir,
  });

  num minimo;
  num maximo;
  num cantidadaDisminuir;

  factory Range.fromJson(Map<String, dynamic> json) => Range(
        minimo: json["minimo"],
        maximo: json["maximo"],
        cantidadaDisminuir: json["cantidadaDisminuir"],
      );

  Map<String, dynamic> toJson() => {
        "minimo": minimo,
        "maximo": maximo,
        "cantidadaDisminuir": cantidadaDisminuir,
      };
}
