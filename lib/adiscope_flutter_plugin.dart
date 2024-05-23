import 'package:flutter/services.dart';
import 'adiscope_flutter_plugin_platform_interface.dart';

class AdiscopeFlutterPlugin {
  /// Initialize adisocpe with [mediaid, mediasecret, callbackTag, childYN].
  Future<bool?> initialize(
      [String mediaId = "",
      String mediaSecret = "",
      String callbackTag = "",
      String childYN = ""]) {
    if (mediaId.isNotEmpty ||
        mediaSecret.isNotEmpty ||
        callbackTag.isNotEmpty ||
        childYN.isNotEmpty) {
      return AdiscopeFlutterPluginPlatform.instance
          .initialize(mediaId, mediaSecret, callbackTag, childYN);
    } else {
      return AdiscopeFlutterPluginPlatform.instance.initialize();
    }
  }

  /// User information settings
  Future<bool?> setUserId(String userId) {
    return AdiscopeFlutterPluginPlatform.instance.setUserId(userId);
  }

  /// Check initialize
  Future<bool?> isInitialized() {
    return AdiscopeFlutterPluginPlatform.instance.isInitialized();
  }

  /// Check adiscope sdk version
  Future<String?> getSDKVersion() {
    return AdiscopeFlutterPluginPlatform.instance.getSDKVersion();
  }

  /// Check the versions of third-party networks
  Future<String?> getNetworkVersions() {
    return AdiscopeFlutterPluginPlatform.instance.getNetworkVersions();
  }

  /// Check unit status of offerwall or rewardedvideo with [unitId]
  Future<Map?> getUnitStatus(String unitId) {
    return AdiscopeFlutterPluginPlatform.instance.getUnitStatus(unitId);
  }

  /// Max Mediation Debugger
  Future<bool?> showMaxMediationDebugger() {
    return AdiscopeFlutterPluginPlatform.instance.showMaxMediationDebugger();
  }

  /// Admob Mediation Debugger
  Future<bool?> showAdmobMediationDebugger() {
    return AdiscopeFlutterPluginPlatform.instance.showAdmobMediationDebugger();
  }

  /// Adjust advertising sound with [isOn]
  Future<bool?> setVolumeOff(bool isOn) {
    return AdiscopeFlutterPluginPlatform.instance.setVolumeOff(isOn);
  }

  /// The offer wall of [unitId] is exposed, and the filter value is set to [offerwallFilterTabs].
  Future<bool?> showOfferwall(String unitId,
      [List<String>? offerwallFilterTabs]) {
    if (offerwallFilterTabs != null && offerwallFilterTabs.isNotEmpty) {
      return AdiscopeFlutterPluginPlatform.instance
          .showOfferwall(unitId, offerwallFilterTabs);
    } else {
      return AdiscopeFlutterPluginPlatform.instance.showOfferwall(unitId);
    }
  }

  /// The offer wall detail page of [unitId, itemId] is exposed, and the filter value is set to [offerwallFilterTabs].
  Future<bool?> showOfferwallDetail(String unitId, String itemId,
      [List<String>? offerwallFilterTabs]) {
    if (offerwallFilterTabs != null && offerwallFilterTabs.isNotEmpty) {
      return AdiscopeFlutterPluginPlatform.instance
          .showOfferwallDetail(unitId, itemId, offerwallFilterTabs);
    } else {
      return AdiscopeFlutterPluginPlatform.instance
          .showOfferwallDetail(unitId, itemId);
    }
  }

  /// Exposes the offer wall detail page of [unitId, itemId].
  Future<bool?> showOfferwallDetailFromUrl(String url) {
    return AdiscopeFlutterPluginPlatform.instance
        .showOfferwallDetailFromUrl(url);
  }

  /// Load rewardedVideo of [unitId] value.
  Future<bool?> rewardedVideoLoad(String unitId) {
    return AdiscopeFlutterPluginPlatform.instance.rewardedVideoLoad(unitId);
  }

