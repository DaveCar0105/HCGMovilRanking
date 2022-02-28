class EvaluacionFincaMock {
  var categorias;

  static Category category = Category()
    ..categoriaId = 1
    ..categoriaNombre = "Boncheadora"
    ..subcategorias = [
      SubCategory()
        ..subcategoriaId = 100
        ..subcategoriaNombre = "Presentacion Bonch"
        ..respuestas = [
          Item()
            ..itemId = 1
            ..itemNombre = "Error Longitud"
            ..itemsRango = [
              Range()
                ..minimo = 1
                ..maximo = 5
                ..cantidadaDisminuir = 30,
              Range()
                ..minimo = 5
                ..maximo = 10
                ..cantidadaDisminuir = 35
            ]
        ],
    ];
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

class Range {
  num minimo;
  num maximo;
  num cantidadaDisminuir;
}
