import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:my_first_proj/payment_keys/payment_key.dart';

class PaymentMethodServices {
  PaymentMethodServices._();

  static final PaymentMethodServices instance = PaymentMethodServices._();

  Future<bool> makePayment(double payment) async {
    try {
      String? paymentIntentClientSecrete = await createPaymentIntent(
        payment,
        "myr",
      );
      if (paymentIntentClientSecrete == null) return false;
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentClientSecrete,
          merchantDisplayName: "Muhammad Safwan",
        ),
      );
      return await processPayment();
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<String?> createPaymentIntent(double amount, String currency) async {
    try {
      final Dio dio = Dio();
      Map<String, dynamic> data = {
        "amount": calculatedAmount(amount),
        "currency": currency,
      };
      var response = await dio.post(
        "https://api.stripe.com/v1/payment_intents",
        data: data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {"Authorization": "Bearer $stripeSecretKey"},
        ),
      );
      if (response.data != null) {
        print(response.data);
        return response.data["client_secret"];
      }
      return null;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<bool> processPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  int calculatedAmount(double amount) {
    return (amount * 100).toInt();
  }
}
