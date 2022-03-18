// To parse this JSON data, do
//
//     final forms = formsFromJson(jsonString);

import 'dart:convert';

List<Forms> formsFromJson(String str) =>
    List<Forms>.from(json.decode(str).map((x) => Forms.fromJson(x)));

String formsToJson(List<Forms> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Forms {
  Forms({
    this.categorias,
    this.formularioNombreDesplazar,
    this.id,
  });

  List<Categoria> categorias;
  String formularioNombreDesplazar;
  int id;

  factory Forms.fromJson(Map<String, dynamic> json) => Forms(
        categorias: List<Categoria>.from(
            json["categorias"].map((x) => Categoria.fromJson(x))),
        formularioNombreDesplazar: json["formularioNombreDesplazar"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "categorias": List<dynamic>.from(categorias.map((x) => x.toJson())),
        "formularioNombreDesplazar": formularioNombreDesplazar,
        "id": id,
      };
}

class Categoria {
  Categoria({
    this.subcategorias,
    this.categoriaId,
    this.categoriaNombre,
  });

  List<Subcategoria> subcategorias;
  int categoriaId;
  String categoriaNombre;

  factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
        subcategorias: List<Subcategoria>.from(
            json["subcategorias"].map((x) => Subcategoria.fromJson(x))),
        categoriaId: json["categoriaId"],
        categoriaNombre: json["categoriaNombre"],
      );

  Map<String, dynamic> toJson() => {
        "subcategorias":
            List<dynamic>.from(subcategorias.map((x) => x.toJson())),
        "categoriaId": categoriaId,
        "categoriaNombre": categoriaNombre,
      };
}

class Subcategoria {
  Subcategoria({
    this.respuestas,
    this.subcategoriaId,
    this.subcategoriaNombre,
    this.subcategoriaNombreDesplazar,
  });

  List<Respuesta> respuestas;
  int subcategoriaId;
  String subcategoriaNombre;
  String subcategoriaNombreDesplazar;

  factory Subcategoria.fromJson(Map<String, dynamic> json) => Subcategoria(
        respuestas: List<Respuesta>.from(
            json["respuestas"].map((x) => Respuesta.fromJson(x))),
        subcategoriaId: json["subcategoriaId"],
        subcategoriaNombre: json["subcategoriaNombre"],
        subcategoriaNombreDesplazar: json["subcategoriaNombreDesplazar"],
      );

  Map<String, dynamic> toJson() => {
        "respuestas": List<dynamic>.from(respuestas.map((x) => x.toJson())),
        "subcategoriaId": subcategoriaId,
        "subcategoriaNombre": subcategoriaNombre,
        "subcategoriaNombreDesplazar": subcategoriaNombreDesplazar,
      };
}

class Respuesta {
  Respuesta({
    this.itemsRango,
    this.cantidadRespuesta,
    this.totalRespuesta,
    this.itemId,
    this.itemNombre,
    this.itemNombreMostrar,
  });

  List<ItemsRango> itemsRango;
  int cantidadRespuesta;
  int totalRespuesta;
  int itemId;
  String itemNombre;
  String itemNombreMostrar;

  factory Respuesta.fromJson(Map<String, dynamic> json) => Respuesta(
        itemsRango: List<ItemsRango>.from(
            json["itemsRango"].map((x) => ItemsRango.fromJson(x))),
        cantidadRespuesta: json["cantidadRespuesta"],
        totalRespuesta: json["totalRespuesta"],
        itemId: json["itemId"],
        itemNombre: json["itemNombre"],
        itemNombreMostrar: json["itemNombreMostrar"],
      );

  Map<String, dynamic> toJson() => {
        "itemsRango": List<dynamic>.from(itemsRango.map((x) => x.toJson())),
        "cantidadRespuesta": cantidadRespuesta,
        "totalRespuesta": totalRespuesta,
        "itemId": itemId,
        "itemNombre": itemNombre,
        "itemNombreMostrar": itemNombreMostrar,
      };
}

class ItemsRango {
  ItemsRango({
    this.minimo,
    this.maximo,
    this.cantidadaDisminuir,
  });

  int minimo;
  int maximo;
  int cantidadaDisminuir;

  factory ItemsRango.fromJson(Map<String, dynamic> json) => ItemsRango(
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
