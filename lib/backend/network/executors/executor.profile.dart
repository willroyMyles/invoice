import 'package:dio/dio.dart';
import 'package:slim_voice/backend/models/model.profile.dart';
import 'package:slim_voice/backend/network/executors/executor.base.dart';

mixin ProfileExecutor {
  final String _path = "key/profile";

  Future<bool> profile_saveProfile(ProfileModel model) async {
    try {
      if (model.id.isEmpty) {
        return await profile_saveNewProfile(model);
      } else {
        return await profile_updateProfile(model);
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> profile_saveNewProfile(ProfileModel model) async {
    try {
      var res = await BE.post(_path, model.toMap());
      if (res != null) return true;
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> profile_updateProfile(ProfileModel model) async {
    try {
      var res = await BE.put("$_path/${model.id}", model.toMap());
      if (res != null) return true;
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<ProfileModel?> profile_getProfile() async {
    try {
      var res = await BE.get(_path);
      var ans = _convertModels(res);
      return ans.first;
    } catch (e) {
      return null;
    }
  }

  List<ProfileModel> _convertModels(Response? res) {
    List<ProfileModel> models = [];
    for (var e in res!.data[0]["result"]) {
      var mod = ProfileModel.fromMap(e);
      models.add(mod);
    }
    return models;
  }
}
