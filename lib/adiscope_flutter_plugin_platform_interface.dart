import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'adiscope_flutter_plugin_method_channel.dart';

abstract class AdiscopeFlutterPluginPlatform extends PlatformInterface {
  /// Constructs a AdiscopeFlutterPluginPlatform.
  AdiscopeFlutterPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static AdiscopeFlutterPluginPlatform _instance = MethodChannelAdiscopeFlutterPlugin();

  /// The default instance of [AdiscopeFlutterPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelAdiscopeFlutterPlugin].
  static AdiscopeFlutterPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AdiscopeFlutterPluginPlatform] when
  /// they register themselves.
  static set instance(AdiscopeFlutterPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool?> initialize([String mediaId = "", String mediaSecret = "", String callbackTag = "", String childYN = ""]) {
    throw UnimplementedError('initialize() has not been implemented.');
  }

  Future<bool?> setUserId(String userId) {
    throw UnimplementedError('setUserId() has not been implemented.');
  }

  Future<bool?> isInitialized() {
    throw UnimplementedError('isInitialized() has not been implemented.');
  }

  Future<String?> getSDKVersion() {
    throw UnimplementedError('getSDKVersion() has not been implemented.');
  }

  Future<String?> getNetworkVersions() {
    throw UnimplementedError('getNetworkVersions() has not been implemented.');
  }

  Future<Map?> getUnitStatus(String unitId) {
    throw UnimplementedError('getUnitStatus() has not been implemented.');
  }

  Future<bool?> showMaxMediationDebugger() {
    throw UnimplementedError('showMaxMediationDebugger() has not been implemented.');
  }

  Future<bool?> showAdmobMediationDebugger() {
    throw UnimplementedError('showAdmobMediationDebugger() has not been implemented.');
  }

  Future<bool?> setVolumeOff(bool isOn) {
    throw UnimplementedError('setVolumeOff() has not been implemented.');
  }

  Future<bool?> showOfferwall(String unitId, [List<String>? offerwallFilterTabs]) {
    throw UnimplementedError('showOfferwall() has not been implemented.');
  }

  Future<bool?> showOfferwallDetail(String unitId, String itemId, [List<String>? offerwallFilterTabs]) {
    throw UnimplementedError('showOfferwallDetail() has not been implemented.');
  }

  Future<bool?> showOfferwallDetailFromUrl(String url) {
    throw UnimplementedError('showOfferwallDetailFromUrl() has not been implemented.');
  }

  Future<bool?> rewardedVideoLoad(String unitId) {
    throw UnimplementedError('rewardedVideoLoad() has not been implemented.');
  }

  Future<bool?> rewardedVideoIsLoad(String unitId) {
    throw UnimplementedError('rewardedVideoIsLoad() has not been implemented.');
  }

  Future<bool?> rewardedVideoShow() {
    throw UnimplementedError('rewardedVideoShow() has not been implemented.');
  }

  Future<bool?> interstitialLoad(String unitId) {
    throw UnimplementedError('interstitialLoad() has not been implemented.');
  }

  Future<bool?> interstitialIsLoad(String unitId) {
    throw UnimplementedError('interstitialIsLoad() has not been implemented.');
  }

  Future<bool?> interstitialShow() {
    throw UnimplementedError('interstitialShow() has not been implemented.');
  }

  Future<Map?> getUnitStatusRewardedInterstitial(String unitId) {
    throw UnimplementedError('getUnitStatusRewardedInterstitial() has not been implemented.');
  }

  Future<bool?> preLoadAllRewardedInterstitial() {
    throw UnimplementedError('preLoadAllRewardedInterstitial() has not been implemented.');
  }

  Future<bool?> preLoadRewardedInterstitial(List<String>? unitIds) {
    throw UnimplementedError('preLoadRewardedInterstitial() has not been implemented.');
  }

  Future<bool?> showRewardedInterstitial(String unitId) {
    throw UnimplementedError('showRewardedInterstitial() has not been implemented.');
  }
}

