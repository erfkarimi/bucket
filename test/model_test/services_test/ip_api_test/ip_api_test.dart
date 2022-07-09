import 'package:bucket/model/services/ip_api/ip_api.dart';
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main(){
  test('Testing ip model',
   () async{
    final ipApi = ApiServiceForIP();
    ipApi.client = MockClient((request) async{
      final jsonMap = {
        "countryCode" : "CA"
      };
      return Response(
        json.encode(jsonMap), 200);
    });

    final ipModel = await ipApi.getIp();

    expect(ipModel.countryCode, "CA");
   }
  );
} 