  /// Check the Load status of the rewardedVideo of the [unitId] value.
  Future<bool?> rewardedVideoIsLoad(String unitId) {
    return AdiscopeFlutterPluginPlatform.instance.rewardedVideoIsLoad(unitId);
  }

  /// Show rewardedVideo.
  Future<bool?> rewardedVideoShow() {
    return AdiscopeFlutterPluginPlatform.instance.rewardedVideoShow();
  }

  /// Load interstitial of [unitId] value.
  Future<bool?> interstitialLoad(String unitId) {
    return AdiscopeFlutterPluginPlatform.instance.interstitialLoad(unitId);
  }

  /// Check the Load status of the interstitial of the [unitId] value.
  Future<bool?> interstitialIsLoad(String unitId) {
    return AdiscopeFlutterPluginPlatform.instance.interstitialIsLoad(unitId);
  }

  /// Show interstitial.
  Future<bool?> interstitialShow() {
    return AdiscopeFlutterPluginPlatform.instance.interstitialShow();
  }

  /// Check unit status of offerwall or RewardedInterstitial with [unitId]
  Future<Map?> getUnitStatusRewardedInterstitial(String unitId) {
    return AdiscopeFlutterPluginPlatform.instance
        .getUnitStatusRewardedInterstitial(unitId);
  }

  /// Loads all units of RewardedInterstitial.
  Future<bool?> preLoadAllRewardedInterstitial() {
    return AdiscopeFlutterPluginPlatform.instance
        .preLoadAllRewardedInterstitial();
  }

  /// Loads the [unitIds] values of RewardedInterstitial.
  Future<bool?> preLoadRewardedInterstitial(List<String>? unitIds) {
    return AdiscopeFlutterPluginPlatform.instance
        .preLoadRewardedInterstitial(unitIds);
  }

  /// Show interstitial of [unitId] value.
  Future<bool?> showRewardedInterstitial(String unitId) {
    return AdiscopeFlutterPluginPlatform.instance
        .showRewardedInterstitial(unitId);
  }
}

class AdiscopeListener {
  /// Register listener channel of offerwall
  static final listenerOfferwallChannel =
      const MethodChannel('adiscopeOfferwallListener');

  /// Register listener channel of rewardedVideo
  static final listenerRewardedVideoChannel =
      const MethodChannel('adiscopeRewardedVideoListener');

  /// Register listener channel of interstitial
  static final listenerInterstitialChannel =
      const MethodChannel('adiscopeInterstitialListener');

  /// Register listener channel of rewardedInterstitial
  static final listenerRewardedInterstitialChannel =
      const MethodChannel('adiscopeRewardedInterstitialListener');

  /// Register listener of offerwall
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
            onOfferwallAdFailedToShow(
                args[0] as String, args[1] as String, args[2] as String);
          }
          break;
        default:
          break;
      }
    });
  }

  /// Register listener of rewardedVideo
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
            onRewardedVideoAdFailedToLoad(
                args[0] as String, args[1] as String, args[2] as String);
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
            onRewardedVideoAdFailedToShow(
                args[0] as String, args[1] as String, args[2] as String);
          }
          break;
        default:
          break;
      }
    });
  }

  /// Register listener of interstitial
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
            onInterstitialAdFailedToLoad(
                args[0] as String, args[1] as String, args[2] as String);
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
            onInterstitialAdFailedToShow(
                args[0] as String, args[1] as String, args[2] as String);
          }
          break;
        default:
          break;
      }
    });
  }

  /// Register listener of rewardedInterstitial
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
            onRewardedInterstitialRewarded(
                args[0] as String, args[1] as String, args[2] as int);
          }
          break;
        case 'onRewardedInterstitialAdFailedToShow':
          if (onRewardedInterstitialAdFailedToShow != null) {
            List<dynamic> args = call.arguments as List<dynamic>;
            onRewardedInterstitialAdFailedToShow(
                args[0] as String, args[1] as String, "");
          }
          break;
        default:
          break;
      }
    });
  }
}
