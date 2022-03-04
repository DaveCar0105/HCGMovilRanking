import 'package:ranking_app/src/dtos/range.dto.dart';

class EvaluacionFincaMock {
  var categorias;

  static Category category = Category()
    ..categoriaId = 1
    ..categoriaNombre = "Boncheadora"
    ..subcategorias = [
      SubCategory()
        ..subcategoriaId = 100
        ..subcategoriaNombre = "presentacionBonch"
        ..subcategoriaNombreDesplazar = 'Presentacion Bonch'
        ..respuestas = [
          Item()
            ..itemId = 1
            ..itemNombre = "errorLongitud"
            ..itemNombreMostrar = "Error Longitud"
            ..itemsRango = [
              Range()
                ..minimo = 1
                ..maximo = 5
                ..cantidadaDisminuir = 30,
              Range()
                ..minimo = 5
                ..maximo = 10
                ..cantidadaDisminuir = 35
            ],
          Item()
            ..itemId = 1
            ..itemNombre = "numeroGrapasStandartFinca"
            ..itemNombreMostrar = "Nº grapas stándard Finca"
            ..itemsRango = [
              Range()
                ..minimo = 1
                ..maximo = 5
                ..cantidadaDisminuir = 30,
              Range()
                ..minimo = 5
                ..maximo = 10
                ..cantidadaDisminuir = 35
            ],
        ],
      SubCategory()
        ..subcategoriaId = 100
        ..subcategoriaNombre = "boton"
        ..subcategoriaNombreDesplazar = 'Botón'
        ..respuestas = [
          Item()
            ..itemId = 1
            ..itemNombre = "tallo"
            ..itemNombreMostrar = "Numero Tallo"
            ..itemsRango = [
              Range()
                ..minimo = 1
                ..maximo = 10
                ..cantidadaDisminuir = 2,
              Range()
                ..minimo = 10
                ..maximo = 50
                ..cantidadaDisminuir = 3
            ]
        ]
    ];
}

class DynamicForm {
  int id;
  String formularioNombreDesplazar;
  List<Category> categorias;
}

class Category {
  num categoriaId;
  String categoriaNombre;
  List subcategorias;
}

class SubCategory {
  num subcategoriaId;
  String subcategoriaNombre;
  String subcategoriaNombreDesplazar;
  List<Item> respuestas;
}

class Item {
  num itemId;
  String itemNombre;
  String itemNombreMostrar;
  List<Range> itemsRango;
  num cantidadRespuesta;
  num totalRespuesta;
}
