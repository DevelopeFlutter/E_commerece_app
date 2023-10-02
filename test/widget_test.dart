// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:yoori_ecommerce/config.dart';
import 'package:yoori_ecommerce/src/models/my_reward_model.dart';
import 'package:yoori_ecommerce/src/models/my_wallet_model.dart';
import 'package:yoori_ecommerce/src/models/video_shopping_details_model.dart';
import 'package:yoori_ecommerce/src/utils/constants.dart';


void main() {
  test('', () async {
    final response = await http.get(
      Uri.parse("https://yoori.spagreen.net/api/v100/user/my-reward?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wveW9vcmkuc3BhZ3JlZW4ubmV0XC9hcGlcL3YxMDBcL2xvZ2luIiwiaWF0IjoxNjg1MDIwNTU2LCJuYmYiOjE2ODUwMjA1NTYsImp0aSI6ImF0TWpjZTRZbkFrVXFmcUgiLCJzdWIiOjQsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjciLCJpZCI6NCwibmFtZSI6bnVsbCwiZW1haWwiOiJjdXN0b21lckBzcGFncmVlbi5uZXQiLCJjcmVhdGVkX2F0IjoiMjAyMi0wMy0yN1QwNToxNToxNC4wMDAwMDBaIiwidXBkYXRlZF9hdCI6IjIwMjMtMDUtMjVUMTM6MTU6MDIuMDAwMDAwWiJ9.b27tD_m2uGwUQw4cq2v997josAIbV29pIUsyeC9qZ08"),
      headers:  {"apiKey": Config.apiKey}
    );
    try {
      print("response_body${response.body}");
      var data = json.decode(response.body);
      print("data:$data");
      var myRewardModel = MyRewardModel.fromJson(data);
      printLog("myRewardModel => ${myRewardModel.data!.rewardDetails!.data!.length}");
      return myRewardModel;
    } catch (e) {
      printLog("inside catch");
      throw Exception(e);
    }

  });
}
