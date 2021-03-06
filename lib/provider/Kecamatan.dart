import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "http://idwebdesainer.com/demo/api_cinta_rakyat_app/";
//const baseUrl = "http://192.168.0.9:8888/covid19/api/";

class Kecamatan {
  static Future getAllById(id) {
    var url = baseUrl + "Kecamatan/get_all_data_by_id?idKabKota=" + id;
    print(url);
    return http.get(url);
  }

  static Future edit(body) {
    var url = baseUrl + "daftar/ubah";
    print(body);
    return http.post(url, body: body);
  }
}
