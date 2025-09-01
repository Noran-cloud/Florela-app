import 'package:dio/dio.dart';
import 'package:iti2/iti_project/Categories.dart';
import 'package:iti2/iti_project/products.dart';

class ApiProvider {

final dio = Dio();
Future <Products?> getHttp() async {
Products? products;
  final response = await dio.get('https://mocki.io/v1/52aa78ac-c956-4c65-b6bc-31eb64cb7239');
  print(response.statusCode);
  print(response.data);
products =  Products.fromJson(response.data);

return products;
}

Future <Categories?> getData() async {
Categories? categories;
  final response2 = await dio.get('https://mocki.io/v1/a9253a9e-ab46-4fdc-9566-616aa43072a8');
  print(response2.statusCode);
  print(response2.data);
categories =  Categories.fromJson(response2.data);

return categories;
}
}