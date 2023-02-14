import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;

import '../../../frontend/states/state.global.dart';

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
        "Token": token
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

  void removeToken() {
    init();
    g.Get.find<GlobalState>().isLoggedIn.value = false;
  }

  selectQuery(String table, {Map<String, String>? whereClause}) async {
    try {
      String query;
      if (whereClause == null) {
        query = 'select * from $table ';
      } else {
        var clauses = "";
        var keys = whereClause.keys.toList();
        var values = whereClause.values.toList();
        for (var i = 0; i < whereClause.length; i++) {
          clauses += '${keys[i]}="${values[i]}"';
          if (i != 0 && i != whereClause.length) clauses += " && ";
        }
        query = 'select * from $table where $clauses';
      }
      var res = await BE.post("sql", query);
      var id = (res!.data![0]['result'][0]['id']);
      return id;
    } catch (e) {
      return null;
    }
  }
}

BaseExecutor _baseExecutor = BaseExecutor();
BaseExecutor get BE => _baseExecutor;
