class TrailerModel {
  String? id;
  String? shareUrl;
  String? type;
  TrailerModel({required this.id, required this.shareUrl, required this.type});
  //from json
  factory TrailerModel.fromJson(Map<String, dynamic> json) {
    return TrailerModel(
      id: json['id'],
      shareUrl: json['shareUrl'],
      type: json['type'],
    );
  }
}

class CoverModel {
  double? height;
  double? width;
  String? url;
  CoverModel({required this.height, required this.url, required this.width});
  //from json
  factory CoverModel.fromJson(Map<String, dynamic> json) {
    return CoverModel(
      height: json['height'],
      url: json['url'],
      width: json['width'],
    );
  }
}

class AudioBookModel {
  List<CoverModel>? cover;
  String? id;
  String? name;
  String? shareUrl;
  TrailerModel? trailer;
  String? type;
  AudioBookModel(
      {required this.cover,
      required this.id,
      required this.name,
      required this.shareUrl,
      required this.trailer,
      required this.type});
  //from json
  factory AudioBookModel.fromJson(Map<String, dynamic> json) {
    List<CoverModel> mCover = [];
    if (json['cover'] != null) {
      for (Map<String, dynamic> eachmap in json['cover']) {
        mCover.add(CoverModel.fromJson(eachmap));
      }
    }

    return AudioBookModel(
      cover: mCover,
      id: json['id'],
      name: json['name'],
      shareUrl: json['shareUrl'],
      trailer: TrailerModel.fromJson(json['type']),
      type: json['type'],
    );
  }
}

class SpotifyModel {
  String? audioPreviewUrl;
  int? durationMs;
  String? durationText;
  String? errorId;
  bool? explicit;
  String? id;
  String? name;
  bool? paywallContent;
  String? shareUrl;
  bool? status;
  String? type;
  AudioBookModel? audiobook;

  SpotifyModel({
    required this.audioPreviewUrl,
    required this.durationMs,
    required this.durationText,
    required this.errorId,
    required this.explicit,
    required this.id,
    required this.name,
    required this.paywallContent,
    required this.shareUrl,
    required this.status,
    required this.type,
    required this.audiobook,
  });

  factory SpotifyModel.fromJson(Map<String, dynamic> json) {
    return SpotifyModel(
        audioPreviewUrl: json['audioPreviewUrl'],
        durationMs: json['durationMs'],
        durationText: json['durationText'],
        errorId: json['errorId'],
        explicit: json['explicit'],
        id: json['id'],
        name: json['name'],
        paywallContent: json['paywallContent'],
        shareUrl: json['shareUrl'],
        status: json['status'],
        type: json['type'],
        audiobook: AudioBookModel.fromJson(
          json['audiobook'],
        ));
  }
}
