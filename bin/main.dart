import 'package:dart_shopping_mall_code/ShoppingMall.dart';
import 'package:dart_shopping_mall_code/Product.dart';

void main() {
  final mall = ShoppingMall(products: products);//의존성 주입
  mall.run();
}
