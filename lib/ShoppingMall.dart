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
        //[1] 상품 목록 보기
        case "2":
          print('$input을 선택 하셨습니다 삼품을 담기 위해 장바구니로 이동합니다.');
          print('---------------------상품 목록---------------------');
          addToCart();
          print('---------------------------------------------------');
          break;
        // [2] 장바구니에 담기
        case "3":
          print('$input을 선택 하셨습니다 삼품을 담기 위해 장바구니로 이동합니다.');
          print('---------------------상품 목록---------------------');
          showTotal();
          print('---------------------------------------------------');
          break;
        // [3] 장바구니에 담긴 상품의 총 가격 보기
        case "4":
          showEnd();
          break;
        // [4] 프로그램 종료

        default:
          print('잘못된 입력 값입니다.');
          break;
      }
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

// addToCart() {
//   print('상품 명를 입력해 주세요');
//   final goodsinput = stdin.readLineSync(encoding: utf8);
//   print('상품 개수를 입력해 주세요');
//   final priceinput = stdin.readLineSync(encoding: utf8);
//   final ${cart} = [goodsinput, priceinput];
//   print('$goodsinput');
//   print('$priceinput');
// }
final Map<String, int> cart = {};

// 장바구니에 담은 상품들의 총 가격
int totalPrice = 0;

// 2번 메뉴: 장바구니에 상품 추가
void addToCart() {
  print('\n----- 장바구니 추가 -----');
  print('장바구니에 담을 상품 이름을 입력하세요:');
  final String? goodsInput = stdin.readLineSync(encoding: utf8);

  // 입력값이 null이거나 비어있는 경우도 올바르지 않은 값으로 처리
  if (goodsInput == null || goodsInput.isEmpty) {
    print('입력값이 올바르지 않아요 !');
    return;
  }

  // [조건] 입력한 상품 이름이 상품 목록에 있는지 확인
  // 고차 함수 any()를 사용하여 판별
  if (products.any((product) => product.goods == goodsInput) == false) {
    print('입력값이 올바르지 않아요 !');
    return;
  }

  print('상품의 개수를 입력하세요:');
  final String? quantityInput = stdin.readLineSync(encoding: utf8);

  if (quantityInput == null || quantityInput.isEmpty) {
    print('입력값이 올바르지 않아요 !');
    return;
  }

  try {
    // [힌트] int.parse()를 통해 int 타입으로 변환
    final int quantity = int.parse(quantityInput);

    // [조건] 입력한 상품의 개수가 0 이하인지 확인
    if (quantity <= 0) {
      print('0개보다 많은 개수의 상품만 담을 수 있어요 !');
      return;
    }

    // [조건] 모든 검증 통과 후 장바구니에 상품 담기
    cart[goodsInput] = (cart[goodsInput] ?? 0) + quantity;

    // [힌트] 장바구니 총 가격 업데이트
    // 1. 해당 상품의 단가 찾기 (firstWhere 사용)
    final product = products.firstWhere((p) => p.goods == goodsInput);
    // 2. 총액에 (단가 * 수량) 더하기
    totalPrice += product.price * quantity;

    print('장바구니에 상품이 담겼어요 !');
  } on FormatException {
    // [조건] int.parse() 실패 시 (숫자 형태가 아닐 경우)
    print('입력값이 올바르지 않아요 !');
  }
}

showTotal() {
  print('\n--- 현재 장바구니 ---');
  print('장바구니에 [가격]원 $totalPrice 담으셨네요 ! ');
}

showEnd() {
  print('정말 종료하시겠습니까?');
  var endinput = stdin.readLineSync();
  if (endinput == "5") {
    exit(0);
  } else {
    print('종료하지 않습니다.');
  }
}
