class BrandModel {
  BrandModel({
    required this.brandId,
    required this.brandName,
    required this.slug,
    required this.image,
    required this.status,
    required this.userId,
    this.deleteUser,
    required this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
  late final int brandId;
  late final String brandName;
  late final String slug;
  late final String image;
  late final int status;
  late final int userId;
  late final Null deleteUser;
  late final String createdAt;
  late final Null updatedAt;
  late final Null deletedAt;

  BrandModel.fromJson(Map<String, dynamic> json){
    brandId = json['brand_id'];
    brandName = json['brand_name'];
    slug = json['slug'];
    image = json['image'];
    status = json['status'];
    userId = json['user_id'];
    deleteUser = null;
    createdAt = json['created_at'];
    updatedAt = null;
    deletedAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['brand_id'] = brandId;
    _data['brand_name'] = brandName;
    _data['slug'] = slug;
    _data['image'] = image;
    _data['status'] = status;
    _data['user_id'] = userId;
    _data['delete_user'] = deleteUser;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    return _data;
  }

  @override
  String toString() {
    return 'BrandModel{brandId: $brandId, brandName: $brandName, slug: $slug, image: $image, status: $status, userId: $userId, deleteUser: $deleteUser, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt}';
  }
}