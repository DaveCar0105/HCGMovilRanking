import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ranking_app/src/constant.dart';
import 'package:ranking_app/src/dtos/carguera.dto.dart';
import 'package:ranking_app/src/dtos/causa.dto.dart';
import 'package:ranking_app/src/dtos/cliente.dto.dart';
import 'package:ranking_app/src/dtos/info-adic.dto.dart';
import 'package:ranking_app/src/dtos/maltrato.dt.dart';
import 'package:ranking_app/src/dtos/pais.dto.dart';
import 'package:ranking_app/src/dtos/postcosecha.dto.dart';
import 'package:ranking_app/src/dtos/producto.dto.dart';
import 'package:ranking_app/src/dtos/tamano-boton.dto.dart';
import 'package:ranking_app/src/dtos/tipo-caja.dto.dart';
import 'package:ranking_app/src/dtos/variedad.dto.dart';
import 'package:ranking_app/src/preference.dart';
import 'package:ranking_app/src/repositories/carguera.repository.dart';
import 'package:ranking_app/src/repositories/causa.repository.dart';
import 'package:ranking_app/src/repositories/cliente.repository.dart';
import 'package:ranking_app/src/repositories/error.repository.dart';
import 'package:ranking_app/src/repositories/informacion-adicional.repository.dart';
import 'package:ranking_app/src/repositories/maltrato.repository.dart';
import 'package:ranking_app/src/repositories/pais.repository.dart';
import 'package:ranking_app/src/repositories/postcosecha.repository.dart';
import 'package:ranking_app/src/repositories/producto.repository.dart';
import 'package:ranking_app/src/repositories/tamano-boton.repository.dart';
import 'package:ranking_app/src/repositories/tipo-caja.repository.dart';
import 'package:ranking_app/src/repositories/variedad.repository.dart';

class SincronizeServerInformation {
  Map<String, String> headers;
  Preferences pref = Preferences();
  final ErrorRepository _errorRepository;
  final CargueraRepository _cargueraRepository;
  final CausaRepository _causaRepository;
  final ClienteRepository _clienteRepository;
  final PaisRepository _paisRepository;
  final PostcosechaRepository _postcosechaRepository;
  final ProductoRepository _productoRepository;
  final TipoCajaRepository _tipoCajaRepository;
  final VariedadRepository _variedadRepository;

  final TamanoBotonRepository _tamanoBotonRepository;
  final MaltratoRepository _maltratoRepository;
  final InformacionAdicionalRepository _informacionAdicionalRepository;

  final moduloService = 'SincronizeServerInformation';

  SincronizeServerInformation(
      this._errorRepository,
      this._cargueraRepository,
      this._causaRepository,
      this._clienteRepository,
      this._paisRepository,
      this._postcosechaRepository,
      this._productoRepository,
      this._tipoCajaRepository,
      this._variedadRepository,
      this._tamanoBotonRepository,
      this._maltratoRepository,
      this._informacionAdicionalRepository);

  Future<void> sincronized() async {
    print("carguera");
    await this._getAllCarguera();
    print("causa");
    await this._getAllCausa();
    print("cliente");
    await this._getAllCliente();
    print("pais");
    await this._getAllPais();
    print("postcosecha");
    await this._getAllPostcosecha();
    print("producto");
    await this._getAllProducto();
    print("tipo-caja");
    await this._getAllTipoCaja();
    print("variedad");
    await this._getAllVariedad();
    /*print("tamano-boton");
    await this._getAllTamanoBoton();
    print("maltrato");
    await this._getMaltrato();
    print("informacion-adicional");
    await this._getInformacionAdicional();*/
  }

  Future<void> _getAllCarguera() async {
    String nameServiceServer = 'Carguera ';
    this.headers = this.pref.headerAutentication ?? null;
    try {
      final url =
          Uri.http(Constant.URL, ConstantServicesServer.CARGUERA_CONTROLLER);
      final respuesta = await http.get(url, headers: this.headers);
      if (respuesta.statusCode >= 200 && respuesta.statusCode <= 299) {
        List<CargueraDto> cargueras = jsonDecode(respuesta.body.toString())
            .map<CargueraDto>((e) => CargueraDto.fromJson(e))
            .toList();
        for (CargueraDto carguera in cargueras) {
          try {
            await this._cargueraRepository.insert(carguera);
          } catch (DatabaseException) {
            await this._cargueraRepository.update(carguera);
          }
        }
        List<CargueraDto> lsitaFinal =
            await this._cargueraRepository.selectAll();
        print(jsonEncode(lsitaFinal));
        return true;
      }
      await this._errorRepository.addErrorWithDetalle(
          moduloService, nameServiceServer + respuesta.statusCode.toString());
      return false;
    } catch (ex) {
      await this._errorRepository.addErrorWithDetalle(
          moduloService, nameServiceServer + ex.toString());
      return false;
    }
  }

