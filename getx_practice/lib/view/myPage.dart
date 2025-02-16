import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/controller/product_controller.dart';
import 'package:getx_practice/view/product_tile.dart';

class MyPage extends StatelessWidget {
  MyPage({super.key});

  // controller 주입
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Suhyeon Shop',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.view_list_rounded,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.view_list_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
          child: Obx(
            () => GridView.builder(
              itemCount: controller.productList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return ProductTile(controller.productList[index]);
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        onPressed: null,
        label: Row(
          children: [
            const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            const SizedBox(width: 5),

            /// obx 사용하여 카트에 담은 아이템 수 표기
            Obx(() => Text(
                  'Item: ${controller.cartItems.length}',
                  style: const TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
