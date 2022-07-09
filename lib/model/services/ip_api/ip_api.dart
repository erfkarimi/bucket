import 'package:http/http.dart' as http;
import '../../ip_model/ip_model.dart';
import 'dart:convert';

class ApiServiceForIP{
  var client = http.Client();
    var ipAddressModel = IpApiModel();
     String apiUrl = "https://freeipapi.com/api/json";
     
  Future<IpApiModel> getIp() async {
    try{
      var response = await client.get(Uri.parse(apiUrl));
      if(response.statusCode == 200){
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        ipAddressModel = IpApiModel.fromJson(jsonMap);
      }
    } catch(error){
      return ipAddressModel;

    }
    return ipAddressModel;
  }
}
  

