import 'package:get/get.dart';
import 'package:getx_practice/data/services.dart';
import 'package:getx_practice/model/product_model.dart';

class ProductController extends GetxController {
  // observable 가능한 productList 생성
  var productList = <Product>[].obs;

  // 장바구니 아이템들
  var cartItems = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchDate();
  }

  // 상품 리스트 조회 메서드
  void fetchDate() async {
    var products = await Services.fetchProducts();
    if (products != null) {
      productList.value = products;
    }
  }

  // 장바구니 추가 메서드
  void addToCart(Product product) {
    cartItems.add(product);
  }
}
