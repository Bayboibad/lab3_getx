import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LayoutItem extends StatelessWidget {
  const LayoutItem({super.key});

  @override
  Widget build(BuildContext context) {
    final productData = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("${productData["id"]}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HederImages(productData['images'],
                2), // Sử dụng productData['thumbnail']
            const SizedBox(height: 8),
            Container(
              alignment: Alignment.topLeft,
              margin:
                  const EdgeInsets.only(left: 8, top: 4, bottom: 4, right: 8),
              child: Row(
                children: [
                  const Icon(Icons.all_out_sharp, size: 30),
                  const SizedBox(width: 8),
                  Text(productData['title'],
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin:
                  const EdgeInsets.only(left: 8, top: 4, bottom: 4, right: 8),
              child: Text(productData['description'],
                  style: const TextStyle(color: Colors.black54, fontSize: 15)),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget HederImages(String thumbnail, int price) {
  return Stack(
    alignment: Alignment.bottomLeft,
    children: [
      Container(
        height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(thumbnail), fit: BoxFit.cover),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(4),
        color: const Color.fromARGB(255, 242, 142, 142),
        child: Text(
          // ignore: unnecessary_brace_in_string_interps
          "${price}",
          style: const TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}
