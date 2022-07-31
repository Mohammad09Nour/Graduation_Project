class ItemInfo {
  String title;
  List<String> imageUrl;
  String phoneNumber;
  String descriptions;
  String urlProfileImage;

  DateTime createdDate = DateTime(2020);
  ItemInfo(this.title, this.imageUrl, this.phoneNumber, this.descriptions,
      this.urlProfileImage, this.createdDate);
}
