// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatSearchResponse _$CatSearchResponseFromJson(Map<String, dynamic> json) =>
    CatSearchResponse(
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      reference_image_id: json['reference_image_id'] as String? ?? "",
      origin: json['origin'] as String? ?? "",
      temperament: json['temperament'] as String? ?? "",
      description: json['description'] as String? ?? "",
      wikipedia_url: json['wikipedia_url'] as String? ?? "",
      alt_names: json['alt_names'] as String? ?? "",
      life_span: json['life_span'] as String? ?? "",
    );

Map<String, dynamic> _$CatSearchResponseToJson(CatSearchResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'reference_image_id': instance.reference_image_id,
      'origin': instance.origin,
      'temperament': instance.temperament,
      'description': instance.description,
      'wikipedia_url': instance.wikipedia_url,
      'alt_names': instance.alt_names,
      'life_span': instance.life_span,
    };
