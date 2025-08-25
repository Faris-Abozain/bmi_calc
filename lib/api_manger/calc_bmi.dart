import 'dart:convert';

import 'package:dio/dio.dart';
import '../models/bmi_model.dart';

Future<BmiModel?> calcBmi({
  required double height,
  required double weight,
  String unit = "metric",
}) async {
  if (height <= 0 || weight <= 0) return null;

  try {
    final dio = Dio();
    final response = await dio.get(
      "https://api.apiverve.com/v1/bmicalculator?height=$height&weight=$weight&unit=metric",
      // queryParameters: {
      //   "height": height,
      //   "weight": weight,
      //   "unit": unit,
      // },
      options: Options(headers: {
        "X-API-Key": "cc5baafd-424e-4e9e-b56e-5e31a76d28e2",
      }),
    );

    if (response.statusCode == 200 && response.data != null) {
      print('1234567890');
      return BmiModel.fromJson(jsonDecode(response.data));
    }
  } catch (e) {
    if (e is TypeError) {
      print(e.stackTrace);
    }
    print("BMI API error: $e");
  }
  return null;
}
