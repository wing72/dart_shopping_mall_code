// - **속성**
//     - 상품 이름 (`String`)
//     - 상품 1개당 가격 (`int`)

class Product {
  final String goods;
  final int price;

  Product({required this.goods, required this.price}); //생성자 부분
}

List<Product> products = [
  //리스트 초기값 설정해줌
  Product(goods: 'AI노트북', price: 4200000),
  Product(goods: '삼성 비스포크 세탁기', price: 940000),
  Product(goods: '타막 에어윅스 SL8 자전거', price: 18500000),
  Product(goods: '삼성 AI 로봇청소기', price: 1240000),
  Product(goods: '갤럭시 S25 울트라', price: 1520000),
];

final Map<String, int> cart = {};
