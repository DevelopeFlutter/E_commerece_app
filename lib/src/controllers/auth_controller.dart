import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:yoori_ecommerce/src/models/user_data_model.dart';
import 'package:yoori_ecommerce/src/screen/auth_screen/login_screen.dart';
import 'package:yoori_ecommerce/src/screen/dashboard/dashboard_screen.dart';

import 'package:yoori_ecommerce/src/servers/repository.dart';
import 'package:yoori_ecommerce/src/data/local_data_helper.dart';
import 'package:yoori_ecommerce/src/utils/app_tags.dart';
import 'package:yoori_ecommerce/src/utils/constants.dart';

class AuthController extends GetxController {
  final GoogleSignIn _googleSign = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static AuthController authInstance =
      Get.put(AuthController(), permanent: true);
  late Rx<GoogleSignInAccount?> _googleSignInAccount;
  final box = GetStorage();

  final _isLoggingIn = false.obs;
  bool get isLoggingIn => _isLoggingIn.value;

  //login screen
  TextEditingController? emailController;
  TextEditingController? passwordController;
  var isVisible = true.obs;
  var isValue = LocalDataHelper().getRememberPass() != null ? true.obs : false.obs;
  bool isLoading = false;

  isValueUpdate(value){
    isValue.value = value!;
  }
  isVisibleUpdate() {
    isVisible.value = !isVisible.value;
  }

  //SignUp Screen
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailControllers = TextEditingController();
  var passwordControllers = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var passwordVisible = true.obs;
  var confirmPasswordVisible = true.obs;

  isVisiblePasswordUpdate(){
    passwordVisible.value = !passwordVisible.value;
  }
  isVisibleConfirmPasswordUpdate(){
    confirmPasswordVisible.value = !confirmPasswordVisible.value;
  }

  @override
  void onInit() {
    emailController =
        TextEditingController(text: LocalDataHelper().getRememberMail() ?? "");
    passwordController =
        TextEditingController(text: LocalDataHelper().getRememberPass() ?? "");
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    _googleSignInAccount = Rx<GoogleSignInAccount?>(_googleSign.currentUser);
    _googleSignInAccount.bindStream(_googleSign.onCurrentUserChanged);
    ever(_googleSignInAccount, _setInitialScreenGoogle);
  }

//General LogIn
  void loginWithEmailPassword(
      {required String email, required String password,String? trxId}) async {
    _isLoggingIn(true);
    await Repository().loginWithEmailPassword(email, password, trxId).then(
      (value) {
        if (value) Get.offAll(() => DashboardScreen());
        _isLoggingIn(false);
      },
    );
  }

  //General SignUp
  Future signUp(
      {required String firstName,
        required String lastName,
        required String email,
        required String password,
        required String confirmPassword}) async {
    _isLoggingIn(true);
    await Repository()
        .signUp(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    ).then((value) {
      _isLoggingIn(false);
    });
    _isLoggingIn(false);
  }


