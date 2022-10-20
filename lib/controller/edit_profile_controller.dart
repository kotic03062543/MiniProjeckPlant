import 'package:get/get.dart';

class EditProfileController extends GetxController {
  var isProficPicPathSet = false.obs;
  var profilePicPath = "".obs;


  void setProfileImagePath(String path) {
    profilePicPath.value = path;
    isProficPicPathSet.value = true;
  }
}