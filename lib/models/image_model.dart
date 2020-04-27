final List<ImageModel> listImage = [
  ImageModel(
    imagePath: 'assets/pokemon1.jpg',
  ),
  ImageModel(
    imagePath: 'assets/pokemon2.jpg',
  ),
  ImageModel(
    imagePath: 'assets/pokemon3.jpg',
  ),
  ImageModel(
    imagePath: 'assets/pokemon4.jpg',
  ),
  ImageModel(
    imagePath: 'assets/pokemon5.jpg',
  ),
  ImageModel(
    imagePath: 'assets/pokemon6.jpg',
  ),
  ImageModel(
    imagePath: 'assets/pokemon7.jpg',
  ),
  ImageModel(
    imagePath: 'assets/pokemon8.jpg',
  ),
  ImageModel(
    imagePath: 'assets/pokemon9.jpg',
  ),
  ImageModel(
    imagePath: 'assets/pokemon10.jpg',
  ),
];

class ImageModel {
  String imagePath;
  String get path => imagePath;
  ImageModel({this.imagePath});
}
