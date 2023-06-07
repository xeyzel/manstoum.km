import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:image_picker/image_picker.dart';

class CloudinaryProvider {
  Future<void> uploadImage(XFile imageFile) async {
    // try {
    //   CloudinaryResponse response = await cloudinary.uploadFile(
    //     CloudinaryFile.fromFile(imageFile.path,
    //         resourceType: CloudinaryResourceType.Image,
    //         folder: 'product_images',
    //         publicId: ),
    //   );

    //   print(response.secureUrl);
    // } on CloudinaryException {
    //   rethrow;
    // }
  }
}
