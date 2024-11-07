class Products {
  String imageUrl;
  String title;
  String price;
  String discount;
  String originalPrice;
  String rating;
  String reviewCount;
  bool isNew;
  List<String> thumbnailImages;
  String description;
  List<String> information;
  String productDetails;
  String shippingInfo;
  String returnsPolicy;

  Products({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.discount,
    required this.originalPrice,
    required this.rating,
    required this.reviewCount,
    required this.isNew,
    required this.thumbnailImages,
    required this.description,
    required this.information,
    required this.productDetails,
    required this.shippingInfo,
    required this.returnsPolicy,
  });
}
