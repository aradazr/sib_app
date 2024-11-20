import 'package:hive_flutter/adapters.dart';
import 'package:sib_app/data/model/card_item.dart';

abstract class IBasketDataSource{
  Future<void> addProduct(BasketItem basketItem);

  Future<List<BasketItem>> getAllBasketItems();

  Future<int> getBasketFinalPrice();

  
}

class BasketLocalDataSource extends IBasketDataSource{

  var box = Hive.box<BasketItem>('CardBox');
  @override
  Future<void> addProduct(BasketItem basketItem) async {
    box.add(basketItem);
  }
  
  @override
  Future<List<BasketItem>> getAllBasketItems() async {
    
    return box.values.toList();
  }
  
  @override
  Future<int> getBasketFinalPrice() async {
     var productList = box.values.toList();

    var finalPrice = productList.fold(0, (accumulator, product) => accumulator + product.realPrice!,);

    return finalPrice;
  }
  
}