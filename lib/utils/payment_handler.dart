
import 'package:sib_app/utils/extension/string_extension.dart';
import 'package:sib_app/utils/url_handler.dart';

import 'package:uni_links3/uni_links.dart';
import 'package:zarinpal/src/call_backs.dart';
import 'package:zarinpal/zarinpal.dart';

abstract class PaymentHandler {
  Future<void> initPaymentRequest(int finalPirce);
  Future<void> sendPaymentRequest();
  Future<void> verifyPaymentRequest();
}

class ZarinpalPaymentHandler extends PaymentHandler {
  final PaymentRequest _paymentRequest = PaymentRequest();
  String? _authority;
  String? _status;
  UrlHandler urlHandler;
  ZarinpalPaymentHandler(this.urlHandler);
  

  @override
  Future<void> initPaymentRequest(int finalPirce) async {
    _paymentRequest.setIsSandBox(true);
    _paymentRequest.setAmount(finalPirce);
    _paymentRequest.setDescription('this is for test application apple shop');
    _paymentRequest.setMerchantID('96cd3314-3c9b-4c3c-b56f-1ccf92f53e40');
    _paymentRequest.setCallbackURL('expertflutter://shop');
    linkStream.listen((deeplink) {
      if (deeplink!.toLowerCase().contains('authority')) {
        _authority = deeplink.extractValueFromQuery('Authority');
        _status = deeplink.extractValueFromQuery('Status');
        verifyPaymentRequest();
      }
    });
  }

  @override
  Future<void> sendPaymentRequest() async {
    ZarinPal().startPayment(_paymentRequest, (int? status,String? paymentGatewayUri) {
      if (status == 100) {
        urlHandler.openUrl(paymentGatewayUri!);
      }
    } as OnCallbackRequestPaymentListener ); 
  }

  @override
  Future<void> verifyPaymentRequest() async {
    ZarinPal().verificationPayment(_status!, _authority!, _paymentRequest,
        (isPaymentSuccess, refID, paymentRequest) {
      if (isPaymentSuccess) {
        print(refID);
      } else {
        print('error');
      }
    } as OnCallbackVerificationPaymentListener);
  }
}

// class PapalPaymentHandler extends PaymentHandler {
//   @override
//   Future<void> initPaymentRequest() async {}

//   @override
//   Future<void> sendPaymentRequest() async {}

//   @override
//   Future<void> verifyPaymentRequest() async {}
// }