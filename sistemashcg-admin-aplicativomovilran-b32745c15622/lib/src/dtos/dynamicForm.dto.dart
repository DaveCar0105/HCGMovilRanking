// To parse this JSON data, do
//
//     final form = formFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

List<DynamicForm> formFromJson(String str) => List<DynamicForm>.from(
    json.decode(str).map((x) => DynamicForm.fromJson(x)));

String formToJson(List<DynamicForm> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DynamicForm {
  DynamicForm({
    this.id,
    this.fechaHoraRegistro,
    this.fechaHoraActualizacion,
    this.formularioNombre,
    this.formularioNombreDesplazar,
    this.estado,
    this.formularioItems,
  });

  int id;
  DateTime fechaHoraRegistro;
  DateTime fechaHoraActualizacion;
  String formularioNombre;
  String formularioNombreDesplazar;
  int estado;
  List<FormularioItem> formularioItems;

  factory DynamicForm.fromJson(Map<String, dynamic> json) => DynamicForm(
        id: json["id"],
        fechaHoraRegistro: DateTime.parse(json["fechaHoraRegistro"]),
        fechaHoraActualizacion: DateTime.parse(json["fechaHoraActualizacion"]),
        formularioNombre: json["formularioNombre"],
        formularioNombreDesplazar: json["formularioNombreDesplazar"],
        estado: json["estado"],
        formularioItems: List<FormularioItem>.from(
          json["formularioItems"]?.map(
                (x) => FormularioItem.fromJson(x),
              ) ??
              [],
        ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fechaHoraRegistro": fechaHoraRegistro.toIso8601String(),
        "fechaHoraActualizacion": fechaHoraActualizacion.toIso8601String(),
        "formularioNombre": formularioNombre,
        "formularioNombreDesplazar": formularioNombreDesplazar,
        "estado": estado,
        "formularioItems":
            List<dynamic>.from(formularioItems.map((x) => x.toJson())),
      };
}

class FormularioItem {
  FormularioItem({
    this.id,
    this.idFormulario,
    this.idItem,
    this.item,
  });

  int id;
  int idFormulario;
  int idItem;
  Item item;

  factory FormularioItem.fromJson(Map<String, dynamic> json) => FormularioItem(
        id: json["id"],
        idFormulario: json["idFormulario"],
        idItem: json["idItem"],
        item: Item.fromJson(json["item"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idFormulario": idFormulario,
        "idItem": idItem,
        "item": item.toJson(),
      };
}

class Item extends Equatable {
  Item({
    this.id,
    this.fechaHoraRegistro,
    this.fechaHoraActualizacion,
    this.itemNombre,
    this.estado,
    this.idSubcategoria,
    this.itemsRango,
    this.subcategoria,
  });

  int id;
  DateTime fechaHoraRegistro;
  DateTime fechaHoraActualizacion;
  String itemNombre;
  int estado;
  int idSubcategoria;
  List<ItemsRango> itemsRango;
  Subcategoria subcategoria;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        fechaHoraRegistro: DateTime.parse(json["fechaHoraRegistro"]),
        fechaHoraActualizacion: DateTime.parse(json["fechaHoraActualizacion"]),
        itemNombre: json["itemNombre"],
        estado: json["estado"],
        idSubcategoria: json["idSubcategoria"],
        itemsRango: List<ItemsRango>.from(
            json["itemsRango"].map((x) => ItemsRango.fromJson(x))),
        subcategoria: Subcategoria.fromJson(json["subcategoria"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fechaHoraRegistro": fechaHoraRegistro.toIso8601String(),
        "fechaHoraActualizacion": fechaHoraActualizacion.toIso8601String(),
        "itemNombre": itemNombre,
        "estado": estado,
        "idSubcategoria": idSubcategoria,
        "itemsRango": List<dynamic>.from(itemsRango.map((x) => x.toJson())),
        "subcategoria": subcategoria.toJson(),
      };

  @override
  List<Object> get props => [id];
}

class ItemsRango {
  ItemsRango({
    this.id,
    this.fechaHoraRegistro,
    this.fechaHoraActualizacion,
    this.orden,
    this.idItem,
    this.idRango,
    this.rango,
  });

  int id;
  DateTime fechaHoraRegistro;
  DateTime fechaHoraActualizacion;
  int orden;
  int idItem;
  int idRango;
  Rango rango;

  factory ItemsRango.fromJson(Map<String, dynamic> json) => ItemsRango(
        id: json["id"],
        fechaHoraRegistro: DateTime.parse(json["fechaHoraRegistro"]),
        fechaHoraActualizacion: DateTime.parse(json["fechaHoraActualizacion"]),
        orden: json["orden"],
        idItem: json["idItem"],
        idRango: json["idRango"],
        rango: Rango.fromJson(json["rango"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fechaHoraRegistro": fechaHoraRegistro.toIso8601String(),
        "fechaHoraActualizacion": fechaHoraActualizacion.toIso8601String(),
        "orden": orden,
        "idItem": idItem,
        "idRango": idRango,
        "rango": rango.toJson(),
      };
}

class Rango {
  Rango({
    this.id,
    this.fechaHoraRegistro,
    this.fechaHoraActualizacion,
    this.minimo,
    this.maximo,
    this.cantidadDisminuir,
    this.rangoNombre,
    this.estado,
  });

  int id;
  DateTime fechaHoraRegistro;
  DateTime fechaHoraActualizacion;
  int minimo;
  int maximo;
  int cantidadDisminuir;
  String rangoNombre;
  int estado;

  factory Rango.fromJson(Map<String, dynamic> json) => Rango(
        id: json["id"],
        fechaHoraRegistro: DateTime.parse(json["fechaHoraRegistro"]),
        fechaHoraActualizacion: DateTime.parse(json["fechaHoraActualizacion"]),
        minimo: json["minimo"],
        maximo: json["maximo"],
        cantidadDisminuir: json["cantidadDisminuir"],
        rangoNombre: json["rangoNombre"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fechaHoraRegistro": fechaHoraRegistro.toIso8601String(),
        "fechaHoraActualizacion": fechaHoraActualizacion.toIso8601String(),
        "minimo": minimo,
        "maximo": maximo,
        "cantidadDisminuir": cantidadDisminuir,
        "rangoNombre": rangoNombre,
        "estado": estado,
      };
}

class Subcategoria extends Equatable {
  Subcategoria({
    this.id,
    this.fechaHoraRegistro,
    this.fechaHoraActualizacion,
    this.subcategoriaNombre,
    this.estado,
    this.idCategoria,
    this.categoria,
  });

  final int id;
  final DateTime fechaHoraRegistro;
  final DateTime fechaHoraActualizacion;
  final String subcategoriaNombre;
  final int estado;
  final int idCategoria;
  final Categoria categoria;

  factory Subcategoria.fromJson(Map<String, dynamic> json) => Subcategoria(
        id: json["id"],
        fechaHoraRegistro: DateTime.parse(json["fechaHoraRegistro"]),
        fechaHoraActualizacion: DateTime.parse(json["fechaHoraActualizacion"]),
        subcategoriaNombre: json["subcategoriaNombre"],
        estado: json["estado"],
        idCategoria: json["idCategoria"],
        categoria: Categoria.fromJson(json["categoria"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fechaHoraRegistro": fechaHoraRegistro.toIso8601String(),
        "fechaHoraActualizacion": fechaHoraActualizacion.toIso8601String(),
        "subcategoriaNombre": subcategoriaNombre,
        "estado": estado,
        "idCategoria": idCategoria,
        "categoria": categoria.toJson(),
      };

  List<Object> get props => [id];
}

class Categoria extends Equatable {
  Categoria({
    this.id,
    this.fechaHoraRegistro,
    this.fechaHoraActualizacion,
    this.categoriaNombre,
    this.estado,
  });

  final int id;
  final DateTime fechaHoraRegistro;
  final DateTime fechaHoraActualizacion;
  final String categoriaNombre;
  final int estado;

  factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
        id: json["id"],
        fechaHoraRegistro: DateTime.parse(json["fechaHoraRegistro"]),
        fechaHoraActualizacion: DateTime.parse(json["fechaHoraActualizacion"]),
        categoriaNombre: json["categoriaNombre"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fechaHoraRegistro": fechaHoraRegistro.toIso8601String(),
        "fechaHoraActualizacion": fechaHoraActualizacion.toIso8601String(),
        "categoriaNombre": categoriaNombre,
        "estado": estado,
      };

  @override
  List<Object> get props => [id];
}