  //Google SignIn
  _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
    if (googleSignInAccount != null) {
      Get.offAll(() => DashboardScreen());
    } else {
      Get.offAll(() =>  LoginScreen());
    }
  }

  void signInWithGoogle() async {
    _isLoggingIn(true);
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSign.signIn();
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final User? user = (await _auth.signInWithCredential(credential)).user;
        if (user != null) {
          UserDataModel? userDataModel = await Repository().postFirebaseAuth(
            name: user.displayName.toString(),
            email: user.providerData[0].email ?? "",
            phone: user.phoneNumber??"",
            image: user.photoURL??"",
            providerId: "google.com",
            uid: user.uid
          );
          if (userDataModel != null) {
            printLog("---------google auth: success");
            Get.offAll(() => DashboardScreen());
            _isLoggingIn(false);
          } else {
            printLog("---------google auth: failed");
            _isLoggingIn(false);
            Get.snackbar(
              "Error!!",
              "Failed to login",
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        } else {
          printLog("-----google user null");
          _isLoggingIn(false);
          Get.snackbar(
            "Error!!",
            "Failed to login",
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }
    } catch (e) {
      printLog("-----sign in error: $e");
      _isLoggingIn(false);
      Get.snackbar(
        "Error!!",
        "Failed to login",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  //Facebook Login
  Future<void> facebookLogin() async {
    _isLoggingIn(true);
    User? user = await _createFBLoginFlow();

    if (user != null) {
      await Repository()
          .postFirebaseAuth(
        name: user.displayName ?? "",
        email: user.providerData[0].email ?? "",
        phone: user.phoneNumber??"",
        image: user.photoURL??"",
        providerId: "facebook.com",
        uid: user.uid
      ).then((value) {
        _isLoggingIn(false);
        if (value != null) {
          //go to home screen
          Get.offAll(() => DashboardScreen());
        } else {
          Get.snackbar(
            "Error!",
            "Failed to signing in with facebook.",
            snackPosition: SnackPosition.BOTTOM,
            borderRadius: 10,
          );
        }
      });
    } else {
      _isLoggingIn(false);
      Get.snackbar(
        "Error!",
        "Failed to signin.",
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 10,
      );
    }
  }
  Future<UserCredential> _getFBCredential() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();
    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken != null
            ? loginResult.accessToken!.token
            : "");
    // Once signed in, return the UserCredential
    return _auth.signInWithCredential(facebookAuthCredential);
  }
  Future<User?> _createFBLoginFlow() async {
    UserCredential credential = await _getFBCredential();
    User? user = credential.user;
    return user;
  }


  //apple Login
  //final FirebaseAuth _auth = FirebaseAuth.instance;
  emailTrim(String email){
    String delimiter = '@';
    int lastIndex = email.indexOf(delimiter);
    String trimmed = email.substring(0,lastIndex);
    printLog(trimmed);
    return trimmed;
  }

  Future signInWithApple() async {
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    final OAuthProvider oAuthProvider = OAuthProvider('apple.com');
    final credential = oAuthProvider.credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode);
    final User? user = (await _auth.signInWithCredential(credential)).user;

    if(user!.email!=null){
      await Repository()
          .postFirebaseAuth(
          name: user.displayName ??emailTrim(user.email!),
          email: user.email.toString(),
          phone: user.providerData[0].phoneNumber ?? "",
          image: user.photoURL??"",
          providerId: "apple.com",
          uid: user.uid
      ).then((value) => Get.offAll(() => DashboardScreen()));
    }else{
      Get.snackbar(
        AppTags.login.tr,
        AppTags.doNotMatchCredential.tr,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        colorText: Colors.black,
        backgroundColor: Colors.red,
        forwardAnimationCurve: Curves.decelerate,
        shouldIconPulse: false,
      );
    }

    if (user.email != null && user.email != "") {
      assert(user.email != null);
    }
    if (user.displayName != null && user.displayName != "") {
      assert(user.displayName != null);
    }
    assert(!user.isAnonymous);

    final User? currentUser =
        (await _auth.signInWithCredential(credential)).user;
    assert(user.uid == currentUser!.uid);
    printLog("--- User----$currentUser");
    return user;
  }

  int addonIndex({String? addonIndex}){
    int index = LocalDataHelper().getConfigData().data!.addons!.indexWhere((element) => element.addonIdentifier==addonIndex);
    printLog("-------------$index");
    return index;
  }

  //Sign Out
  void signOut() async {
    try {
      printLog("From Auth: ${LocalDataHelper().box.read("userToken")}");
      await _googleSign.signOut();
      await _auth.signOut();
      await Repository().logOut().then((value) {
        LocalDataHelper().box.remove("userToken");
        LocalDataHelper().box.remove("trxId");
        LocalDataHelper().box.remove('userModel');
        Get.offAll(() =>  DashboardScreen());
      });
    } catch (e) {
      printLog(e.toString());
    }
  }
}
