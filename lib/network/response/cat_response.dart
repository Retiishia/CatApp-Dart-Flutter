
import 'package:json_annotation/json_annotation.dart';

part 'cat_response.g.dart';

@JsonSerializable()
class CatSearchResponse{
  String id;
  String name;
  String reference_image_id;
  String origin;
  String temperament;
  String description;
  String wikipedia_url;
  String alt_names;
  String life_span;

  CatSearchResponse({
      this.id = "",
      this.name = "",
      this.reference_image_id = "",
      this.origin = "",
      this.temperament = "",
      this.description = "",
      this.wikipedia_url = "",
      this.alt_names = "",
      this.life_span = ""
  });

  factory CatSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$CatSearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CatSearchResponseToJson(this);
}