import 'package:flutter/services.dart';
import 'adiscope_flutter_plugin_platform_interface.dart';

class AdiscopeFlutterPlugin {
  Future<bool?> initialize([String mediaId = "", String mediaSecret = "", String callbackTag = "", String childYN = ""]) {
    if (mediaId.length > 0 || mediaSecret.length > 0 || callbackTag.length > 0 || childYN.length > 0) {
      return AdiscopeFlutterPluginPlatform.instance.initialize(mediaId, mediaSecret, callbackTag, childYN);
    } else {
      return AdiscopeFlutterPluginPlatform.instance.initialize();
    }
  }

  Future<bool?> setUserId(String userId) {
    return AdiscopeFlutterPluginPlatform.instance.setUserId(userId);
  }

  Future<bool?> isInitialized() {
    return AdiscopeFlutterPluginPlatform.instance.isInitialized();
  }

  Future<String?> getSDKVersion() {
    return AdiscopeFlutterPluginPlatform.instance.getSDKVersion();
  }

  Future<String?> getNetworkVersions() {
    return AdiscopeFlutterPluginPlatform.instance.getNetworkVersions();
  }

  Future<Map?> getUnitStatus(String unitId) {
    return AdiscopeFlutterPluginPlatform.instance.getUnitStatus(unitId);
  }

  Future<bool?> showMaxMediationDebugger() {
    return AdiscopeFlutterPluginPlatform.instance.showMaxMediationDebugger();
  }

  Future<bool?> showAdmobMediationDebugger() {
    return AdiscopeFlutterPluginPlatform.instance.showAdmobMediationDebugger();
  }

  Future<bool?> setVolumeOff(bool isOn) {
    return AdiscopeFlutterPluginPlatform.instance.setVolumeOff(isOn);
  }

  Future<bool?> showOfferwall(String unitId, [List<String>? offerwallFilterTabs]) {
    if (offerwallFilterTabs != null && offerwallFilterTabs.length > 0) {
      return AdiscopeFlutterPluginPlatform.instance.showOfferwall(unitId, offerwallFilterTabs);
    } else {
      return AdiscopeFlutterPluginPlatform.instance.showOfferwall(unitId);
    }
  }

  Future<bool?> showOfferwallDetail(String unitId, String itemId, [List<String>? offerwallFilterTabs]) {
    if (offerwallFilterTabs != null && offerwallFilterTabs.length > 0) {
      return AdiscopeFlutterPluginPlatform.instance.showOfferwallDetail(unitId, itemId, offerwallFilterTabs);
    } else {
      return AdiscopeFlutterPluginPlatform.instance.showOfferwallDetail(unitId, itemId);
    }
  }

  Future<bool?> showOfferwallDetailFromUrl(String url) {
    return AdiscopeFlutterPluginPlatform.instance.showOfferwallDetailFromUrl(url);
  }

  Future<bool?> rewardedVideoLoad(String unitId) {
    return AdiscopeFlutterPluginPlatform.instance.rewardedVideoLoad(unitId);
  }

  Future<bool?> rewardedVideoIsLoad(String unitId) {
    return AdiscopeFlutterPluginPlatform.instance.rewardedVideoIsLoad(unitId);
  }

  Future<bool?> rewardedVideoShow() {
    return AdiscopeFlutterPluginPlatform.instance.rewardedVideoShow();
  }

  Future<bool?> interstitialLoad(String unitId) {
    return AdiscopeFlutterPluginPlatform.instance.interstitialLoad(unitId);
  }

  Future<bool?> interstitialIsLoad(String unitId) {
    return AdiscopeFlutterPluginPlatform.instance.interstitialIsLoad(unitId);
  }

  Future<bool?> interstitialShow() {
    return AdiscopeFlutterPluginPlatform.instance.interstitialShow();
  }

  Future<Map?> getUnitStatusRewardedInterstitial(String unitId) {
    return AdiscopeFlutterPluginPlatform.instance.getUnitStatusRewardedInterstitial(unitId);
  }

  Future<bool?> preLoadAllRewardedInterstitial() {
    return AdiscopeFlutterPluginPlatform.instance.preLoadAllRewardedInterstitial();
  }

  Future<bool?> preLoadRewardedInterstitial(List<String>? unitIds) {
    return AdiscopeFlutterPluginPlatform.instance.preLoadRewardedInterstitial(unitIds);
  }

  Future<bool?> showRewardedInterstitial(String unitId) {
    return AdiscopeFlutterPluginPlatform.instance.showRewardedInterstitial(unitId);
  }
}

class AdiscopeListener {
  static final listenerOfferwallChannel = const MethodChannel('adiscopeOfferwallListener');
  static final listenerRewardedVideoChannel = const MethodChannel('adiscopeRewardedVideoListener');
  static final listenerInterstitialChannel = const MethodChannel('adiscopeInterstitialListener');
  static final listenerRewardedInterstitialChannel = const MethodChannel('adiscopeRewardedInterstitialListener');

  static Future<void> setupOfferwallListener({
    Function(String)? onOfferwallAdOpened,
    Function(String)? onOfferwallAdClosed,
    Function(String, String, String)? onOfferwallAdFailedToShow,
  }) async {
    listenerOfferwallChannel.setMethodCallHandler((call) async {
      switch (call.method) {
        case 'onOfferwallAdOpened':
          if (onOfferwallAdOpened != null) {
            onOfferwallAdOpened(call.arguments as String);
          }
          break;
        case 'onOfferwallAdClosed':
          if (onOfferwallAdClosed != null) {
            onOfferwallAdClosed(call.arguments as String);
          }
          break;
        case 'onOfferwallAdFailedToShow':
          if (onOfferwallAdFailedToShow != null) {
            List<dynamic> args = call.arguments as List<dynamic>;
            onOfferwallAdFailedToShow(args[0] as String, args[1] as String, args[2] as String);
          }
          break;
        default:
          break;
      }
    });
  }

