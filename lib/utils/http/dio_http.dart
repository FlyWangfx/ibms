import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ibms/utils/dart_packages/pretty_dio_logger_util.dart';
import 'package:ibms/utils/http/sx_api.dart';

class DioHttp {
  static const List<String> state_success = ['success', 'ok'];
  static const String _basicAuth = 'bW9iaWxlOjEyMzQ1Ng==';
  static const String _bimAuth =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiemgiLCJleHAiOjE2MTU5NzA3MDMsImlzcyI6IkJFIiwiYXVkIjoiQkUyQklNIn0.CJ62896tJ-AjPiROFZBArFF4LMzdwkdIsl6N_pyWzXg';
  static String? bimServiceUrl;
  String? _baseUrl;

  set baseUrl(String? value) {
    _baseUrl = value;
    if (_baseUrl != null && _baseUrl!.isNotEmpty) _dio.options.baseUrl = _baseUrl!;
  }

  String? get baseUrl => _baseUrl;

  static String? bearAuth;

  /// 单例模式
  late final Dio _dio;

  DioHttp._() {
    _initDio();
  }

  static DioHttp _instance = DioHttp._();

  factory DioHttp.instance() => _instance;

  /// 私有方法
  void _initDio() {
    _dio = Dio();
    _dio.interceptors.add(PrettyDioLoggerUtil.prettyDioLogger);
    // 拦截器
    _addInterceptorsWrapper();
  }

  /// 1.请求loading
  /// 2.请求错误统一处理弹窗
  void _addInterceptorsWrapper() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          if (options.path.startsWith(SxApi.env)) {
            // 不需要添加authorization
          } else if (bimServiceUrl != null && bimServiceUrl!.isNotEmpty && options.path.startsWith(bimServiceUrl!)) {
            options.headers['Authorization'] = 'Bearer $_bimAuth';
          } else {
            // 发送请求前设置 Authorization
            if (options.path.contains(SxApi.auth_signIn)) {
              options.headers['Authorization'] = 'Basic $_basicAuth';
            } else {
              if (bearAuth != null) {
                options.headers['Authorization'] = 'Bearer $bearAuth';
              }
            }
          }

          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          if (response.data is String) {
            response.data = jsonDecode(response.data);
          }
          // 存在 {"state":"success","msg":null,"obj":null}
          return handler.next(response);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) {
          return handler.next(e);
        },
      ),
    );
  }

  /// Dio 核心 API ,其他 API 都是 request 的别名
  Future<Response> _request(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Response response = await _dio.request(
      path,
      queryParameters: queryParameters,
      data: data,
      options: options,
    );
    return response;
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options op = Options(method: 'GET');
    if (options != null) {
      op = options.copyWith(method: 'GET');
    }
    Response response = await _request(
      path,
      queryParameters: queryParameters,
      options: op,
    );
    return response;
  }

  Future<Response> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    data,
    Options? options,
  }) async {
    Options op = Options(method: 'POST');
    if (options != null) {
      op = options.copyWith(method: 'POST');
    }
    Response response = await _request(
      path,
      queryParameters: queryParameters,
      data: data,
      options: op,
    );
    return response;
  }

}