  Future<void> _getAllCausa() async {
    String nameServiceServer = 'Causa ';
    this.headers = this.pref.headerAutentication ?? null;
    try {
      final url =
          Uri.http(Constant.URL, ConstantServicesServer.CAUSA_CONTROLLER);
      final respuesta = await http.get(url, headers: this.headers);
      if (respuesta.statusCode >= 200 && respuesta.statusCode <= 299) {
        List<CausaDto> causas = jsonDecode(respuesta.body.toString())
            .map<CausaDto>((e) => CausaDto.fromJson(e))
            .toList();
        for (CausaDto causa in causas) {
          try {
            await this._causaRepository.insert(causa);
          } catch (DatabaseException) {
            await this._causaRepository.update(causa);
          }
        }
        List<CausaDto> lsitaFinal = await this._causaRepository.selectAll();
        print(jsonEncode(lsitaFinal));
        return true;
      }
      await this._errorRepository.addErrorWithDetalle(
          moduloService, nameServiceServer + respuesta.statusCode.toString());
      return false;
    } catch (ex) {
      await this._errorRepository.addErrorWithDetalle(
          moduloService, nameServiceServer + ex.toString());
      return false;
    }
  }

  Future<void> _getAllCliente() async {
    String nameServiceServer = 'Cliente ';
    this.headers = this.pref.headerAutentication ?? null;
    try {
      final url =
          Uri.http(Constant.URL, ConstantServicesServer.CLIENTE_CONTROLLER);
      final respuesta = await http.get(url, headers: this.headers);
      if (respuesta.statusCode >= 200 && respuesta.statusCode <= 299) {
        List<ClienteDto> clientes = jsonDecode(respuesta.body.toString())
            .map<ClienteDto>((e) => ClienteDto.fromJson(e))
            .toList();
        for (ClienteDto cliente in clientes) {
          try {
            await this._clienteRepository.insert(cliente);
          } catch (DatabaseException) {
            await this._clienteRepository.update(cliente);
          }
        }
        List<ClienteDto> lsitaFinal = await this._clienteRepository.selectAll();
        print(jsonEncode(lsitaFinal));
        return true;
      }
      await this._errorRepository.addErrorWithDetalle(
          moduloService, nameServiceServer + respuesta.statusCode.toString());
      return false;
    } catch (ex) {
      await this._errorRepository.addErrorWithDetalle(
          moduloService, nameServiceServer + ex.toString());
      return false;
    }
  }

  Future<void> _getAllPais() async {
    String nameServiceServer = 'Pais ';
    this.headers = this.pref.headerAutentication ?? null;
    try {
      final url =
          Uri.http(Constant.URL, ConstantServicesServer.PAIS_CONTROLLER);
      final respuesta = await http.get(url, headers: this.headers);
      if (respuesta.statusCode >= 200 && respuesta.statusCode <= 299) {
        List<PaisDto> paises = jsonDecode(respuesta.body.toString())
            .map<PaisDto>((e) => PaisDto.fromJson(e))
            .toList();
        for (PaisDto pias in paises) {
          try {
            await this._paisRepository.insert(pias);
          } catch (DatabaseException) {
            await this._paisRepository.update(pias);
          }
        }
        List<PaisDto> lsitaFinal = await this._paisRepository.selectAll();
        print(jsonEncode(lsitaFinal));
        return true;
      }
      await this._errorRepository.addErrorWithDetalle(
          moduloService, nameServiceServer + respuesta.statusCode.toString());
      return false;
    } catch (ex) {
      await this._errorRepository.addErrorWithDetalle(
          moduloService, nameServiceServer + ex.toString());
      return false;
    }
  }

