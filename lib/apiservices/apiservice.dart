import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:news_app/controllers/controller.dart';
final ApiService apiService=ApiService._();
class ApiService{
  ApiService._();
  Future funcApi() async {
    var api="https://newsapi.org/v2/top-headlines?country=${ controller.countryCode.value}&category=${controller.category.value}&from=22-11-2023&apiKey=477bad5786354ec88a06bd3d0aff8182";
    final response=await http.get(Uri.parse(api));
    final Map<String, dynamic> data=json.decode(response.body);
    controller.elements.value=data["articles"];
  }
  api(){
    Future.delayed(const Duration(milliseconds: 10), () {
        apiService.funcApi();
    });
  }
}
