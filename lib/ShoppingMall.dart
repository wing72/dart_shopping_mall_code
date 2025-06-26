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

  ShoppingMall({required this.products});

  void run() {
    while (true) {
      _showMenu();
      final input = stdin.readLineSync(encoding: utf8);

      switch (input) {
        case "1":
          print('$input을 선택 하셨습니다 상품목록을 불러 옵니다.');
          print('------상품 목록------');
          for (final Product in Products()) {
            {
              // 각 product 객체의 속성(goods, price)에 접근하여 출력합니다.
              // '.'(점)을 찍어서 객체 내부의 변수나 함수를 사용할 수 있습니다.
              print('${product.goods} / ${product.price}원');
            }
          }
          break;
        case "2":
          break;
        // [2] 장바구니에 담기
        case "3":
          break;
        // [3] 장바구니에 담긴 상품의 총 가격 보기
        case "4":
          break;
        // [4] 프로그램 종료
        case "6":
          break;
        default:
          print('잘못된 입력 값입니다.');
          break;
      }
    }
  }

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
}

// 쇼핑몰의 모든 기능을 책임지는 클래스
// class ShoppingMall {
//   // --- 속성 (데이터) ---
//   // 1. 외부에서 상품 목록을 받아와서 저장할 final 변수
//   final List<Product> products;
//   // 2. 장바구니. Product의 고유 ID(int)와 수량(int)을 저장합니다.
//   final Map<int, int> cart = {};

//   // --- 생성자 ---
//   // ShoppingMall 객체를 만들 때, 반드시 상품 목록(products)을 전달받아야 함
//   ShoppingMall({required this.products});

//   // --- 메서드 (기능) ---

//   // 쇼핑몰 프로그램을 시작하고 전체 흐름을 제어하는 메인 메서드
//   void run() {
//     while (true) {
//       _showMenu();
//       final input = stdin.readLineSync(encoding: utf8);

//       switch (input) {
//         case "1":
//           // 상품 목록을 보여주는 메서드를 호출합니다.
//           _showProducts();
//           break;
//         case "2":
//           // 장바구니에 상품을 추가하는 메서드를 호출합니다. (기능은 비워둠)
//           _addToCart();
//           break;
//         case "3":
//           // 장바구니의 총액을 계산하고 보여주는 메서드를 호출합니다. (기능은 비워둠)
//           _showTotal();
//           break;
//         case "4":
//           print('프로그램을 종료합니다.');
//           return; // run 메서드를 종료하여 while 루프를 탈출
//         default: // 'default:'가 올바른 문법입니다.
//           print('잘못된 입력입니다. 1~4 사이의 숫자를 입력해주세요.');
//           break;
//       }
//       print(''); // 메뉴 선택 후 줄 띄움
//     }
//   }

//   // 메뉴판을 보여주는 내부 메서드 (클래스 안에서만 사용)
//   void _showMenu() {
//     print('-------------------------------------------------------');
//     stdout.write('[1] 상품 목록 보기 / [2] 장바구니 담기 / [3] 총 가격 보기 / [4] 종료\n');
//     print('-------------------------------------------------------');
//     stdout.write('메뉴를 선택하세요: ');
//   }

//   // 1번 메뉴: 상품 목록을 출력하는 메서드
//   void _showProducts() {
//     print('\n--- 상품 목록 ---');
//     // 클래스의 속성인 products 리스트를 순회합니다.
//     for (final product in products) {
//       print('상품명: ${product.goods}, 가격: ${product.price}원');
//     }
//   }

//   // 2번 메뉴: 장바구니에 상품을 추가하는 메서드 (추후 구현)
//   void _addToCart() {
//     print('\n[2] 장바구니 담기 (구현 예정)');
//   }

//   // 3번 메뉴: 총 가격을 출력하는 메서드 (추후 구현)
//   void _showTotal() {
//     print('\n[3] 총 가격 보기 (구현 예정)');
//   }
// }
