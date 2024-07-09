
import 'dart:developer';

import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<String?> editImage(String upperBody,String lowerBody ) async {
    const String url = 'https://modelslab.com/api/v6/image_editing/fashion';
    final Map<String, dynamic> data = {
      "key": "vwGrHeGLRH9GUEtH4mDlod0JCh09eFZ9o5BQ3NVL2OcJk8FeJKe4ChkGVWuN",
      "prompt": "A realistic photo of a model wearing a beautiful t-shirt",
      "negative_prompt": "Low quality, unrealistic, bad cloth, warped cloth",
      "init_image": upperBody,
      "cloth_image": lowerBody,
      "cloth_type": "upper_body",
      "height": 512,
      "width": 384,
      "guidance_scale": 7.5,
      "num_inference_steps": 21,
      "seed": null,
      "temp": "no",
      "webhook": null,
      "track_id": null
    };

    try {
      Response response = await _dio.post(
        url,
        options: Options(headers: {'Content-Type': 'application/json'}),
        data: data,
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final responseData = response.data as Map<String, dynamic>;
        log(responseData.toString());
        if (responseData['proxy_links'] != null && responseData['proxy_links'] is List && responseData['proxy_links'].isNotEmpty) {
          log(response.data.toString());
          return responseData['proxy_links'][0] as String;
        } else {
          log('error: erro');
          return null;
        }
      } else {
        print('Error: ${response.statusMessage}');
        return null;
      }
    } catch (e) {
      print('Exception: $e');
      return null;
    }
  }
}
