// ignore_for_file: non_constant_identifier_names

class ModelUserMember {
  String? username;
  String? password;
  String? fullname;
  String? user_email;

  ModelUserMember({
    this.username,
    this.password,
    this.fullname,
    this.user_email,
  });
}

class ModelProducts {
  String? product_name;
  String? product_detail;
  double? product_price;
  int? product_amount;
  int? product_pic;
  int? product_type;

  ModelProducts({
    this.product_name,
    this.product_detail,
    this.product_price,
    this.product_amount,
    this.product_pic,
    this.product_type,
  });
}
