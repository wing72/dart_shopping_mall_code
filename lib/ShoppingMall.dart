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
          showProducts();
          break;
        //[1] 상품 목록 보기
        case "2":
          print('$input을 선택 하셨습니다 삼품을 담기 위해 장바구니로 이동합니다.');
          addToCart();
          break;
        // [2] 장바구니에 담기
        case "3":
          print('$input을 선택 하셨습니다 삼품을 담기 위해 장바구니로 이동합니다.');
          showTotal();
          break;
        // [3] 장바구니에 담긴 상품의 총 가격 보기
        case "4":
          showEnd();
          break;
        // [4] 프로그램 종료
        case "6":
          clearCart();
          break;
        // [6] 장바구니 비우기
        default:
          print('지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..');
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
    '[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료 / [6] 장바구니 비우기\n', //---을 화면에 맞춰서 출력이 안되서 아쉬움
  );

  print(
    '-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------',
  );
}

showProducts() {
  print('1번을 입력 상품 목록을 불러옵니다.');
  print('---------------------🛍️상품 목록🛍️----------------------');
  for (var Product in products) {
    print('${Product.goods} / ${Product.price}원');
    print('-----------------------------------------------------\n');
  }
}

// final Map<String, int> cart = {}; 만들다보니 결국 안썻다..

int totalPrice = 0;

void addToCart() {
  print('2번을 입력 장바구니로 이동합니다.');
  print('\n-------- 🛒장바구니🛒 --------');
  print('장바구니에 담을 상품 이름을 입력하세요:');
  final String? goodsInput = stdin.readLineSync(encoding: utf8);

  // 입력값이 null이거나 비어있는 경우도 올바르지 않은 값으로 처리
  if (goodsInput == null || goodsInput.isEmpty) {
    print('입력값이 올바르지 않아요 !');
    return;
  }

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
    final int quantity = int.parse(quantityInput);

    if (quantity <= 0) {
      //개수가 0이나 더작은지 확인하고 0이나 더작으면 메시지 출력
      print('0개보다 많은 개수의 상품만 담을 수 있어요 !');
      return;
    }

    // 1. 해당 상품의 단가 찾기 (firstWhere 사용)
    final product = products.firstWhere((p) => p.goods == goodsInput);
    // 2. 총액에 (단가 * 수량) 더하기
    totalPrice += product.price * quantity;

    print('장바구니에 상품이 담겼어요 !');
  } on FormatException {
    print('입력값이 올바르지 않아요 !');
  }
}

showTotal() {
  print('3번을 장바구니에 담긴 물건의 합을 출력합니다.');
  print('\n----- 🛒장바구니🛒 -----');
  print('장바구니에 $totalPrice원 어치를 담으셨네요 ! ');
}

void clearCart() {
  print('6번을 입력 장바구니를 비웁니다.');
  if (totalPrice == 0) {
    //조건 토탈프라이스 가 0인지 확인해서 비어있는지 확인
    print('이미 장바구니가 비어있습니다.');
  } else {
    cart.clear();
    totalPrice = 0; //0으로 초기화
    print('장바구니를 초기화합니다.');
  }
}

showEnd() {
  print('정말 종료하시겠습니까?');
  var endinput = stdin.readLineSync();
  if (endinput == "5") {
    //5입력 했는지 확인
    print('이용해 주셔서 감사합니다 ~ 안녕히 가세요!');
    exit(0); // dart:io에서 지원하는 종료 명령어
  } else {
    print('종료하지 않습니다.');
  }
}
