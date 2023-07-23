import 'package:dio/dio.dart';

class Datasevices {
  static const url = "http://127.0.0.1:8000/api/";
  //192.168.43.174
  Dio dio = Dio();
  adreservices() {
    BaseOptions options = BaseOptions(
      baseUrl: url,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    );

    dio = Dio(options);
  }

  Future<List<DataModel>> get() async {
    try {
      Response response = await dio.get('${url}data');
      if (response.statusCode == 200) {
        List<dynamic> jsonData = response.data;
        List<DataModel> data =
            jsonData.map((item) => DataModel.fromJson(item)).toList();
        return data;
      } else {
        print('Request failed with status: ${response.statusCode}');
        return [];
      }
    } catch (error) {
      print('Error: $error');
      return [];
    }
  }

  Future<Map<String, dynamic>> post(Map<String, dynamic> data) async {
    try {
      Response response = await dio.post('${url}add', data: data);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data;
        return responseData;
      } else {
        print('Request failed with status: ${response.statusCode}');
        return {};
      }
    } catch (error) {
      print('Error: $error');
      return {};
    }
  }
}

class DataModel {
  final String name;
  final String prenom;
  final String description;

  DataModel({
    required this.name,
    required this.prenom,
    required this.description,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      name: json['name'],
      prenom: json['prenom'],
      description: json['description'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = name;
    data['prenom'] = prenom;
    data['description'] = description;

    return data;
  }
}
