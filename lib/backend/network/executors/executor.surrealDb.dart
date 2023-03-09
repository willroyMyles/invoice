import 'package:dio/dio.dart';

typedef Converter<T> = T Function(Map<String, dynamic>);

class SurrealDbExecutor {
  late Dio dio;
  BaseOptions options = BaseOptions();

  SurrealDbExecutor();

  addToken(String token) {
    dio.options.headers.update(
      "Token",
      (value) => token,
      ifAbsent: () => token,
    );
  }

  init(
      {String url = "ws://localhost:8000/rpc/",
      String db = "test",
      String ns = "test",
      String accepts = "application/json",
      String token = ""}) {
    options = BaseOptions(
      baseUrl: url,
      headers: {"NS": ns, "DB": db, "Accept": accepts, "Token": token},
    );

    dio = Dio(options);
  }

  Future<List<T>> list<T>(String table, {Converter? withConverter}) async {
    var result = await dio.post("/sql", data: "select * from $table");
    _checkStatus(result);
    Object res = result.data!.first['result'];
    return _getResults(res, withConverter);
  }

  Future<void> authenticate(String token) async {}

  void _checkStatus(Response? result) {
    if (result == null) throw "No Results Received";
    if (result.statusCode! > 299 || result.statusCode! < 200) {
      throw result.statusMessage as String;
    }
  }

  Future create(String table, {String? id, dynamic data}) async {
    var qry = '''create $table content $data''';
    var res = await dio.post("sql/", data: qry);
    return res;
  }

  Future merge(String table, String id, {dynamic data}) async {
    var res = await dio.patch("key/$table/$id".trim(), data: data);
    return res;
  }

  List<T> _getResults<T>(dynamic res, Converter? con) {
    if (res is List) {
      var res1 = res.map<T>((e) {
        if (con != null) {
          return con(e);
        } else {
          return e;
        }
      }).toList();
      return res1;
    }
    if (res is Map<String, dynamic>) {
      if (con != null) {
        return con(res);
      } else {
        return [(res as T)];
      }
    }

    return [];
  }

  Future<List<T>> select<T>(String table,
      {Converter? converter, SelectOptions? options}) async {
    var qry = buildQuery(table: table, opt: options);
    var result = await dio.post("sql/", data: qry);
    Object res = result.data!.first['result'];
    return _getResults(res, converter);
  }

  String buildQuery({String table = "", SelectOptions? opt}) {
    String qry = 'select * from $table';
    if (opt != null) {
      qry = '''select 
      ${opt.projections ?? '*'}
      from ${opt.from ?? table}
      ${opt.where ?? ''}
      ${opt.splitAt != null ? 'split ${opt.splitAt}' : ''}
      ${opt.groupBy != null ? 'group by ${opt.groupBy}' : ''}
      ${opt.orderBy != null ? 'order by ${opt.orderBy}' : ''}
      ${opt.limit != null ? 'limit ${opt.limit}' : ''}
      ${opt.start != null ? 'start ${opt.start}' : ''}
      ${opt.fetch != null ? 'fetch ${opt.fetch}' : ''}
      ${opt.timeout != null ? 'timeout ${opt.timeout}s' : ''}
      ${opt.parallel ? 'parallel' : ''}
      ''';
    }
    return qry.replaceAll('\n', ' ');
  }
}

class CreateOptions {}

class SelectOptions {
  String? projections;
  String? from;
  String? where;
  String? splitAt;
  String? groupBy;
  String? orderBy;
  int? limit;
  int? start;
  String? fetch;
  int? timeout;
  bool parallel = false;

  SelectOptions({
    this.projections,
    this.from,
    this.where,
    this.splitAt,
    this.groupBy,
    this.orderBy,
    this.limit,
    this.start,
    this.fetch,
    this.timeout,
    this.parallel = false,
  });
}
