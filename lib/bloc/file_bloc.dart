import 'package:slark/api/file.dart';

class FileBloc {
  FileBloc();
  Future uploadSingleFile() async {
    API_File_Provider apiProv = new API_File_Provider();
    var fileData;
    print('In File Bloc');

    // await apiProv.uploadS().then((value) {
    //   fileData = value;
    // });
    await apiProv.asyncFileUpload().then((value) {
      print(value);
      fileData = value;
    });
    print('out of Bloc');
    return fileData;
  }

  Future uploadMultiFile(filesdata) async {
    API_File_Provider apiProv = new API_File_Provider();
    var filesData;
    print('In File Bloc');
    await apiProv.uploadM(filesdata).then((value) {
      filesData = value;
    });
    print('out of Bloc');
    return filesData;
  }
}
