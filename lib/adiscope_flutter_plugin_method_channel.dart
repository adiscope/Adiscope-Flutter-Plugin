import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'adiscope_flutter_plugin_platform_interface.dart';

/// An implementation of [AdiscopeFlutterPluginPlatform] that uses method channels.
class MethodChannelAdiscopeFlutterPlugin extends AdiscopeFlutterPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('adiscope_flutter_plugin');

  @override
  Future<bool?> initialize([String mediaId = "", String mediaSecret = "", String callbackTag = "", String childYN = ""]) async {
    final result = await methodChannel.invokeMethod<bool>('initialize', <String, dynamic>{ "mediaId": mediaId, "mediaSecret": mediaSecret, "callbackTag": callbackTag, "childYN": childYN });
    return result;
  }

  @override
  Future<bool?> setUserId(String userId) async {
    final result = await methodChannel.invokeMethod<bool>('setUserId', <String, dynamic>{ "userId": userId });
    return result;
  }

  @override
  Future<bool?> isInitialized() async {
    final result = await methodChannel.invokeMethod<bool>('isInitialized');
    return result;
  }

  @override
  Future<String?> getSDKVersion() async {
    final result = await methodChannel.invokeMethod<String>('getSDKVersion');
    return result;
  }

  @override
  Future<String?> getNetworkVersions() async {
    final result = await methodChannel.invokeMethod<String>('getNetworkVersions');
    return result;
  }

  @override
  Future<Map?> getUnitStatus(String unitId) async {
    final result = await methodChannel.invokeMethod<Map>('getUnitStatus', <String, dynamic>{ "unitId": unitId });
    return result;
  }

  @override
  Future<bool?> showMaxMediationDebugger() async {
    final result = await methodChannel.invokeMethod<bool>('showMaxMediationDebugger');
    return result;
  }

  @override
  Future<bool?> showAdmobMediationDebugger() async {
    final result = await methodChannel.invokeMethod<bool>('showAdmobMediationDebugger');
    return result;
  }

  @override
  Future<bool?> setVolumeOff(bool isOn) async {
    final result = await methodChannel.invokeMethod<bool>('setVolumeOff', <String, dynamic>{ "isOn": isOn });
    return result;
  }

  @override
  Future<bool?> showOfferwall(String unitId, [List<String>? offerwallFilterTabs]) async {
    final result = await methodChannel.invokeMethod<bool>('showOfferwall', <String, dynamic>{ "unitId": unitId, "offerwallFilterTabs": offerwallFilterTabs });
    return result;
  }

  @override
  Future<bool?> showOfferwallDetail(String unitId, String itemId, [List<String>? offerwallFilterTabs]) async {
    final result = await methodChannel.invokeMethod<bool>('showOfferwallDetail', <String, dynamic>{ "unitId": unitId, "itemId": itemId, "offerwallFilterTabs": offerwallFilterTabs });
    return result;
  }

  @override
  Future<bool?> showOfferwallDetailFromUrl(String url) async {
    final result = await methodChannel.invokeMethod<bool>('showOfferwallDetailFromUrl', <String, dynamic>{ "url": url });
    return result;
  }

  @override
  Future<bool?> rewardedVideoLoad(String unitId) async {
    final result = await methodChannel.invokeMethod<bool>('rewardedVideoLoad', <String, dynamic>{ "unitId": unitId });
    return result;
  }

  @override
  Future<bool?> rewardedVideoIsLoad(String unitId) async {
    final result = await methodChannel.invokeMethod<bool>('rewardedVideoIsLoad', <String, dynamic>{ "unitId": unitId });
    return result;
  }

  @override
  Future<bool?> rewardedVideoShow() async {
    final result = await methodChannel.invokeMethod<bool>('rewardedVideoShow');
    return result;
  }

  @override
  Future<bool?> interstitialLoad(String unitId) async {
    final result = await methodChannel.invokeMethod<bool>('interstitialLoad', <String, dynamic>{ "unitId": unitId });
    return result;
  }

  @override
  Future<bool?> interstitialIsLoad(String unitId) async {
    final result = await methodChannel.invokeMethod<bool>('interstitialIsLoad', <String, dynamic>{ "unitId": unitId });
    return result;
  }

  @override
  Future<bool?> interstitialShow() async {
    final result = await methodChannel.invokeMethod<bool>('interstitialShow');
    return result;
  }

  @override
  Future<Map?> getUnitStatusRewardedInterstitial(String unitId) async {
    final result = await methodChannel.invokeMethod<Map>('getUnitStatusRewardedInterstitial', <String, dynamic>{ "unitId": unitId });
    return result;
  }

  @override
  Future<bool?> preLoadAllRewardedInterstitial() async {
    final result = await methodChannel.invokeMethod<bool>('preLoadAllRewardedInterstitial');
    return result;
  }

  @override
  Future<bool?> preLoadRewardedInterstitial(List<String>? unitIds) async {
    final result = await methodChannel.invokeMethod<bool>('preLoadRewardedInterstitial', <String, dynamic>{ "unitIds": unitIds });
    return result;
  }

  @override
  Future<bool?> showRewardedInterstitial(String unitId) async {
    final result = await methodChannel.invokeMethod<bool>('showRewardedInterstitial', <String, dynamic>{ "unitId": unitId });
    return result;
  }
}

