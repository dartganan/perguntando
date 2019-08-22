import 'dart:convert';
import 'package:convert/convert.dart';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:dio/dio.dart';
import 'package:perguntando/src/shared/utils/constants.dart';

class AuthRepository extends Disposable {
  final _dio = Dio();
  Future<Map> getToken(String email, String password) async {
    Response response;
    final routerToken = '/auth/v1/gettoken';
    password = generateMd5(password);
    var base64 = Latin1Codec().fuse(Base64Codec());
    String authToken = base64.encode('$email:$password');
    String credentials = 'Basic $authToken';
    response = await _dio.post(
      API_URL + routerToken,
      options: Options(
        headers: {'Authorization': credentials},
      ),
    );
    return response.data;
  }

  generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }

  @override
  void dispose() {}
}
