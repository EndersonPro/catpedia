import 'package:catpedia/domain/entities/image.dart';

class ImageModel extends Image {
  ImageModel({
    required super.id,
    required super.width,
    required super.height,
    required super.url,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'],
      width: json['width'],
      height: json['height'],
      url: json['url'],
    );
  }
}
