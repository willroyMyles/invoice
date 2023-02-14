import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slim_voice/backend/enum/enum.currency.dart';
import 'package:slim_voice/backend/models/model.profile.dart';
import 'package:slim_voice/backend/network/executors/executor.dart';

import '../../backend/enum/enum.dueDate.dart';
import '../../backend/enum/enum.negativeSign.dart';

class SettingsState extends GetxController {
  ProfileModel model = ProfileModel.empty();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController currency = TextEditingController();
  TextEditingController dueDate = TextEditingController();
  TextEditingController negativeNumber = TextEditingController();

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getProfile();
  }

  onCurrencyChanged(Currency currency) => model.currency = currency;
  onDueDateChanged(DueDate dueDate) => model.defaultDueDate = dueDate;
  onNegativeSignChanged(NegativeSign negativeSign) => model.sign = negativeSign;

  updateProfile() async {
    model.name = name.text;
    model.address = address.text;
    // model.sign =
    var res = await exe.profile_saveProfile(model);
    if (res) {
      //success
    } else {
      //boi...
    }

    refresh();
  }

  getProfile() async {
    var m = await exe.profile_getProfile();
    if (m != null) {
      model = m;
      name.text = m.name;
      address.text = m.address;
      currency.text = m.currency.name;
      dueDate.text = m.defaultDueDate.name;
      negativeNumber.text = m.sign.name;
    }
    refresh();
  }
}
