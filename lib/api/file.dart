import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
// import 'package:slark/model/file.dart';

// ignore: camel_case_types
class API_File_Provider {
  String baseUrl = "https://api-slark.herokuapp.com/";
  String uploadSingle = "uploads";
  String uploadMulti = "uploads/multiple";

  Future uploadS() async {
    print('IN API PROVIDER');
    File filedata = await getImageFileFromAssets();
    print(filedata.path);
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
    print(response);
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
    print('Out of provider');
    // var resp = response = filesFromJson(response.body);
  }

  Future asyncFileUpload() async {
    var uri = Uri.parse('$baseUrl$uploadSingle');
    File file = await getImageFileFromAssets();
    //create multipart request for POST or PATCH method
    var request = http.MultipartRequest("POST", uri);
    //add text fields
    request.fields["image"] = "image";
    //create multipart using filepath, string or bytes
    var pic = await http.MultipartFile.fromPath("image", file.path);
    //add multipart to request
    request.files.add(pic);
    var response = await request.send();

    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);
    var parsedJson = json.decode(responseString);
    var alias = parsedJson['_id'];
    print(alias);
    return alias;
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

  Future<File> getImageFileFromAssets() async {
    final byteData = await rootBundle.load('images/logo.png');

    final file = File('${(await getTemporaryDirectory()).path}/logo.png');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }
}
