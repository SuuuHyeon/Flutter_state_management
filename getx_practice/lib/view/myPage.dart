import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return Container(
                color: Colors.red,
              );
            },
          ),
        ),
      ),
    );
  }
}
