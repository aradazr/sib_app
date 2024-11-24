import 'package:bloc/bloc.dart';
import 'package:sib_app/bloc/basket/bloc/basket_event.dart';
import 'package:sib_app/bloc/basket/bloc/basket_state.dart';
import 'package:sib_app/data/repository/basket_repository.dart';
import 'package:sib_app/di/2di.dart';
import 'package:sib_app/utils/extension/string_extension.dart';
import 'package:sib_app/utils/payment_handler.dart';
import 'package:uni_links3/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zarinpal/src/call_backs.dart';
import 'package:zarinpal/zarinpal.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  final IBasketRepository _basketRepository;
  // PaymentRequest _paymentRequest = PaymentRequest();

  final PaymentHandler _paymentHandler;

  BasketBloc(this._paymentHandler,this._basketRepository) : super(BasketInitState()) {
    on<BasketFetchFromHiveEvent>(((event, emit) async {
      var basketItemList = await _basketRepository.getAllBasketItems();
      var finalPrice = await _basketRepository.getBasketFinalPrice();

      emit(BasketDataFetchedState(basketItemList, finalPrice));
    }));

    on<BasketPaymentInitEvent>((event, emmit) async {
      _paymentHandler.initPaymentRequest(2000);
     
    });

    on<BasketPaymentRequestEvent>((event, emmit) async {
      _paymentHandler.sendPaymentRequest();
    },
    );

    // on<BasketRemoveProductEvent>((event, emmit) async {
    //   _basketRepository.removeProduct(event.index);
    //   var basketItemList = await _basketRepository.getAllBasketItems();
    //   var finalPrice = await _basketRepository.getBasketFinalPrice();
    //   emmit(BasketDataFetchedState(basketItemList, finalPrice));
    // });
  }
}
