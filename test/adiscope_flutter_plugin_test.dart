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