  Future<void> _getAllPostcosecha() async {
    String nameServiceServer = 'Postcosecha ';
    this.headers = this.pref.headerAutentication ?? null;
    try {
      final url =
          Uri.http(Constant.URL, ConstantServicesServer.POSTCOSECHA_CONTROLLER);
      final respuesta = await http.get(url, headers: this.headers);
      if (respuesta.statusCode >= 200 && respuesta.statusCode <= 299) {
        List<PostcosechaDto> postcosechas =
            jsonDecode(respuesta.body.toString())
                .map<PostcosechaDto>((e) => PostcosechaDto.fromJson(e))
                .toList();
        for (PostcosechaDto postcosecha in postcosechas) {
          try {
            await this._postcosechaRepository.insert(postcosecha);
          } catch (DatabaseException) {
            await this._postcosechaRepository.update(postcosecha);
          }
        }
        List<PostcosechaDto> lsitaFinal =
            await this._postcosechaRepository.selectAll();
        print(jsonEncode(lsitaFinal));
        return true;
      }
      await this._errorRepository.addErrorWithDetalle(
          moduloService, nameServiceServer + respuesta.statusCode.toString());
      return false;
    } catch (ex) {
      await this._errorRepository.addErrorWithDetalle(
          moduloService, nameServiceServer + ex.toString());
      return false;
    }
  }

  Future<void> _getAllProducto() async {
    String nameServiceServer = 'Producto ';
    this.headers = this.pref.headerAutentication ?? null;
    try {
      final url =
          Uri.http(Constant.URL, ConstantServicesServer.PRODUCTO_CONTROLLER);
      final respuesta = await http.get(url, headers: this.headers);
      if (respuesta.statusCode >= 200 && respuesta.statusCode <= 299) {
        List<ProductoDto> productos = jsonDecode(respuesta.body.toString())
            .map<ProductoDto>((e) => ProductoDto.fromJson(e))
            .toList();
        for (ProductoDto producto in productos) {
          try {
            await this._productoRepository.insert(producto);
          } catch (DatabaseException) {
            await this._productoRepository.update(producto);
          }
        }
        List<ProductoDto> lsitaFinal =
            await this._productoRepository.selectAll();
        print(jsonEncode(lsitaFinal));
        return true;
      }
      await this._errorRepository.addErrorWithDetalle(
          moduloService, nameServiceServer + respuesta.statusCode.toString());
      return false;
    } catch (ex) {
      await this._errorRepository.addErrorWithDetalle(
          moduloService, nameServiceServer + ex.toString());
      return false;
    }
  }

  Future<void> _getAllTipoCaja() async {
    String nameServiceServer = 'Tipo-Caja ';
    this.headers = this.pref.headerAutentication ?? null;
    try {
      final url =
          Uri.http(Constant.URL, ConstantServicesServer.TIPO_CAJA_CONTROLLER);
      final respuesta = await http.get(url, headers: this.headers);
      if (respuesta.statusCode >= 200 && respuesta.statusCode <= 299) {
        List<TipoCajaDto> tipoCajas = jsonDecode(respuesta.body.toString())
            .map<TipoCajaDto>((e) => TipoCajaDto.fromJson(e))
            .toList();
        for (TipoCajaDto tipoCaja in tipoCajas) {
          try {
            await this._tipoCajaRepository.insert(tipoCaja);
          } catch (DatabaseException) {
            await this._tipoCajaRepository.update(tipoCaja);
          }
        }
        List<TipoCajaDto> lsitaFinal =
            await this._tipoCajaRepository.selectAll();
        print(jsonEncode(lsitaFinal));
        return true;
      }
      await this._errorRepository.addErrorWithDetalle(
          moduloService, nameServiceServer + respuesta.statusCode.toString());
      return false;
    } catch (ex) {
      await this._errorRepository.addErrorWithDetalle(
          moduloService, nameServiceServer + ex.toString());
      return false;
    }
  }

  Future<void> _getAllVariedad() async {
    String nameServiceServer = 'Variedad ';
    this.headers = this.pref.headerAutentication ?? null;
    try {
      final url =
          Uri.http(Constant.URL, ConstantServicesServer.VARIEDAD_CONTROLLER);
      final respuesta = await http.get(url, headers: this.headers);
      if (respuesta.statusCode >= 200 && respuesta.statusCode <= 299) {
        List<VariedadDto> variedades = jsonDecode(respuesta.body.toString())
            .map<VariedadDto>((e) => VariedadDto.fromJson(e))
            .toList();
            print(respuesta.body.toString());
        for (VariedadDto variedad in variedades) {
          try {
            await this._variedadRepository.insert(variedad);
          } catch (DatabaseException) {
            await this._variedadRepository.update(variedad);
          }
        }
        List<VariedadDto> lsitaFinal =
            await this._variedadRepository.selectAll();
        print(jsonEncode(lsitaFinal));
        return true;
      }
      await this._errorRepository.addErrorWithDetalle(
          moduloService, nameServiceServer + respuesta.statusCode.toString());
      return false;
    } catch (ex) {
      await this._errorRepository.addErrorWithDetalle(
          moduloService, nameServiceServer + ex.toString());
      return false;
    }
  }

