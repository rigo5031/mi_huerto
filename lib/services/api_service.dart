import 'dart:convert';
import 'package:dio/dio.dart';
import '../models/planta.dart';

class ApiService {
  final String baseUrl = "http://169.254.228.189:4000/api";
  final Dio dio = Dio();


  Future<List<Planta>> obtenerPlantas() async {
    try {
      final response = await dio.get('$baseUrl/plantas');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => Planta.fromJson(json)).toList();
      } else {
        throw Exception("Error al obtener las plantas");
      }
    } catch (e) {
      throw Exception("Error al obtener las plantas: $e");
    }
  }


  Future<bool> agregarPlanta(Planta planta) async {
    try {
      final response = await dio.post(
        '$baseUrl/plantas',
        data: jsonEncode(planta.toJson()),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      return response.statusCode == 201; 
    } catch (e) {
      throw Exception("Error al agregar la planta: $e");
    }
  }

  // Editar una planta existente
  Future<bool> editarPlanta(int id, Planta planta) async {
    try {
      final response = await dio.put(
        '$baseUrl/plantas/$id',
        data: jsonEncode(planta.toJson()),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      return response.statusCode == 200; 
    } catch (e) {
      throw Exception("Error al editar la planta: $e");
    }
  }


  Future<bool> eliminarPlanta(int id) async {
    try {
      final response = await dio.delete('$baseUrl/plantas/$id');

      return response.statusCode == 200;
    } catch (e) {
      throw Exception("Error al eliminar la planta: $e");
    }
  }


  Future<bool> registrarUsuario(String nombre, String correo, String contrasena) async {
    try {
      final response = await dio.post(
        '$baseUrl/auth/register',
        data: jsonEncode({
          'nombre': nombre,
          'correo': correo,
          'contrasena': contrasena,
        }),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      return response.statusCode == 201;
    } catch (e) {
      throw Exception("Error al registrar el usuario: $e");
    }
  }

  Future<String?> iniciarSesion(String correo, String contrasena) async {
    try {
      final response = await dio.post(
        '$baseUrl/auth/login',
        data: jsonEncode({
          'correo': correo,
          'contrasena': contrasena,
        }),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data;
        return data['token'];
      } else {
        throw Exception("Error en las credenciales");
      }
    } catch (e) {
      throw Exception("Error en el login: $e");
    }
  }
}
