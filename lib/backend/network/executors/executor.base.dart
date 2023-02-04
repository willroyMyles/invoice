import 'package:dio/dio.dart';

class BaseExecutor {
  late Dio dio;

  BaseExecutor() {
    init();
  }

  init() {
    BaseOptions options = BaseOptions(
      baseUrl: "http://127.0.0.1:8000/",
      headers: {"NS": "invns", "DB": "invdb", "Accept": "application/json"},
    );

    dio = Dio(options);
  }

  addBearerToken(String token) {
    BaseOptions options = BaseOptions(
      baseUrl: "http://127.0.0.1:8000/",
      headers: {
        "NS": "invns",
        "DB": "invdb",
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    dio = Dio(options);
  }

  Future<Response?> getAll(String path) async {
    try {
      var res = await dio.get(path);
      return Future.value(res);
    } catch (e) {
      return null;
    }
  }

  Future<Response?> createTable(String path, dynamic data) async {
    try {
      var res = await dio.post(path, data: data);
      return Future.value(res);
    } catch (e) {
      return null;
    }
  }

  Future<Response?> deleteTable(String path) async {
    try {
      var res = await dio.delete(path);
      return Future.value(res);
    } catch (e) {
      return null;
    }
  }

  Future<Response?> get(String path) async {
    try {
      var res = await dio.get(path);
      return Future.value(res);
    } catch (e) {
      return null;
    }
  }

  Future<Response?> put(String path, dynamic data) async {
    try {
      var res = await dio.put(path, data: data);
      return Future.value(res);
    } catch (e) {
      return null;
    }
  }

  Future<Response?> post(String path, dynamic data) async {
    try {
      var res = await dio.post(path, data: data);
      return Future.value(res);
    } catch (e) {
      return null;
    }
  }

  Future<Response?> patch(String path, dynamic data) async {
    try {
      var res = await dio.patch(path, data: data);
      return Future.value(res);
    } catch (e) {
      return null;
    }
  }

  Future<Response?> delete(String path) async {
    try {
      var res = await dio.delete(path);
      return Future.value(res);
    } catch (e) {
      return null;
    }
  }
}

BaseExecutor _baseExecutor = BaseExecutor();
BaseExecutor get BE => _baseExecutor;
