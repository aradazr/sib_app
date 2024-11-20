
import 'package:bloc/bloc.dart';
import 'package:sib_app/bloc/basket/bloc/basket_event.dart';
import 'package:sib_app/bloc/basket/bloc/basket_state.dart';
import 'package:sib_app/data/repository/basket_repository.dart';
import 'package:sib_app/di/2di.dart';



class BasketBloc extends Bloc<BasketEvent, BasketState> {
  final IBasketRepository _basketRepository = locator.get();
  
  BasketBloc()
      : super(BasketInitState()) {
    on<BasketFetchFromHiveEvent>(((event, emit) async {
      var basketItemList = await _basketRepository.getAllBasketItems();
      var finalPrice = await _basketRepository.getBasketFinalPrice();

      emit(BasketDataFetchedState(basketItemList,finalPrice));
    }));

    // on<BasketPaymentInitEvent>((event, emmit) async {
    //   var finalPrice = await _basketRepository.getBasketFinalPrice();
    //   _paymentHandler.initPaymentRequest(finalPrice);
    // });

    // on<BasketPaymentRequestEvent>((event, emmit) async {
    //   _paymentHandler.sendPaymentRequest();
    // });

    // on<BasketRemoveProductEvent>((event, emmit) async {
    //   _basketRepository.removeProduct(event.index);
    //   var basketItemList = await _basketRepository.getAllBasketItems();
    //   var finalPrice = await _basketRepository.getBasketFinalPrice();
    //   emmit(BasketDataFetchedState(basketItemList, finalPrice));
    // });
  }
}