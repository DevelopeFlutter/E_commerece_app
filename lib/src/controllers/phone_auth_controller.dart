import 'package:get/get.dart';
import 'package:yoori_ecommerce/src/screen/dashboard/dashboard_screen.dart';
import 'package:yoori_ecommerce/src/utils/constants.dart';
import 'package:yoori_ecommerce/src/servers/repository.dart';

class PhoneAuthController extends GetxController{
  var isLoading = true.obs;

  //Phone Login
  Future phoneLogin({String? phoneNumber,})async{
    printLog(phoneNumber);
    isLoading.value = false;
    await Repository().postPhoneLogin(phoneNumber: phoneNumber,)
        .then((value){
      isLoading.value = value!;
    });
    isLoading.value = true;
  }

  Future sendOtpLogin({String? phoneNumber,String? otp,}) async{
    isLoading.value= false;
    await Repository().sendOTPLogin(
      phoneNumber: phoneNumber,
      otp: otp,
    )
        .then((value){
      if(value!){
        Get.offAll(() => DashboardScreen());
      }
      isLoading.value = true;
    });
  }

  // Phone Registration
  Future phoneRegistration({String? firstName, String? lastName,String? phoneNumber})async {
    isLoading.value = false;
    await Repository().postPhoneRegistration(
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
    ).then((value) {
      isLoading.value = value!;
    });
    isLoading.value = true;
  }

  Future sendOtpRegistration({String? phoneNumber,String? otp,String? firstName,String? lastName}) async{
    isLoading.value= false;
    await Repository().sendOtpRegistration(
        phoneNumber: phoneNumber,
        otp: otp,
        firstName: firstName,
        lastName: lastName
    )
        .then((value){
      if(value!){
        Get.offAll(() => DashboardScreen());
      }
      isLoading.value = true;
    });
  }


  // Future phoneRegistrationSendOtp({String? phoneNumber,String? otp})async{
  //   isLoading.value= false;
  //   await Repository().postPhoneRegistrationOTP(
  //   phoneNumber: phoneNumber, otp: otp) .then((value){
  //
  //       isLoading.value = true;
  //   });
  // }
}