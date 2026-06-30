class StreamModel {
  final String id;
  final String username;
  final String imageUrl;
  final String viewerCount;
  final String countryFlag;

  StreamModel({
    required this.id,
    required this.username,
    required this.imageUrl,
    required this.viewerCount,
    required this.countryFlag,
  });

  factory StreamModel.fromJson(Map<String, dynamic> json) => StreamModel(
        id: json['id'],
        username: json['username'],
        imageUrl: json['imageUrl'],
        viewerCount: json['viewerCount'],
        countryFlag: json['countryFlag'],
      );
}