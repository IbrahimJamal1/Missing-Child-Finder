import 'dart:io';
import 'package:image_picker/image_picker.dart';

File? profileImage;
File? idImage;
File? imagechild;


Future<void> pickImage(String type) async {

  final ImagePicker picker = ImagePicker();

  final XFile? pickedImage = await picker.pickImage(
    source: ImageSource.gallery,
  );


  if (pickedImage != null) {

    if (type == "profile") {

      profileImage = File(pickedImage.path);

    } else if (type == "child") {

      imagechild = File(pickedImage.path);

    } else if (type == "id") {

      idImage = File(pickedImage.path);

    }

    print(pickedImage.path);

  } else {

    print("No image selected");

  }
}