  static Future<void> setupRewardedVideoListener({
    Function(String)? onRewardedVideoAdLoaded,
    Function(String, String, String)? onRewardedVideoAdFailedToLoad,
    Function(String)? onRewardedVideoAdOpened,
    Function(String)? onRewardedVideoAdClosed,
    Function(String, String, int)? onRewarded,
    Function(String, String, String)? onRewardedVideoAdFailedToShow,
  }) async {
    listenerRewardedVideoChannel.setMethodCallHandler((call) async {
      switch (call.method) {
        case 'onRewardedVideoAdLoaded':
          if (onRewardedVideoAdLoaded != null) {
            onRewardedVideoAdLoaded(call.arguments as String);
          }
          break;
        case 'onRewardedVideoAdFailedToLoad':
          if (onRewardedVideoAdFailedToLoad != null) {
            List<dynamic> args = call.arguments as List<dynamic>;
            onRewardedVideoAdFailedToLoad(args[0] as String, args[1] as String, args[2] as String);
          }
          break;
        case 'onRewardedVideoAdOpened':
          if (onRewardedVideoAdOpened != null) {
            onRewardedVideoAdOpened(call.arguments as String);
          }
          break;
        case 'onRewardedVideoAdClosed':
          if (onRewardedVideoAdClosed != null) {
            onRewardedVideoAdClosed(call.arguments as String);
          }
          break;
        case 'onRewarded':
          if (onRewarded != null) {
            List<dynamic> args = call.arguments as List<dynamic>;
            onRewarded(args[0] as String, args[1] as String, args[2] as int);
          }
          break;
        case 'onRewardedVideoAdFailedToShow':
          if (onRewardedVideoAdFailedToShow != null) {
            List<dynamic> args = call.arguments as List<dynamic>;
            onRewardedVideoAdFailedToShow(args[0] as String, args[1] as String, args[2] as String);
          }
          break;
        default:
          break;
      }
    });
  }


  static Future<void> setupInterstitialListener({
    Function(String)? onInterstitialAdLoaded,
    Function(String, String, String)? onInterstitialAdFailedToLoad,
    Function(String)? onInterstitialAdOpened,
    Function(String)? onInterstitialAdClosed,
    Function(String, String, String)? onInterstitialAdFailedToShow,
  }) async {
    listenerInterstitialChannel.setMethodCallHandler((call) async {
      switch (call.method) {
        case 'onInterstitialAdLoaded':
          if (onInterstitialAdLoaded != null) {
            onInterstitialAdLoaded(call.arguments as String);
          }
          break;
        case 'onInterstitialAdFailedToLoad':
          if (onInterstitialAdFailedToLoad != null) {
            List<dynamic> args = call.arguments as List<dynamic>;
            onInterstitialAdFailedToLoad(args[0] as String, args[1] as String, args[2] as String);
          }
          break;
        case 'onInterstitialAdOpened':
          if (onInterstitialAdOpened != null) {
            onInterstitialAdOpened(call.arguments as String);
          }
          break;
        case 'onInterstitialAdClosed':
          if (onInterstitialAdClosed != null) {
            onInterstitialAdClosed(call.arguments as String);
          }
          break;
        case 'onInterstitialAdFailedToShow':
          if (onInterstitialAdFailedToShow != null) {
            List<dynamic> args = call.arguments as List<dynamic>;
            onInterstitialAdFailedToShow(args[0] as String, args[1] as String, args[2] as String);
          }
          break;
        default:
          break;
      }
    });
  }


  static Future<void> setupRewardedInterstitialListener({
    Function(String)? onRewardedInterstitialAdSkip,
    Function(String)? onRewardedInterstitialAdOpened,
    Function(String)? onRewardedInterstitialAdClosed,
    Function(String, String, int)? onRewardedInterstitialRewarded,
    Function(String, String, String)? onRewardedInterstitialAdFailedToShow,
  }) async {
    listenerRewardedInterstitialChannel.setMethodCallHandler((call) async {
      switch (call.method) {
        case 'onRewardedInterstitialAdSkip':
          if (onRewardedInterstitialAdSkip != null) {
            onRewardedInterstitialAdSkip(call.arguments as String);
          }
          break;
        case 'onRewardedInterstitialAdOpened':
          if (onRewardedInterstitialAdOpened != null) {
            onRewardedInterstitialAdOpened(call.arguments as String);
          }
          break;
        case 'onRewardedInterstitialAdClosed':
          if (onRewardedInterstitialAdClosed != null) {
            onRewardedInterstitialAdClosed(call.arguments as String);
          }
          break;
        case 'onRewardedInterstitialRewarded':
          if (onRewardedInterstitialRewarded != null) {
            List<dynamic> args = call.arguments as List<dynamic>;
            onRewardedInterstitialRewarded(args[0] as String, args[1] as String, args[2] as int);
          }
          break;
        case 'onRewardedInterstitialAdFailedToShow':
          if (onRewardedInterstitialAdFailedToShow != null) {
            List<dynamic> args = call.arguments as List<dynamic>;
            onRewardedInterstitialAdFailedToShow(args[0] as String, args[1] as String, "");
          }
          break;
        default:
          break;
      }
    });
  }
}