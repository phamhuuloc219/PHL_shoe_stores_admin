import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

Future<String> uploadImage(
    {required String imagePath,
    required List<String> folders,
    required String fileName}) async {
  String dowloadUrl;
  // Tạo đối tượng FirebaseStorage
  FirebaseStorage _storage = FirebaseStorage.instance;

  //1. Thiết lập đường dẫn trên firebase storage
  Reference reference = _storage.ref();
  for (String f in folders) reference = reference.child(f);
  reference = reference.child(fileName);

  //2.Thiết lập metadata
  final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      customMetadata: {'picked-file-path': imagePath});

  //3. upload ảnh lên fire base storage và trả về đường dẫn
  try {
    if (kIsWeb)
      await reference.putData(await XFile(imagePath).readAsBytes(), metadata);
    else
      await reference.putFile(File(imagePath), metadata);
    dowloadUrl = await reference.getDownloadURL();
    return dowloadUrl;
  } on FirebaseException catch (e) {
    print("Lỗi upload ảnh lên firebase ${e.toString()}");
    return Future.error("lỗi up load file");
  }
}

Future<void> deleteImage(
    {required List<String> folders, required String fileName}) async {
  FirebaseStorage _storage = FirebaseStorage.instance;
  //1. Thiết lập đường dẫn trên firebase storage
  Reference reference = _storage.ref();
  for (String f in folders) reference = reference.child(f);
  reference = reference.child(fileName);
  return reference.delete();
}
