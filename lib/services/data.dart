import 'package:firebase_application/models/category_model.dart';

List<CategoryModel> getCategories() {
  // ignore: non_constant_identifier_names
  List<CategoryModel> Category = [];
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.categoryName = "Business";
  categoryModel.image = "assets/business.jpeg";
  Category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Entertainment";
  categoryModel.image = "assets/entertainment.jpeg";
  Category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "General";
  categoryModel.image = "assets/general.jpeg";
  Category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Health";
  categoryModel.image = "assets/health.jpeg";
  Category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Sports";
  categoryModel.image = "assets/sports.jpeg";
  Category.add(categoryModel);
  categoryModel = new CategoryModel();

  return Category;
}
