class CategoryResponse {
  CategoryResponse({
    required this.typeId,
    required this.typeName,
    required this.slug,
    required this.categories,
  });
  late final int typeId;
  late final String typeName;
  late final String slug;
  late final List<Categories> categories;

  CategoryResponse.fromJson(Map<String, dynamic> json){
    typeId = json['type_id'];
    typeName = json['type_name'];
    slug = json['slug'];
    categories = List.from(json['categories']).map((e)=>Categories.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type_id'] = typeId;
    _data['type_name'] = typeName;
    _data['slug'] = slug;
    _data['categories'] = categories.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Categories {
  Categories({
    required this.categoryId,
    required this.categoryName,
    required this.categorySlug,
    required this.subCategories,
  });
  late final int categoryId;
  late final String categoryName;
  late final String categorySlug;
  late final List<SubCategories> subCategories;

  Categories.fromJson(Map<String, dynamic> json){
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categorySlug = json['category_slug'];
    subCategories = List.from(json['sub_categories']).map((e)=>SubCategories.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category_id'] = categoryId;
    _data['category_name'] = categoryName;
    _data['category_slug'] = categorySlug;
    _data['sub_categories'] = subCategories.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class SubCategories {
  SubCategories({
    required this.subCategoryId,
    required this.subCategoryName,
    required this.subCatSlug,
  });
  late final int subCategoryId;
  late final String subCategoryName;
  late final String subCatSlug;

  SubCategories.fromJson(Map<String, dynamic> json){
    subCategoryId = json['sub_category_id'];
    subCategoryName = json['sub_category_name'];
    subCatSlug = json['sub_cat_slug'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sub_category_id'] = subCategoryId;
    _data['sub_category_name'] = subCategoryName;
    _data['sub_cat_slug'] = subCatSlug;
    return _data;
  }
}