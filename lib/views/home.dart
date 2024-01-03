import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab3_getx/views/controller/product_controller.dart';
import 'package:lab3_getx/widgets/item_product.dart';
import 'package:loadmore/loadmore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductController _listPro = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GetX Flutter")),
      body: Obx(() {
        if (_listPro.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (_listPro.errorMessage.value.isNotEmpty) {
          // ignore: unnecessary_string_interpolations
          return Center(
            // ignore: unnecessary_string_interpolations
            child: Text("${_listPro.errorMessage.value}"),
          );
        } else {
          return LoadMore(
            isFinish: _listPro.listPro.length >= 10,
            onLoadMore: _loadMore,
            whenEmptyLoad: true,
            delegate: const DefaultLoadMoreDelegate(),
            textBuilder: DefaultLoadMoreTextBuilder.chinese,
            // ignore: avoid_unnecessary_containers
            child: Container(
                child: Obx(
              () => ListView.builder(
                  itemCount: _listPro.listPro.length,
                  // ignore: avoid_unnecessary_containers
                  itemBuilder: (context, index) {
                    final products = _listPro.listPro[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed("/itempro", arguments: {
                          'id': products.id,
                          'title': products.title,
                          'price': products.price,
                          'images': products.thumbnail,
                          'description': products.description
                        });
                      },
                      child: ItemProduct(
                          id: products.id,
                          title: products.title,
                          price: products.price,
                          images: products.thumbnail,
                          context: context),
                    );
                  }),
            )),
          );
        }
      }),
    );
  }

  Future<bool> _loadMore() async {
    await Future.delayed(const Duration(seconds: 0, milliseconds: 100));
    _listPro.listPro;
    return true;
  }

  // ignore: unused_element
  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 0, milliseconds: 100));
    _listPro.listPro.clear();
  }
}
