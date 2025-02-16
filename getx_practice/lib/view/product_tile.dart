import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/controller/product_controller.dart';
import '../model/product_model.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 60,
                  width: 90,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.network(
                    product.imageLink,
                    fit: BoxFit.fill,
                  ),
                ),
                Obx(
                  () => CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15,
                    child: IconButton(
                      icon: product.like.value
                          ? const Icon(Icons.favorite_rounded)
                          : const Icon(Icons.favorite_border),
                      onPressed: () {
                        product.like.toggle();
                      },
                      iconSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              product.name,
              maxLines: 2,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        product.rating == null
                            ? '--'
                            : product.rating.toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      const Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                SizedBox(
                  height: 20,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      /// 주입 되어있는 컨트롤러를 통해 addToCart 메서드 실행
                      Get.find<ProductController>().addToCart(product);
                    },
                    icon: const Icon(Icons.shopping_cart, size: 15),
                    label: const Text(
                      '장바구니 담기',
                      style: TextStyle(fontSize: 12),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(100, 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              '\$${product.price}',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
