class ImageDto {
  String id;
  int width;
  int height;
  String url;

  ImageDto({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
  });

  factory ImageDto.fromJson(Map<String, dynamic> json) {
    return ImageDto(
      id: json['id'],
      width: json['width'],
      height: json['height'],
      url: json['url'],
    );
  }
}
