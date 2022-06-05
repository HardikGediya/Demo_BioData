import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pr3_sky_scrapper_app/models/biodata_models.dart';

class APIHelper{

  APIHelper._();

  static final APIHelper apiHelper = APIHelper._();

  String API_LINK = "https://randomuser.me/api/";


  Future<BioData?> fetchBioData() async {
    Uri API = Uri.parse(API_LINK);

    http.Response response = await http.get(API);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      BioData bioData = BioData.fromJson(data);

      return bioData;
    } else {
      return null;
    }
  }

}