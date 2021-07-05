import 'dart:convert';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
// import 'package:slark/model/file.dart';

// ignore: camel_case_types
class API_File_Provider {
  String baseUrl = "https://api-slark.herokuapp.com/";
  String uploadSingle = "uploads";
  String uploadMulti = "uploads/multiple";

  Future uploadS(filedata) async {
    print('IN API PROVIDER');
    var stream =
        // ignore: deprecated_member_use
        new http.ByteStream(DelegatingStream.typed(filedata.openRead()));
    var length = await filedata.length();

    var uri = Uri.parse('$baseUrl$uploadSingle');

    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile('file', stream, length,
        filename: basename(filedata.path));
    //contentType: new MediaType('image', 'png'));

    request.files.add(multipartFile);
    var response = await request.send();
    print(response.statusCode);
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
    print('Out of provider');
    // var resp = response = filesFromJson(response.body);
  }

  Future uploadM(filesdata) async {
    print('IN API PROVIDER');
    var stream =
        // ignore: deprecated_member_use
        new http.ByteStream(DelegatingStream.typed(filesdata.openRead()));
    var length = await filesdata.length();

    var uri = Uri.parse('$baseUrl$uploadMulti');

    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile('file', stream, length,
        filename: basename(filesdata.path));

    request.files.add(multipartFile);
    var response = await request.send();
    print(response.statusCode);
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
    print('Out of provider');
  }
}
