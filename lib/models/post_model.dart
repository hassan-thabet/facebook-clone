class PostModel {
  late String name;
  late String uId;
  String? image;
  late String captionText;
  List<dynamic>? postImage;

  PostModel({
    required this.name,
    required this.uId,
    this.image,
    required this.captionText,
    this.postImage,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uId = json['uId'];
    image = json['image'];
    captionText = json['captionText'];
    postImage = json['postImage'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uId': uId,
      'image': image,
      'captionText': captionText,
      'postImage': postImage,
    };
  }
}
