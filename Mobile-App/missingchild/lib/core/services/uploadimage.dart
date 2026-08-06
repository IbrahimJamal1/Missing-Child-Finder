import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageService {
  File? profileImage;
  File? idImage;
  File? personImage;
  File? liveImage;

  //update image profile
  File? coverprofile;
  File? updateimageprofile;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(String type) async {
    final XFile? pickedImage = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedImage == null) return;

    final file = File(pickedImage.path);

    switch (type) {
      case "profile":
        profileImage = file;
        break;

      case "person":
        personImage = file;
        break;

      case "id":
        idImage = file;
        break;
      case "updateimageprofile":
        updateimageprofile = file;
        break;
      case "coverprofile":
        coverprofile = file;
        break;
    }
  }

  Future<void> uploadLiveImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );

    if (image != null) {
      liveImage = File(image.path);
    }
  }
}
