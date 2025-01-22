class HomeModel
{
  late bool? status;
  late HomeDataModel? data;

  HomeModel.fromJson(Map<String,dynamic> json){
    status = json['status'];
    data = HomeDataModel.fromJson(json['data']) ;
    // data = (json['data'] != null ? HomeDataModel.fromJson(json['data']) : null);
  }
}

class HomeDataModel
{
  late List<BannerModel> banners =[];
  late List<ProductModel> products =[];

  HomeDataModel.fromJson(Map<String , dynamic> json){
    json['banners'].forEach((element){
      banners.add(element);
    });

    json['products'].forEach((element){
      products.add(element);
    });
  }
}

class BannerModel
{
  late int? id;
  late String? image;

  BannerModel.fromJson(Map<String , dynamic> json)
  {
    id = json['id'];
    image = json['image'];
  }
}

class ProductModel
{
  late int? id;
  late dynamic price;
  late dynamic oldPrice;
  late dynamic disc;
  late String? image;
  late String? name ;
  late bool? inFavourite;
  late bool? inCart;

  ProductModel.fromJson(Map<String , dynamic> json)
  {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    disc = json['discount'];
    image = json['image'];
    name = json['name'];
    inFavourite = json['in_favorites'];
    inCart = json['in_cart'];
  }
}