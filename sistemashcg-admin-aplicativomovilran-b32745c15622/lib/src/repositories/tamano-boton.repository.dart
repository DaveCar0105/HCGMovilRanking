import 'package:ranking_app/src/database-creator.dart';
import 'package:ranking_app/src/dtos/tamano-boton.dto.dart';
import 'package:ranking_app/src/repositories/error.repository.dart';

class TamanoBotonRepository {
  final ErrorRepository _errorRepository;
  final moduloRepository = 'TamanioBoton';

  TamanoBotonRepository(this._errorRepository);

  Future<bool> insert(TamanoBotonDto tamanoBotonDto) async {
    final sql = '''INSERT INTO ${DatabaseCreator.procesoTamanioBotonTable}(
  ${DatabaseCreator.procesoTamanioBotonFecha},${DatabaseCreator.variedadId},
  ${DatabaseCreator.procesoTamanioBotonGradoVariedad},${DatabaseCreator.procesoTamanioBotonLargoArea},${DatabaseCreator.procesoTamanioBotonAnchoArea},
  ${DatabaseCreator.procesoTamanioBotonAreaRamo},${DatabaseCreator.procesoTamanioBotonTamanoBoton1},${DatabaseCreator.procesoTamanioBotonTamanoBoton2},
  ${DatabaseCreator.procesoTamanioBotonTamanoBoton3},${DatabaseCreator.procesoTamanioBotonTamanoBotonPromedio},${DatabaseCreator.procesoTamanioBotonNumeroPetalos}
  )
  VALUES(
    ${tamanoBotonDto.procesoTamanioBotonFecha},${tamanoBotonDto.variedadId},
    ${tamanoBotonDto.procesoTamanioBotonGradoVariedad},${tamanoBotonDto.procesoTamanioBotonLargoArea},${tamanoBotonDto.procesoTamanioBotonAnchoArea},
    ${tamanoBotonDto.procesoTamanioBotonAreaRamo},${tamanoBotonDto.procesoTamanioBotonTamanoBoton1},${tamanoBotonDto.procesoTamanioBotonTamanoBoton2},
    ${tamanoBotonDto.procesoTamanioBotonTamanoBoton3},${tamanoBotonDto.procesoTamanioBotonTamanoBotonPromedio},${tamanoBotonDto.procesoTamanioBotonNumeroPetalos}
  )''';
    int id = await db.rawInsert(sql);
    return id > 0 ? true : false;
  }

// Future<List<TamanoBotonDto>> selecAll()async{
//   List<TamanoBotonDto> tamanioBotonDto = List();
//   try{
//     final sql=''' SELECT * FROM ${DatabaseCreator.procesoTamanioBotonTable}
//     WHERE ${DatabaseCreator.procesoTamanioBotonEstado}=${ConstantDatabase.DB_COLUMN_ESTADO_DEAULT_ACTVIO};''';
//     final data = await db.rawQuery(sql);
//     for(final node in data){
//       tamanioBotonDto.add(new TamanoBotonDto(
//         procesoTamanioBotonId:
//       ))
//     }

//   }catch(ex){

//   }
//   return tamanioBotonDto;
// }

}
