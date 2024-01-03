import 'package:get/get.dart';
import 'package:lab3_getx/views/models/producs.dart';
import 'package:lab3_getx/views/services/api_products.dart';

class ProductController extends GetxController {
  var listPro = <Products>[].obs;
  final ApiProduct _api = ApiProduct();
  var isLoading = true.obs;
  var errorMessage = "".obs;
 var count = 10;
  @override
  void onInit(){
    super.onInit();
   count +=10;
   fetchProducts(count);

  }

  Future<void> fetchProducts(int sl) async {
    try {
      isLoading(true);
      List<Products> products = await _api.getAll(sl);  
      listPro.assignAll(products);  
      // ignore: unnecessary_brace_in_string_interps, avoid_print
      print("aggaga: ${listPro}"); 
    } catch (error) {
      errorMessage("Lỗi khi lấy dữ liệu: $error");
    } finally {
      isLoading(false);
    }
  }
}
