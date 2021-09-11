class Post
{
  late String name;
  late String uId;
  String? image;
  late String captionText;
  List<dynamic>? postImage;

Post({
  required this.name,
  required this.uId,
  this.image,
  required this.captionText,
  this.postImage,

  });

Post.fromJson(Map<String , dynamic> json)
{
  name = json['name'];
  uId = json['uId'];
  image = json['image'];
  captionText = json['captionText'];
  postImage = json['postImage'];
}



Map<String , dynamic> toMap()
{
  return
    {
      'name' : name,
      'uId' : uId,
      'image' : image,
      'captionText' : captionText,
      'postImage' : postImage,
    };
}

}