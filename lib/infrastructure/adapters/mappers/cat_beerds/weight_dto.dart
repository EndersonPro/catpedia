class WeightDto {
  String? imperial;
  String? metric;

  WeightDto({required this.imperial, required this.metric});

  factory WeightDto.fromJson(Map<String, dynamic> json) {
    return WeightDto(imperial: json['imperial'], metric: json['metric']);
  }
}
