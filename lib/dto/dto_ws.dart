import 'package:slark/dto/dto_file.dart';
import 'package:slark/dto/dto_space.dart';
import 'package:slark/dto/dto_user.dart';

class DtoWS {
  String workspaceId = '';
  String workspacename = '';
  List<DtoSpace> spaces = [];
  DtoFile image;
  String roleName = '';
  int roleNum;
  List<DtoUser> users = [];
  DtoWS() {
    print('ROLE IN $workspacename WS is $roleName');
  }
}
