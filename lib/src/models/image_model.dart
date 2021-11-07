class ImageModel {
  late int id;
  late String url;
  late String title;
  ImageModel(this.id, this.title, this.url);
  ImageModel.fromJson(parsedJson) {
    id = parsedJson['id'];
    url = parsedJson['url'];
    title = parsedJson['title'];
  }
}
