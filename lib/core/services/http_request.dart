import 'package:dio/dio.dart';

import 'config.dart';



class HttpRequest{
  static BaseOptions baseOptions = BaseOptions(
    baseUrl: HttpConfig.baseUrl,
    // 超时时间毫秒
    //   connectTimeout: HttpConfig.connectTimeout
    connectTimeout:  const Duration(  milliseconds: HttpConfig.connectTimeout)
  );
  static final dio=Dio(baseOptions);
  static Future<T> request<T>(String url,{String method='get',  Map<String,dynamic>? params,Interceptor? interceptor}) async{
    try{
      final options = Options(method: method);
      // 创建全局拦截器
      InterceptorsWrapper interceptorsWrapper = InterceptorsWrapper(
        onRequest: (options, handler) {
          print('请求拦截');
          // Do something before request is sent
          return handler.next(options); //continue
        },
        onResponse: (response, handler) {
          // Do something with response data
          print('响应拦截');
          return handler.next(response); // continue
        },
        onError: (DioException e, handler) {
          // Do something with response error
          return handler.next(e); //continue
        },
      );
      dio.interceptors.add(interceptorsWrapper);
      if(interceptor != null){
        dio.interceptors.add(interceptor);
      }
      Response res= await  dio.request(url,queryParameters: params, options: options);
      return res.data;
    }on DioException catch(e){
      return Future.error(e);
    }

  }
  static void post() {}
  static void get() {}
}