import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:untitled/network/response/cat_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

part 'api_service.g.dart';

@RestApi(baseUrl:"https://api.thecatapi.com/")
abstract class ApiService{

  factory ApiService(Dio dio, {String? baseUrl}) {
    dio.options = BaseOptions(
      headers: {
        'x-api-key' : 'd64f0810-5b68-4e9f-b18e-bc1dea001957'
      }
    );

    return _ApiService(dio, baseUrl: baseUrl);
  }

  static ApiService create(){
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return ApiService(dio);
  }

  @GET('v1/breeds/search?q={name}')
  Future<List<CatSearchResponse>> getData(@Path("name") String name);


}