  Future<void> _getAllTamanoBoton() async {
    String nameServiceServer = 'proceso-tamano-boton';
    this.headers = this.pref.headerAutentication ?? null;
    try {
      final url = Uri.http(
          Constant.URL, ConstantServicesServer.PROCESO_TAMANO_BOTON_CONTROLLER);
      final respuesta = await http.get(url, headers: this.headers);
      if (respuesta.statusCode >= 200 && respuesta.statusCode <= 299) {
        List<TamanoBotonDto> tamanoBotons =
            jsonDecode(respuesta.body.toString())
                .map<TamanoBotonDto>((e) => TamanoBotonDto.fromJson(e))
                .toList();
        for (TamanoBotonDto tamanoBoton in tamanoBotons) {
          await this._tamanoBotonRepository.insert(tamanoBoton);
          // try{
          //   await this._tamanoBotonRepository.insert(tamanoBoton);

          // }catch(DatabaseException){
          //   //await this._tamanoBotonRepository.update(tamanoBoton);
          // }
        }
      }
      await this._errorRepository.addErrorWithDetalle(
          moduloService, nameServiceServer + respuesta.statusCode.toString());
    } catch (ex) {
      await this._errorRepository.addErrorWithDetalle(
          moduloService, nameServiceServer + ex.toString());
      return false;
    }
  }

  Future<void> _getMaltrato() async {
    String nameServiceServer = 'proceso-maltrato';
    this.headers = this.pref.headerAutentication ?? null;
    try {
      final url = Uri.http(
          Constant.URL, ConstantServicesServer.PROCESO_MALTRATO_CONTROLLER);
      final respuesta = await http.get(url, headers: this.headers);
      if (respuesta.statusCode >= 200 && respuesta.statusCode <= 299) {
        List<MaltratoDto> maltratos = jsonDecode(respuesta.body.toString())
            .map<MaltratoDto>((e) => MaltratoDto.fromJson(e))
            .toList();
        for (MaltratoDto maltrato in maltratos) {
          await this._maltratoRepository.insert(maltrato);
        }
      }
      await this._errorRepository.addErrorWithDetalle(
          moduloService, nameServiceServer + respuesta.statusCode.toString());
    } catch (ex) {
      await this._errorRepository.addErrorWithDetalle(
          moduloService, nameServiceServer + ex.toString());
      return false;
    }
  }

  Future<void> _getInformacionAdicional() async {
    String nameServiceServer = 'informacion-auditoria';
    try {
      final url = Uri.http(Constant.URL,
          ConstantServicesServer.INFORMACION_AUDITORIA_CONTROLLER);
      final respuesta = await http.get(url, headers: this.headers);
      if (respuesta.statusCode >= 200 && respuesta.statusCode <= 299) {
        List<InformacionAdicionalDto> informacionAdicionals =
            jsonDecode(respuesta.body.toString())
                .map<InformacionAdicionalDto>(
                    (e) => InformacionAdicionalDto.fromJson(e))
                .toList();
        for (InformacionAdicionalDto informacionAdicion
            in informacionAdicionals) {
          await this._informacionAdicionalRepository.insert(informacionAdicion);
        }
      }
      await this._errorRepository.addErrorWithDetalle(
          moduloService, nameServiceServer + respuesta.statusCode.toString());
    } catch (ex) {
      await this._errorRepository.addErrorWithDetalle(
          moduloService, nameServiceServer + ex.toString());
      return false;
    }
  }
}



/*Future<void> getAllTipoCaja() async {
    final sessionDto = this.pref.getAutentication as SessionDto;
    String token = sessionDto?.accessToken ?? "";
    this.headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer " + token,
    };
    try {
      final url =
          Uri.http(Constant.URL, ConstantServicesServer.TIPO_CAJA_CONTROLLER);
      final respuesta = await http.get(url, headers: this.headers);
      if (respuesta.statusCode >= 200 && respuesta.statusCode <= 299) {
        List<UsuarioDto> usuarios = jsonDecode(respuesta.body.toString())
            .map<UsuarioDto>((e) => UsuarioDto.fromJson(e))
            .toList();
        print(jsonEncode(usuarios));
        return true;
      }
      print(respuesta.statusCode);
      return false;
    } catch (ex) {
      print(ex.toString());
      return false;
    }
  }*/