import 'package:dio/dio.dart';
import 'package:mood_up/core/error/exceptions.dart';
import 'package:mood_up/features/home/data/models/home_data_model.dart';
import 'package:mood_up/core/constants/constants.dart' as c;
import 'package:mood_up/core/secrets/app_secrets.dart' as s;

abstract class HomeDataSource{
  Future<List<HomeDataModel>> fetchComics();
}

class HomeDataSourceImpl extends HomeDataSource{
  final List<String> creators=['writer', 'editor', 'letterer'];
  final Dio dio;
  int i=0;
  HomeDataSourceImpl({required this.dio});

  @override
  Future<List<HomeDataModel>> fetchComics() async{
    List<String> creatorsFromApi=[];
    List<HomeDataModel> dataFromApi=[];
    try{
      final response= await dio.get(
        "${c.gateway}?ts=${c.ts}&apikey=${s.publicKey}&hash=${s.hash}&format=${c.format}&noVariants=${c.noVariants}&limit=${c.limit}&hasDigitalIssue=",
      );
      if(response.statusCode==200) {
        for (var element in response.data["data"]["results"]) {
            for (var creator in element['creators']["items"]) {
              if (creators.contains(creator["role"])) {
                creatorsFromApi.add(creator["name"]);
              }
            }
            dataFromApi.add(HomeDataModel.fromApi(element, creatorsFromApi));
            creatorsFromApi = [];
        }
        return dataFromApi;
      }
      else{
        throw ApiException();
      }
    } on DioException catch (e) {
      throw Exception("Error ${e.response}");
    }
  }
}