import '../../../core/package/network/core_network.dart';
import 'package:flutter/foundation.dart';

class RecipeSearchModel extends INetworkModel<RecipeSearchModel> {
  List<RecipeItem>? results;
  String? baseUri;
  int? offset;
  int? number;
  int? totalResults;
  int? processingTimeMs;
  int? expires;
  bool? isStale;
  RecipeSearchModel({
    this.results,
    this.baseUri,
    this.offset,
    this.number,
    this.totalResults,
    this.processingTimeMs,
    this.expires,
    this.isStale,
  });
  factory RecipeSearchModel.fromJson(Map<String, dynamic> json) => RecipeSearchModel(
        results: json["results"] == null ? null : List<RecipeItem>.from(json["results"].map((x) => RecipeItem.fromJson(x))),
        baseUri: json['baseUri'],
        offset: json['offset'],
        number: json['number'],
        totalResults: json['totalResults'],
        processingTimeMs: json['processingTimeMs'],
        expires: json['expires'],
        isStale: json['isStale'],
      );

  @override
  RecipeSearchModel fromJson(Map<String, dynamic> json) => RecipeSearchModel.fromJson(json);

  @override
  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
        "baseUri": baseUri,
        "offset": offset,
        "number": number,
        "totalResults": totalResults,
        "processingTimeMs": processingTimeMs,
        "expires": expires,
        "isStale": isStale,
      };
  RecipeSearchModel copyWith({
    List<RecipeItem>? results,
    String? baseUri,
    int? offset,
    int? number,
    int? totalResults,
    int? processingTimeMs,
    int? expires,
    bool? isStale,
  }) {
    return RecipeSearchModel(
      results: results ?? this.results,
      baseUri: baseUri ?? this.baseUri,
      offset: offset ?? this.offset,
      number: number ?? this.number,
      totalResults: totalResults ?? this.totalResults,
      processingTimeMs: processingTimeMs ?? this.processingTimeMs,
      expires: expires ?? this.expires,
      isStale: isStale ?? this.isStale,
    );
  }

  @override
  String toString() {
    return 'RecipeSearchModel(results: $results, baseUri: $baseUri, offset: $offset, number: $number, totalResults: $totalResults, processingTimeMs: $processingTimeMs, expires: $expires, isStale: $isStale)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RecipeSearchModel &&
        listEquals(other.results, results) &&
        other.baseUri == baseUri &&
        other.offset == offset &&
        other.number == number &&
        other.totalResults == totalResults &&
        other.processingTimeMs == processingTimeMs &&
        other.expires == expires &&
        other.isStale == isStale;
  }

  @override
  int get hashCode {
    return results.hashCode ^
        baseUri.hashCode ^
        offset.hashCode ^
        number.hashCode ^
        totalResults.hashCode ^
        processingTimeMs.hashCode ^
        expires.hashCode ^
        isStale.hashCode;
  }
}

class RecipeItem extends INetworkModel<RecipeItem> {
  int? id;
  String? title;
  int? readyInMinutes;
  int? servings;
  String? sourceUrl;
  int? openLicense;
  String? image;
  RecipeItem({
    this.id,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
    this.openLicense,
    this.image,
  });
  factory RecipeItem.fromJson(Map<String, dynamic> json) => RecipeItem(
        id: json["id"],
        title: json["title"],
        readyInMinutes: json["readyInMinutes"],
        servings: json["servings"],
        sourceUrl: json["sourceUrl"],
        openLicense: json["openLicense"],
        image: json["image"],
      );

  @override
  RecipeItem fromJson(Map<String, dynamic> json) => RecipeItem.fromJson(json);
  @override
  Map<String, dynamic>? toJson() => {
        "id": id,
        "title": title,
        "readyInMinutes": readyInMinutes,
        "servings": servings,
        "sourceUrl": sourceUrl,
        "openLicense": openLicense,
        "image": image,
      };

  RecipeItem copyWith({
    int? id,
    String? title,
    int? readyInMinutes,
    int? servings,
    String? sourceUrl,
    int? openLicense,
    String? image,
  }) {
    return RecipeItem(
      id: id ?? this.id,
      title: title ?? this.title,
      readyInMinutes: readyInMinutes ?? this.readyInMinutes,
      servings: servings ?? this.servings,
      sourceUrl: sourceUrl ?? this.sourceUrl,
      openLicense: openLicense ?? this.openLicense,
      image: image ?? this.image,
    );
  }

  @override
  String toString() {
    return 'RecipeItem(id: $id, title: $title, readyInMinutes: $readyInMinutes, servings: $servings, sourceUrl: $sourceUrl, openLicense: $openLicense, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RecipeItem &&
        other.id == id &&
        other.title == title &&
        other.readyInMinutes == readyInMinutes &&
        other.servings == servings &&
        other.sourceUrl == sourceUrl &&
        other.openLicense == openLicense &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ readyInMinutes.hashCode ^ servings.hashCode ^ sourceUrl.hashCode ^ openLicense.hashCode ^ image.hashCode;
  }
}
