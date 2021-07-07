import 'package:slark/dto/dto_file.dart';
import 'package:slark/dto/dto_space.dart';

class DtoWS {
  String workspaceId = '';
  String workspacename = '';
  List<DtoSpace> spaces = [];
  DtoFile image;
  String roleName = '';
  int roleNum;
  DtoWS() {
    print('ROLE IN $workspacename WS is $roleName');
  }
}
