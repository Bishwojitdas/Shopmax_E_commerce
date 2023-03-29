class LoginResponse {
  LoginResponse({
    required this.authToken,
    required this.user,
  });
  late final String authToken;
  late final User user;

  LoginResponse.fromJson(Map<String, dynamic> json){
    authToken = json['auth_token'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['auth_token'] = authToken;
    _data['user'] = user.toJson();
    return _data;
  }
}

class User {
  User({
    required this.customerId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.address,
    required this.postCode,
    required this.districtId,
    this.token,
    this.verifyAt,
    this.image,
    this.createdAt,
    this.updatedAt,
  });
  late final int customerId;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String mobile;
  late final String address;
  late final int postCode;
  late final int districtId;
  late final dynamic token;
  late final dynamic verifyAt;
  late final dynamic image;
  late final dynamic createdAt;
  late final dynamic updatedAt;

  User.fromJson(Map<String, dynamic> json){
    customerId = json['customer_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    mobile = json['mobile'];
    address = json['address'];
    postCode = json['post_code'];
    districtId = json['district_id'];
    token = json['token'];
    verifyAt =json['verify_at'];
    image = json['image'];
    createdAt =json['created_at'];
    updatedAt =json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['customer_id'] = customerId;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['email'] = email;
    _data['mobile'] = mobile;
    _data['address'] = address;
    _data['post_code'] = postCode;
    _data['district_id'] = districtId;
    _data['token'] = token;
    _data['verify_at'] = verifyAt;
    _data['image'] = image;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }

  @override
  String toString() {
    return 'User{customerId: $customerId, firstName: $firstName, lastName: $lastName, email: $email, mobile: $mobile, address: $address, postCode: $postCode, districtId: $districtId, token: $token, verifyAt: $verifyAt, image: $image, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}