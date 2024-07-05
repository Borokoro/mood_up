import 'package:dio/dio.dart';
import 'package:mood_up/features/search/data/models/search_data_model.dart';
import 'package:mood_up/core/constants/constants.dart' as c;
import 'package:mood_up/core/secrets/app_secrets.dart' as s;

import '../../../../core/error/exceptions.dart';

abstract class SearchDataSource{
  Future<List<SearchDataModel>> fetchSearchResult(String searchPhrase);
}

class SearchDataSourceImpl extends SearchDataSource{

  final List<String> creators=['writer', 'editor', 'letterer'];
  final Dio dio;
  SearchDataSourceImpl({required this.dio});

  @override
  Future<List<SearchDataModel>> fetchSearchResult(String searchPhrase) async{
    List<String> creatorsFromApi=[];
    List<SearchDataModel> dataFromApi=[];
    try{
      final response= await dio.get(
        "${c.gateway}?ts=${c.ts}&apikey=${s.publicKey}&hash=${s.hash}&format=${c.format}&noVariants="
            "${c.noVariants}&limit=${c.limit}&hasDigitalIssue=&titleStartsWith=$searchPhrase",
      );
      if(response.statusCode==200) {
        for (var element in response.data["data"]["results"]) {
          for (var creator in element['creators']["items"]) {
            if (creators.contains(creator["role"])) {
              creatorsFromApi.add(creator["name"]);
            }
          }
          dataFromApi.add(SearchDataModel.fromApi(element, creatorsFromApi));
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