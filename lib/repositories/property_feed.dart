import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:funda_assignment/models/property_model.dart';
import 'package:funda_assignment/models/property_feed_model.dart';
import 'package:funda_assignment/services/api.dart';

class PropertyFeedRepo with ChangeNotifier {
  bool _loading = true;
  bool _hasData = false;
  late PropertyFeedModel feed;
  PropertyModel? property;

  void fetchFeed() {
    /// only fetch feed once
    if (_hasData == false) {
      ApiService()
          .getApiData('ac1b0b1572524640a0ecc54de453ea9f./?type=koop&zo=/amsterdam/tuin/video/')
          .then((response) {
        try {
          feed = PropertyFeedModel.fromJson(jsonDecode(response));
          _loading = false;
          _hasData = true;
          notifyListeners();
        } catch (error, stacktrace) {
          _hasData = false;
          _loading = false;
          notifyListeners();
          print('Exception occured: $error stackTrace: $stacktrace');
        }
      }).catchError((onError) {
        _hasData = false;
        _loading = false;
        notifyListeners();
      });
    }
  }

  void fetchProperty({required String id}) {
    if (_loading == true) return;
    _loading = true;
    ApiService().getApiData('detail/ac1b0b1572524640a0ecc54de453ea9f./koop/$id/').then((response) {
      try {
        property = PropertyModel.fromJson(jsonDecode(response));
        _loading = false;
        _hasData = true;
        notifyListeners();
      } catch (error, stacktrace) {
        print('Exception occured: $error stackTrace: $stacktrace');
        _loading = false;
        notifyListeners();
      }
    }).catchError((onError) {
      _loading = false;
      notifyListeners();
    });
  }

  bool get loading => _loading;
  bool get hasData => _hasData;

  List<String?> get images {
    List<String?> list = property!.media.map((Media media) {
      if (media.categorie == 1) return media.mediaItems.last.url;
    }).toList();
    list.removeWhere((String? str) => str == null);
    return list;
  }
}
