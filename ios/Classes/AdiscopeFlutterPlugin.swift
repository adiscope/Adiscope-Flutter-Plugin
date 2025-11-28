import Flutter
import UIKit
import Adiscope

public class AdiscopeFlutterPlugin: NSObject, FlutterPlugin, AdiscopeDelegate {

  var _adiscopeRegistrar: FlutterPluginRegistrar?
  var _adiscopeResult: FlutterResult?

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "adiscope_flutter_plugin", binaryMessenger: registrar.messenger())
    let instance = AdiscopeFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
    instance._adiscopeRegistrar = registrar
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    _adiscopeResult = result
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "initialize":
      if let adiscopeSDK = AdiscopeInterface.sharedInstance() {
        adiscopeSDK.setMainDelegate(self)
        if let args = call.arguments as? Dictionary<String, Any>{
          if let mediaId = args["mediaId"] as? String, mediaId.count > 0, let mediaSecret = args["mediaSecret"] as? String, mediaSecret.count > 0, let callbackTag = args["callbackTag"] as? String, callbackTag.count > 0 {
            adiscopeSDK.initialize(mediaId, mediaSecret: mediaSecret, callBackTag: callbackTag)
          } else if let mediaId = args["mediaId"] as? String, mediaId.count > 0, let mediaSecret = args["mediaSecret"] as? String, mediaSecret.count > 0 {
            adiscopeSDK.initialize(mediaId, mediaSecret: mediaSecret)
          } else if let callbackTag = args["callbackTag"] as? String, callbackTag.count > 0 {
            adiscopeSDK.initialize(callbackTag)
          } else {
            adiscopeSDK.initialize()
          }
          return;
        }
      }
      result(false)
    case "setUserId":
      var resultValue = false
      if let adiscopeSDK = AdiscopeInterface.sharedInstance() {
        if let args = call.arguments as? Dictionary<String, Any>{
          if let userId = args["userId"] as? String {
            resultValue = adiscopeSDK.setUserId(userId)
          }
        }
      }
      result(resultValue)
    case "setRewardedCheckParam":
      if let adiscopeSDK = AdiscopeInterface.sharedInstance() {
        if let args = call.arguments as? Dictionary<String, Any>{
          if let param = args["param"] as? String {
            adiscopeSDK.setRewardedCheckParam(param)
            result(true)
            return;
          }
        }
      }
      result(false)
    case "isInitialized":
      result(AdiscopeInterface.sharedInstance().isInitialized())
    case "getSDKVersion":
      result(AdiscopeInterface.sharedInstance().getSDKVersion())
    case "getNetworkVersions":
      result(AdiscopeInterface.sharedInstance().networkVersions)
    case "getUnitStatus":
      if let adiscopeSDK = AdiscopeInterface.sharedInstance() {
        if let args = call.arguments as? Dictionary<String, Any>{
          if let unitId = args["unitId"] as? String {
            adiscopeSDK.getUnitStatus(unitId)
            return;
          }
        }
      }
      result([])
    case "showMaxMediationDebugger":
      AdiscopeInterface.sharedInstance().showMaxMediationDebugger()
      result(true)
    case "showAdmobMediationDebugger":
      AdiscopeInterface.sharedInstance().showAdmobMediationDebugger()
      result(true)
    case "setVolumeOff":
      if let adiscopeSDK = AdiscopeInterface.sharedInstance() {
        if let args = call.arguments as? Dictionary<String, Any>{
          if let isOn = args["isOn"] as? Bool {
            if (isOn) {
              adiscopeSDK.setVolumeOff()
            } else {
              adiscopeSDK.setVolumeOn()
            }
            result(true)
            return;
          }
        }
      }
      result(false)
    case "setShowWithLoad2BackgroundColor":
      if let adiscopeSDK = AdiscopeInterface.sharedInstance() {
        if let args = call.arguments as? Dictionary<String, Any>{
          if let red = args["red"] as? String, let green = args["green"] as? String, let blue = args["blue"] as? String, let alpha = args["alpha"] as? String {
            adiscopeSDK.setShowWithLoad2BackgroundColor(red, green: green, blue: blue, alpha: alpha)
            result(true)
            return;
          }
        }
      }
      result(false)
    case "setShowWithLoad2IndicatorStyle":
      if let adiscopeSDK = AdiscopeInterface.sharedInstance() {
        if let args = call.arguments as? Dictionary<String, Any>{
          if let isHidden = args["isHidden"] as? Bool, let isMedium = args["isMedium"] as? Bool {
            adiscopeSDK.setShowWithLoad2IndicatorStyleMedium(isMedium, isHidden: isHidden)
            result(true)
            return;
          }
        }
      }
      result(false)
    case "setShowWithLoad2ErrorAlert":
      if let adiscopeSDK = AdiscopeInterface.sharedInstance() {
        if let args = call.arguments as? Dictionary<String, Any>{
          if let isHidden = args["isHidden"] as? Bool, let msg = args["msg"] as? String {
            adiscopeSDK.setShowWithLoad2ErrorAlertMsg(msg, isHidden: isHidden)
            result(true)
            return;
          }
        }
      }
      result(false)
    case "showOfferwall":
      var resultValue = false
      if let adiscopeSDK = AdiscopeInterface.sharedInstance() {
        adiscopeSDK.setMainDelegate(self)
        if let args = call.arguments as? Dictionary<String, Any>{
          if let unitId = args["unitId"] as? String, let offerwallFilterTabs = args["offerwallFilterTabs"] as? Array<String>, offerwallFilterTabs.count > 0 {
            resultValue = adiscopeSDK.showOfferwall(unitId, withFilterTabs: offerwallFilterTabs)
          } else if let unitId = args["unitId"] as? String {
            resultValue = adiscopeSDK.showOfferwall(unitId)
          }
        }
      }
      result(resultValue)
    case "showOfferwallDetail":
      var resultValue = false
      if let adiscopeSDK = AdiscopeInterface.sharedInstance() {
        adiscopeSDK.setMainDelegate(self)
        if let args = call.arguments as? Dictionary<String, Any>{
          if let unitId = args["unitId"] as? String, let itemId = args["itemId"] as? String, let offerwallFilterTabs = args["offerwallFilterTabs"] as? Array<String>, offerwallFilterTabs.count > 0 {
            resultValue = adiscopeSDK.showOfferwallDetail(unitId, offerwallItemId: itemId, withFilterTabs: offerwallFilterTabs)
          } else if let unitId = args["unitId"] as? String, let itemId = args["itemId"] as? String {
            resultValue = adiscopeSDK.showOfferwallDetail(unitId, offerwallItemId: itemId)
          }
        }
      }
      result(resultValue)
    case "showOfferwallDetailFromUrl":
      var resultValue = false
      if let adiscopeSDK = AdiscopeInterface.sharedInstance() {
        adiscopeSDK.setMainDelegate(self)
        if let args = call.arguments as? Dictionary<String, Any>{
          if let url = args["url"] as? String {
            resultValue = adiscopeSDK.showOfferwallDetail(url)
          }
        }
      }
      result(resultValue)
    case "showAdEvent":
      var resultValue = false
      if let adiscopeSDK = AdiscopeInterface.sharedInstance() {
        adiscopeSDK.setMainDelegate(self)
        if let args = call.arguments as? Dictionary<String, Any>{
          if let unitId = args["unitId"] as? String {
            resultValue = adiscopeSDK.showAdEvent(unitId)
          }
        }
      }
      result(resultValue)
    case "rewardedVideoShowWithLoad":
      if let adiscopeSDK = AdiscopeInterface.sharedInstance() {
        if let args = call.arguments as? Dictionary<String, Any>{
          if let unitId = args["unitId"] as? String {
            adiscopeSDK.show(withLoad:unitId, delegate:self)
            result(true)
            return;
          }
        }
      }
      result(false)
    case "rewardedVideoLoad":
      if let adiscopeSDK = AdiscopeInterface.sharedInstance() {
        adiscopeSDK.setMainDelegate(self)
        if let args = call.arguments as? Dictionary<String, Any>{
          if let unitId = args["unitId"] as? String {
            adiscopeSDK.load(unitId)
            result(true)
            return;
          }
        }
      }
      result(false)
    case "rewardedVideoIsLoad":
      var resultValue = false
      if let adiscopeSDK = AdiscopeInterface.sharedInstance() {
        if let args = call.arguments as? Dictionary<String, Any>{
          if let unitId = args["unitId"] as? String {
            resultValue = adiscopeSDK.isLoaded(unitId)
          }
        }
      }
      result(resultValue)
    case "rewardedVideoShow":
      var resultValue = false
      if let adiscopeSDK = AdiscopeInterface.sharedInstance() {
        adiscopeSDK.setMainDelegate(self)
        resultValue = adiscopeSDK.show()
      }
      result(resultValue)
    case "interstitialShowWithLoad":
      if let adiscopeSDK = AdiscopeInterface.sharedInstance() {
        if let args = call.arguments as? Dictionary<String, Any>{
          if let unitId = args["unitId"] as? String {
            adiscopeSDK.show(withLoadInterstitial:unitId, delegate:self)
            result(true)
            return;
          }
        }
      }
      result(false)
    case "interstitialLoad":
      if let adiscopeSDK = AdiscopeInterface.sharedInstance() {
        adiscopeSDK.setMainDelegate(self)
        if let args = call.arguments as? Dictionary<String, Any>{
          if let unitId = args["unitId"] as? String {
            adiscopeSDK.loadInterstitial(unitId)
            result(true)
            return;
          }
        }
      }
      result(false)
    case "interstitialIsLoad":
      var resultValue = false
      if let adiscopeSDK = AdiscopeInterface.sharedInstance() {
        if let args = call.arguments as? Dictionary<String, Any>{
          if let unitId = args["unitId"] as? String {
            resultValue = adiscopeSDK.isLoadedInterstitialUnitID(unitId)
          }
        }
      }
      result(resultValue)
    case "interstitialShow":
      if let adiscopeSDK = AdiscopeInterface.sharedInstance() {
        adiscopeSDK.setMainDelegate(self)
        adiscopeSDK.showInterstitial()
        result(true)
        return;
      }
      result(false)
    case "getUnitStatusRewardedInterstitial":
      if let adiscopeSDK = AdiscopeInterface.sharedInstance() {
        adiscopeSDK.setMainDelegate(self)
        if let args = call.arguments as? Dictionary<String, Any>{
          if let unitId = args["unitId"] as? String {
            adiscopeSDK.getRewardedInterstitialUnitStatus(unitId)
            return;
          }
        }
      }
      result([])
    case "preLoadAllRewardedInterstitial":
      if let adiscopeSDK = AdiscopeInterface.sharedInstance() {
        adiscopeSDK.setMainDelegate(self)
        adiscopeSDK.preLoadAllRewardedInterstitial()
        result(true)
        return;
      }
      result(false)
    case "preLoadRewardedInterstitial":
      if let adiscopeSDK = AdiscopeInterface.sharedInstance() {
        adiscopeSDK.setMainDelegate(self)
        if let args = call.arguments as? Dictionary<String, Any>{
          if let unitIds = args["unitIds"] as? Array<String> {
            adiscopeSDK.preLoadRewardedInterstitial(unitIds)
            result(true)
            return;
          }
        }
      }
      result(false)
    case "showRewardedInterstitial":
      var resultValue = false
      if let adiscopeSDK = AdiscopeInterface.sharedInstance() {
        adiscopeSDK.setMainDelegate(self)
        if let args = call.arguments as? Dictionary<String, Any>{
          if let unitId = args["unitId"] as? String {
            resultValue = adiscopeSDK.showRewardedInterstitial(unitId)
          }
        }
      }
      result(resultValue)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  public func onInitialized(_ isSuccess: Bool) {
    _adiscopeResult?(isSuccess)
  }

  public func onResponsedUnitStatus(_ status: AdiscopeUnitStatus!) {
    let result = ["live": status.live, "active": status.active]
    _adiscopeResult?(result)
  }

  public func onOfferwallAdOpened(_ unitID: String!) {
    let channel = FlutterMethodChannel(name: "adiscopeOfferwallListener", binaryMessenger: _adiscopeRegistrar!.messenger())
    channel.invokeMethod("onOfferwallAdOpened", arguments: unitID)
  }

  public func onOfferwallAdClosed(_ unitID: String!) {
    let channel = FlutterMethodChannel(name: "adiscopeOfferwallListener", binaryMessenger: _adiscopeRegistrar!.messenger())
    channel.invokeMethod("onOfferwallAdClosed", arguments: unitID)
  }

  public func onOfferwallAdFailed(toShow unitID: String!, error: AdiscopeError!) {
    let errorCode = error.code
    let errorDescription = error.description
    let errorXB3TraceID = error.getXB3TraceID() ?? ""
    let channel = FlutterMethodChannel(name: "adiscopeOfferwallListener", binaryMessenger: _adiscopeRegistrar!.messenger())
    channel.invokeMethod("onOfferwallAdFailedToShow", arguments: [unitID!, errorCode, errorDescription, errorXB3TraceID])
  }

  public func onAdEventOpened(_ unitID: String!) {
    let channel = FlutterMethodChannel(name: "adiscopeAdEventListener", binaryMessenger: _adiscopeRegistrar!.messenger())
    channel.invokeMethod("onAdEventOpened", arguments: unitID)
  }

  public func onAdEventClosed(_ unitID: String!) {
    let channel = FlutterMethodChannel(name: "adiscopeAdEventListener", binaryMessenger: _adiscopeRegistrar!.messenger())
    channel.invokeMethod("onAdEventClosed", arguments: unitID)
  }

  public func onAdEventFailed(toShow unitID: String!, error: AdiscopeError!) {
    let errorCode = error.code
    let errorDescription = error.description
    let errorXB3TraceID = error.getXB3TraceID() ?? ""
    let channel = FlutterMethodChannel(name: "adiscopeAdEventListener", binaryMessenger: _adiscopeRegistrar!.messenger())
    channel.invokeMethod("onAdEventFailedToShow", arguments: [unitID!, errorCode, errorDescription, errorXB3TraceID])
  }

  public func onRewardedVideoAdLoaded(_ unitID: String!) {
    let channel = FlutterMethodChannel(name: "adiscopeRewardedVideoListener", binaryMessenger: _adiscopeRegistrar!.messenger())
    channel.invokeMethod("onRewardedVideoAdLoaded", arguments: unitID)
  }

  public func onRewardedVideoAdFailed(toLoad unitID: String!, error: AdiscopeError!) {
    let errorCode = error.code
    let errorDescription = error.description
    let errorXB3TraceID = error.getXB3TraceID() ?? ""
    let channel = FlutterMethodChannel(name: "adiscopeRewardedVideoListener", binaryMessenger: _adiscopeRegistrar!.messenger())
    channel.invokeMethod("onRewardedVideoAdFailedToLoad", arguments: [unitID!, errorCode, errorDescription, errorXB3TraceID])
  }

  public func onRewardedVideoAdOpened(_ unitID: String!) {
    let channel = FlutterMethodChannel(name: "adiscopeRewardedVideoListener", binaryMessenger: _adiscopeRegistrar!.messenger())
    channel.invokeMethod("onRewardedVideoAdOpened", arguments: unitID)
  }

  public func onRewardedVideoAdClosed(_ unitID: String!) {
    let channel = FlutterMethodChannel(name: "adiscopeRewardedVideoListener", binaryMessenger: _adiscopeRegistrar!.messenger())
    channel.invokeMethod("onRewardedVideoAdClosed", arguments: unitID)
  }

  public func onRewarded(_ unitID: String!, item: AdiscopeRewardItem!) {
    let currencyUnit = item.unit ?? ""
    let channel = FlutterMethodChannel(name: "adiscopeRewardedVideoListener", binaryMessenger: _adiscopeRegistrar!.messenger())
    channel.invokeMethod("onRewarded", arguments: [unitID!, currencyUnit, item.amount])
  }

  public func onRewardedVideoAdFailed(toShow unitID: String!, error: AdiscopeError!) {
    let errorCode = error.code
    let errorDescription = error.description
    let errorXB3TraceID = error.getXB3TraceID() ?? ""
    let channel = FlutterMethodChannel(name: "adiscopeRewardedVideoListener", binaryMessenger: _adiscopeRegistrar!.messenger())
    channel.invokeMethod("onRewardedVideoAdFailedToShow", arguments: [unitID!, errorCode, errorDescription, errorXB3TraceID])
  }

  public func onInterstitialAdLoaded(_ unitID: String!) {
    let channel = FlutterMethodChannel(name: "adiscopeInterstitialListener", binaryMessenger: _adiscopeRegistrar!.messenger())
    channel.invokeMethod("onInterstitialAdLoaded", arguments: unitID)
  }

  public func onInterstitialAdFailed(toLoad unitID: String!, error: AdiscopeError!) {
    let errorCode = error.code
    let errorDescription = error.description
    let errorXB3TraceID = error.getXB3TraceID() ?? ""
    let channel = FlutterMethodChannel(name: "adiscopeInterstitialListener", binaryMessenger: _adiscopeRegistrar!.messenger())
    channel.invokeMethod("onInterstitialAdFailedToLoad", arguments: [unitID!, errorCode, errorDescription, errorXB3TraceID])
  }

  public func onInterstitialAdOpened(_ unitID: String!) {
    let channel = FlutterMethodChannel(name: "adiscopeInterstitialListener", binaryMessenger: _adiscopeRegistrar!.messenger())
    channel.invokeMethod("onInterstitialAdOpened", arguments: unitID)
  }

  public func onInterstitialAdClosed(_ unitID: String!) {
    let channel = FlutterMethodChannel(name: "adiscopeInterstitialListener", binaryMessenger: _adiscopeRegistrar!.messenger())
    channel.invokeMethod("onInterstitialAdClosed", arguments: unitID)
  }

  public func onInterstitialAdFailed(toShow unitID: String!, error: AdiscopeError!) {
    let errorCode = error.code
    let errorDescription = error.description
    let errorXB3TraceID = error.getXB3TraceID() ?? ""
    let channel = FlutterMethodChannel(name: "adiscopeInterstitialListener", binaryMessenger: _adiscopeRegistrar!.messenger())
    channel.invokeMethod("onInterstitialAdFailedToShow", arguments: [unitID!, errorCode, errorDescription, errorXB3TraceID])
  }

  public func onRewardedInterstitialResponsedUnitStatus(_ status: AdiscopeUnitStatus!) {
    let result = ["live": status.live, "active": status.active]
    _adiscopeResult?(result)
  }

  public func onRewardedInterstitialAdSkip(_ unitID: String!) {
    let channel = FlutterMethodChannel(name: "adiscopeRewardedInterstitialListener", binaryMessenger: _adiscopeRegistrar!.messenger())
    channel.invokeMethod("onRewardedInterstitialAdSkip", arguments: unitID)
  }

  public func onRewardedInterstitialAdOpened(_ unitID: String!) {
    let channel = FlutterMethodChannel(name: "adiscopeRewardedInterstitialListener", binaryMessenger: _adiscopeRegistrar!.messenger())
    channel.invokeMethod("onRewardedInterstitialAdOpened", arguments: unitID)
  }

  public func onRewardedInterstitialAdClosed(_ unitID: String!) {
    let channel = FlutterMethodChannel(name: "adiscopeRewardedInterstitialListener", binaryMessenger: _adiscopeRegistrar!.messenger())
    channel.invokeMethod("onRewardedInterstitialAdClosed", arguments: unitID)
  }

  public func onRewardedInterstitialRewarded(_ unitID: String!, item: AdiscopeRewardItem!) {
    let currencyUnit = item.unit ?? ""
    let channel = FlutterMethodChannel(name: "adiscopeRewardedInterstitialListener", binaryMessenger: _adiscopeRegistrar!.messenger())
    channel.invokeMethod("onRewardedInterstitialRewarded", arguments: [unitID!, currencyUnit, item.amount])
  }

  public func onRewardedInterstitialAdFailed(toShow unitID: String!, error: AdiscopeError!) {
    let errorCode = error.code
    let errorDescription = error.description
    let errorXB3TraceID = error.getXB3TraceID() ?? ""
    let channel = FlutterMethodChannel(name: "adiscopeRewardedInterstitialListener", binaryMessenger: _adiscopeRegistrar!.messenger())
    channel.invokeMethod("onRewardedInterstitialAdFailedToShow", arguments: [unitID!, errorCode, errorDescription, errorXB3TraceID])
  }
}
