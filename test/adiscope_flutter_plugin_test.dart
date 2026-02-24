import 'package:flutter_test/flutter_test.dart';
import 'package:adiscope_flutter_plugin/adiscope_flutter_plugin.dart';
import 'package:adiscope_flutter_plugin/adiscope_flutter_plugin_platform_interface.dart';
import 'package:adiscope_flutter_plugin/adiscope_flutter_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAdiscopeFlutterPluginPlatform
    with MockPlatformInterfaceMixin
    implements AdiscopeFlutterPluginPlatform {

  @override
  Future<String?> getNetworkVersions() {
    throw UnimplementedError();
  }

  @override
  Future<String?> getSDKVersion() {
    throw UnimplementedError();
  }

  @override
  Future<Map?> getUnitStatus(String unitId) {
    throw UnimplementedError();
  }

  @override
  Future<Map?> getUnitStatusRewardedInterstitial(String unitId) {
    throw UnimplementedError();
  }

  @override
  Future<bool?> initialize([String mediaId = "", String mediaSecret = "", String callbackTag = "", String childYN = ""]) {
    throw UnimplementedError();
  }

  @override
  Future<bool?> interstitialIsLoad(String unitId) {
    throw UnimplementedError();
  }

  @override
  Future<bool?> interstitialLoad(String unitId) {
    throw UnimplementedError();
  }

  @override
  Future<bool?> interstitialShow() {
    throw UnimplementedError();
  }

  @override
  Future<bool?> isInitialized() {
    throw UnimplementedError();
  }

  @override
  Future<bool?> preLoadAllRewardedInterstitial() {
    throw UnimplementedError();
  }

  @override
  Future<bool?> preLoadRewardedInterstitial(List<String>? unitIds) {
    throw UnimplementedError();
  }

  @override
  Future<bool?> rewardedVideoIsLoad(String unitId) {
    throw UnimplementedError();
  }

  @override
  Future<bool?> rewardedVideoLoad(String unitId) {
    throw UnimplementedError();
  }

  @override
  Future<bool?> rewardedVideoShow() {
    throw UnimplementedError();
  }

  @override
  Future<bool?> setUserId(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<bool?> setRewardedCheckParam(String param) {
    throw UnimplementedError();
  }

  @override
  Future<bool?> setVolumeOff(bool isOn) {
    throw UnimplementedError();
  }

  @override
  Future<bool?> setShowWithLoad2BackgroundColor(String red, String green, String blue, String alpha) {
    throw UnimplementedError();
  }

  @override
  Future<bool?> setShowWithLoad2IndicatorStyle(bool isMedum, bool isHidden) {
    throw UnimplementedError();
  }

  @override
  Future<bool?> setShowWithLoad2ErrorAlert(String msg, bool isHidden) {
    throw UnimplementedError();
  }

  @override
  Future<bool?> showAdmobMediationDebugger() {
    throw UnimplementedError();
  }

  @override
  Future<bool?> showMaxMediationDebugger() {
    throw UnimplementedError();
  }

  @override
  Future<bool?> showOfferwall(String unitId, [List<String>? offerwallFilterTabs]) {
    throw UnimplementedError();
  }

  @override
  Future<bool?> showOfferwallDetail(String unitId, String itemId, [List<String>? offerwallFilterTabs]) {
    throw UnimplementedError();
  }

  @override
  Future<bool?> showOfferwallDetailFromUrl(String url) {
    throw UnimplementedError();
  }

  @override
  Future<bool?> showAdEvent(String unitId) {
    throw UnimplementedError();
  }

  @override
  Future<bool?> showLuckyEvent() {
    throw UnimplementedError();
  }

  @override
  Future<bool?> setLuckyEventAppId(String eventId, String pid) {
    throw UnimplementedError();
  }

  @override
  Future<bool?> setLuckyEventUseSafeAreaWebView(bool useSafeArea) {
    throw UnimplementedError();
  }

  @override
  Future<bool?> setLuckyEventHashMark(String hashMark) {
    throw UnimplementedError();
  }

  @override
  Future<bool?> setLuckyEventBaseUrl(String baseUrl) {
    throw UnimplementedError();
  }

  @override
  Future<bool?> setLuckyEventExtraParam(String key, String value) {
    throw UnimplementedError();
  }

  @override
  Future<bool?> rewardedVideoShowWithLoad(String unitId) {
    throw UnimplementedError();
  }

  @override
  Future<bool?> interstitialShowWithLoad(String unitId) {
    throw UnimplementedError();
  }

  @override
  Future<bool?> showRewardedInterstitial(String unitId) {
    throw UnimplementedError();
  }
}

void main() {
  final AdiscopeFlutterPluginPlatform initialPlatform = AdiscopeFlutterPluginPlatform.instance;

  test('$MethodChannelAdiscopeFlutterPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAdiscopeFlutterPlugin>());
  });
}
