// - **속성**
//     - 상품 이름 (`String`)
//     - 상품 1개당 가격 (`int`)

class Product {
  final String goods;
  final int price;

  Product({required this.goods, required this.price});
}

List<Product> Products = [
  Product(goods: '1', price: 10000),
  Product(goods: '2', price: 20000),
  Product(goods: '3', price: 30000),
  Product(goods: '4', price: 40000),
  Product(goods: '5', price: 50000),
];
