// ignore_for_file: non_constant_identifier_names, camel_case_types

class Youtube_Video {
  String? videoId;
  String? title;
  String? thumbnail_default;
  String? thumbnail_medium;
  String? thumbnail_high;
  String? Publsih_time;
  String? description;
  bool isTapped = false;

  Youtube_Video(
      {required this.videoId,
      required this.title,
      required this.thumbnail_default,
      required this.thumbnail_medium,
      required this.thumbnail_high,
      required this.Publsih_time,
      required this.description});

  factory Youtube_Video.fromJSON(Map<String, dynamic> map) {
    return Youtube_Video(
        videoId: map["id"]["videoId"].toString(),
        Publsih_time: map["snippet"]["publishedAt"].toString(),
        title: map["snippet"]["title"].toString(),
        thumbnail_default: map["snippet"]["thumbnails"]["default"]["url"].toString(),
        thumbnail_medium: map["snippet"]["thumbnails"]["medium"]["url"].toString(),
        thumbnail_high: map["snippet"]["thumbnails"]["high"]["url"].toString(),
        description: map["snippet"]["description"].toString());
  }
}
