import 'package:dio/dio.dart';
import 'package:filmshow/model/model_news.dart';
import 'package:filmshow/request/request_service.dart';

class Request implements RequestService {

  static BaseOptions options = new BaseOptions(
      baseUrl: "https://imdb8.p.rapidapi.com/title",
      headers: {
        'x-rapidapi-host': 'imdb8.p.rapidapi.com',
        'x-rapidapi-key': '049ad0669bmshe1b89091efc9b1ap10e552jsnc3a18487eada',
      }
  );

  Dio _dio = Dio(options);

  @override
  Future<List<ModelNews>> getNews() async {
    Map<String, dynamic> qs = {
      'limit': '50',
      'currentCountry':'US',
      'purchaseCountry':'US',
      'tconst':'tt0944947',
    };

    final response = await _dio.get("/get-news", queryParameters: qs);
    print(response.data);
    List<ModelNews> news = [];
    response.data['items'].forEach((item) => news.add(ModelNews.fromMap(item)));
    return news;
  }
}
