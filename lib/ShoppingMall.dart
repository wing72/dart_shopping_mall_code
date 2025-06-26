import 'dart:io';
import 'dart:convert';
import 'package:dart_shopping_mall_code/Product.dart';

// - **속성**
//     - 판매하는 상품 목록 (`List<Product>`)
//     - 장바구니에 담은 상품들의 총 가격 (`int`)
// - **메서드**
//     - 상품 목록을 출력하는 메서드 (`showProducts()`)
//     - 상품을 장바구니에 담는 메서드 (`addToCart()`)
// - 장바구니에 담은 상품의 총 가격을 출력하는 메서드 (`showTotal()`)

class ShoppingMall {
  final List<Product> products;
  final Map<int, int> cart = {};
  // final int productcount = products.length;

  ShoppingMall({required this.products});

  void run() {
    while (true) {
      _showmenu();
      final input = stdin.readLineSync(encoding: utf8);

      switch (input) {
        case "1":
          print('$input을 선택 하셨습니다 상품목록을 불러 옵니다.');
          print('---------------------상품 목록---------------------');
          showProducts();
          print('---------------------------------------------------');
          break;
        case "2":
          break;
        // [2] 장바구니에 담기
        case "3":
          break;
        // [3] 장바구니에 담긴 상품의 총 가격 보기
        case "4":
          print('이용해 주셔서 감사합니다 ~ 안녕히 가세요 !');
          return;
        // [4] 프로그램 종료
        case "6":
          break;
        default:
          print('잘못된 입력 값입니다.');
          break;
      }
    }
  }

  //   - 상품 목록을 출력하는 메서드 (`showProducts()`)
  // - 상품을 장바구니에 담는 메서드 (`addToCart()`)
  // - 장바구니에 담은 상품의 총 가격을 출력하는 메서드 (`showTotal()`)
  void _showmenu() {
    print(
      '-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------',
    );

    stdout.write(
      '[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료\n',
    );

    print(
      '-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------',
    );
  }

  showProducts() {
    print('${products.length}종의 상품이 있습니다.');
    for (var Product in products) {
      print('${Product.goods}/${Product.price}원');
    }
  }

  addToCart() {}
  showTotal() {}
}
