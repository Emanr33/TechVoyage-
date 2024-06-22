// ignore_for_file: non_constant_identifier_names

class Brands {
  String Brands_name;
  String Brands_image;
  String Brands_url;

  Brands({
    required this.Brands_name,
    required this.Brands_image,
    required this.Brands_url,
  });

  factory Brands.fromJson(Map<String, dynamic> json) {
    return Brands(
      Brands_name: json['Brands_name'].toString(),
      Brands_image: json['Brands_image'].toString(),
      Brands_url: json['Brands_url'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Brands_name': Brands_name,
      'Brands_image': Brands_image,
      'Brands_url': Brands_url,
    };
  }
}
