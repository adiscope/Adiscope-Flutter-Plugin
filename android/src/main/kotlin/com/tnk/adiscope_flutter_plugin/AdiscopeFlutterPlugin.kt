package com.tnk.adiscope_flutter_plugin

import android.app.Activity
import com.nps.adiscope.AdiscopeError
import com.nps.adiscope.AdiscopeSdk
import com.nps.adiscope.core.Adiscope
import com.nps.adiscope.interstitial.InterstitialAd
import com.nps.adiscope.interstitial.InterstitialAdListener
import com.nps.adiscope.listener.AdiscopeInitializeListener
import com.nps.adiscope.model.UnitStatus
import com.nps.adiscope.offerwall.OfferwallAd
import com.nps.adiscope.offerwall.OfferwallAdListener
import com.nps.adiscope.reward.RewardItem
import com.nps.adiscope.reward.RewardedVideoAd
import com.nps.adiscope.reward.RewardedVideoAdListener
import com.nps.adiscope.rewardedinterstitial.RewardedInterstitialAd
import com.nps.adiscope.rewardedinterstitial.RewardedInterstitialAdShowListener
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** AdiscopeFlutterPlugin */
class AdiscopeFlutterPlugin: FlutterPlugin, MethodCallHandler, ActivityAware, AdiscopeInitializeListener, OfferwallAdListener,
  RewardedVideoAdListener, InterstitialAdListener, RewardedInterstitialAdShowListener {

  private lateinit var channel : MethodChannel
  private lateinit var flutterPlugin: FlutterPlugin.FlutterPluginBinding
  private lateinit var mActivity: Activity
  private lateinit var callResult : Result
  private lateinit var mOfferwallAd: OfferwallAd
  private lateinit var mRewardedVideoAd: RewardedVideoAd
  private lateinit var mInterstitialAd: InterstitialAd
  private lateinit var mRewardedInterstitialAd: RewardedInterstitialAd

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "adiscope_flutter_plugin")
    channel.setMethodCallHandler(this)
    flutterPlugin = flutterPluginBinding
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    callResult = result;
    if (call.method == "initialize") {
      var mediaId = call.argument("mediaId") as? String ?: ""
      var mediaSecret = call.argument("mediaSecret") as? String ?: ""
      var callbackTag = call.argument("callbackTag") as? String ?: ""
      var childYN = call.argument("childYN") as? String ?: ""
      if (mediaId.length > 0 && mediaSecret.length > 0 && callbackTag.length > 0 && childYN.length > 0) {
        AdiscopeSdk.initialize(mActivity, mediaId, mediaSecret, callbackTag, childYN, this)
      } else if (mediaId.length > 0 && mediaSecret.length > 0 && callbackTag.length > 0) {
        AdiscopeSdk.initialize(mActivity, mediaId, mediaSecret, callbackTag, this)
      } else if (mediaId.length > 0 && mediaSecret.length > 0) {
        AdiscopeSdk.initialize(mActivity, mediaId, mediaSecret, this)
      } else if (callbackTag.length > 0 && childYN.length > 0) {
        AdiscopeSdk.initialize(mActivity, this, callbackTag, childYN)
      } else if (callbackTag.length > 0) {
        AdiscopeSdk.initialize(mActivity, this, callbackTag)
      } else {
        AdiscopeSdk.initialize(mActivity, this)
      }
    } else if (call.method == "setUserId") {
      var mediaId = call.argument("userId") as? String ?: ""
      AdiscopeSdk.setUserId(mediaId);
      result.success(true)
    } else if (call.method == "isInitialized") {
      var returnResult = AdiscopeSdk.isInitialize()
      result.success(returnResult)
    } else if (call.method == "getSDKVersion") {
      var returnResult = AdiscopeSdk.getSDKVersion()
      result.success(returnResult)
    } else if (call.method == "getNetworkVersions") {
      var returnResult = AdiscopeSdk.getNetworksVersions()
      result.success(returnResult)
    } else if (call.method == "getUnitStatus") {
      var unitId = call.argument("unitId") as? String ?: ""
      AdiscopeSdk.getUnitStatus(unitId) { adiscopeError: AdiscopeError?, unitStatus: UnitStatus? ->
        var result = mapOf("live" to unitStatus?.isLive, "active" to unitStatus?.isActive)
        callResult.success(result)
      }
    } else if (call.method == "showMaxMediationDebugger") {
      var resultValue = false
      try {
        val clazz = Class.forName("com.nps.adiscope.adapter.max.MaxAdapter")
        val instanceMethod = clazz.getDeclaredMethod("showDebug", Activity::class.java)
        instanceMethod.invoke(null, mActivity)
        resultValue = true
      } catch (e: Exception) {
        resultValue = false
      }
      result.success(resultValue)
    } else if (call.method == "showAdmobMediationDebugger") {
      var resultValue = false
      try {
        val clazz = Class.forName("com.nps.adiscope.adapter.admob.AdMobAdapter")
        val instanceMethod = clazz.getDeclaredMethod("showDebug", Activity::class.java)
        instanceMethod.invoke(null, mActivity)
        resultValue = true
      } catch (e: Exception) {
        resultValue = false
      }
      result.success(resultValue)
    } else if (call.method == "setVolumeOff") {
      var isOn = call.argument("isOn") as? Boolean
      AdiscopeSdk.getOptionSetterInstance(mActivity).setVolumeOff(isOn!!)
      result.success(true)
    } else if (call.method == "showOfferwall") {
      if (mOfferwallAd != null) {
        var unitId = call.argument("unitId") as? String ?: ""
        var offerwallFilterTabs = call.argument<List<String>>("offerwallFilterTabs")
        var resultValue = false;
        if (offerwallFilterTabs != null) {
          resultValue = mOfferwallAd?.show(mActivity, unitId, offerwallFilterTabs.toTypedArray()) ?: false
        } else {
          resultValue = mOfferwallAd?.show(mActivity, unitId, arrayOf()) ?: false
        }
        result.success(resultValue)
      } else {
        result.success(false)
      }
    } else if (call.method == "showOfferwallDetail") {
      if (mOfferwallAd != null) {
        var unitId = call.argument("unitId") as? String ?: ""
        var itemId = call.argument("itemId") as? String ?: "0"
        var offerwallFilterTabs = call.argument<List<String>>("offerwallFilterTabs")
        var resultValue = false;
        if (offerwallFilterTabs != null) {
          resultValue = mOfferwallAd?.showDetail( mActivity, unitId, offerwallFilterTabs.toTypedArray(), itemId.toInt()) ?: false
        } else {
          resultValue = mOfferwallAd?.showDetail( mActivity, unitId, arrayOf(), itemId.toInt()) ?: false
        }
        result.success(resultValue)
      } else {
        result.success(false)
      }
    } else if (call.method == "showOfferwallDetailFromUrl") {
      if (mOfferwallAd != null) {
        var url = call.argument("url") as? String ?: ""
        var resultValue = mOfferwallAd?.showDetail(mActivity, url)
        result.success(resultValue)
      } else {
        result.success(false)
      }
    } else if (call.method == "rewardedVideoLoad") {
      if (mRewardedVideoAd != null) {
        var unitId = call.argument("unitId") as? String ?: ""
        mRewardedVideoAd.load(unitId)
        result.success(true)
      } else {
        result.success(false)
      }
    } else if (call.method == "rewardedVideoIsLoad") {
      if (mRewardedVideoAd != null) {
        var unitId = call.argument("unitId") as? String ?: ""
        var resultValue = mRewardedVideoAd.isLoaded(unitId)
        result.success(resultValue)
      } else {
        result.success(false)
      }
    } else if (call.method == "rewardedVideoShow") {
      if (mRewardedVideoAd != null) {
        var resultValue = mRewardedVideoAd.show()
        result.success(resultValue)
      } else {
        result.success(false)
      }
    } else if (call.method == "interstitialLoad") {
      if (mInterstitialAd != null) {
        var unitId = call.argument("unitId") as? String ?: ""
        mInterstitialAd.load(unitId)
        result.success(true)
      } else {
        result.success(false)
      }
    } else if (call.method == "interstitialIsLoad") {
      if (mInterstitialAd != null) {
        var unitId = call.argument("unitId") as? String ?: ""
        var resultValue = mInterstitialAd.isLoaded(unitId)
        result.success(resultValue)
      } else {
        result.success(false)
      }
    } else if (call.method == "interstitialShow") {
      if (mInterstitialAd != null) {
        var resultValue = mInterstitialAd.show()
        result.success(resultValue)
      } else {
        result.success(false)
      }
    } else if (call.method == "getUnitStatusRewardedInterstitial") {
      if (mRewardedInterstitialAd != null) {
        var unitId = call.argument("unitId") as? String ?: ""
        mRewardedInterstitialAd.getUnitStatus(unitId) { error, unitStatus ->
          var result = mapOf("live" to unitStatus?.isLive, "active" to unitStatus?.isActive)
          callResult.success(result)
        }
      } else {
        result.success(false)
      }
    } else if (call.method == "preLoadAllRewardedInterstitial") {
      if (mRewardedInterstitialAd != null) {
        mRewardedInterstitialAd.preloadAll()
        result.success(true)
      } else {
        result.success(false)
      }
    } else if (call.method == "preLoadRewardedInterstitial") {
      if (mRewardedInterstitialAd != null) {
        val unitIds = call.argument<List<String>>("unitIds")
        if (unitIds != null) {
          mRewardedInterstitialAd?.preloadUnit(unitIds.toTypedArray())
          result.success(true)
        } else {
          result.success(false)
        }
      } else {
        result.success(false)
      }
    } else if (call.method == "showRewardedInterstitial") {
      if (mRewardedInterstitialAd != null) {
        var unitId = call.argument("unitId") as? String ?: ""
        mRewardedInterstitialAd?.show(unitId)
        result.success(true)
      } else {
        result.success(false)
      }
    } else {
      result.notImplemented()
    }
  }

  override fun onInitialized(isSuccess: Boolean) {
    callResult.success(isSuccess)
    if (isSuccess) {
      mOfferwallAd = Adiscope.getOfferwallAdInstance(mActivity).apply {
        this.setOfferwallAdListener(this@AdiscopeFlutterPlugin)
      }
      mRewardedVideoAd = Adiscope.getRewardedVideoAdInstance(mActivity).apply {
        this.setRewardedVideoAdListener(this@AdiscopeFlutterPlugin)
      }
      mInterstitialAd = Adiscope.getInterstitialAdInstance(mActivity).apply {
        this.setInterstitialAdListener(this@AdiscopeFlutterPlugin)
      }
      mRewardedInterstitialAd = Adiscope.getRewardedInterstitialAdInstance(mActivity).apply {
        this.setRewardedInterstitialAdListener(this@AdiscopeFlutterPlugin)
      }
    }
  }

  override fun onOfferwallAdOpened(unitId: String?) {
    MethodChannel(flutterPlugin.binaryMessenger, "adiscopeOfferwallListener").invokeMethod("onOfferwallAdOpened", unitId)
  }

  override fun onOfferwallAdFailedToShow(unitId: String?, error: AdiscopeError?) {
    val args: MutableList<Any> = ArrayList()
    unitId?.let { args.add(it) } ?: run { args.add("") }
    error?.let { it.description?.let { args.add(it) } } ?: run { args.add("")}
    error?.let { it.xb3TraceId?.let { args.add(it) } } ?: run { args.add("")}
    MethodChannel(flutterPlugin.binaryMessenger, "adiscopeOfferwallListener").invokeMethod("onOfferwallAdFailedToShow", args)
  }

  override fun onOfferwallAdClosed(unitId: String?) {
    MethodChannel(flutterPlugin.binaryMessenger, "adiscopeOfferwallListener").invokeMethod("onOfferwallAdClosed", unitId)
  }

  override fun onRewardedVideoAdLoaded(unitId: String?) {
    MethodChannel(flutterPlugin.binaryMessenger, "adiscopeRewardedVideoListener").invokeMethod("onRewardedVideoAdLoaded", unitId)
  }

  override fun onRewardedVideoAdFailedToLoad(unitId: String?, error: AdiscopeError?) {
    val args: MutableList<Any> = ArrayList()
    unitId?.let { args.add(it) } ?: run { args.add("") }
    error?.let { it.description?.let { args.add(it) } } ?: run { args.add("")}
    error?.let { it.xb3TraceId?.let { args.add(it) } } ?: run { args.add("")}
    MethodChannel(flutterPlugin.binaryMessenger, "adiscopeRewardedVideoListener").invokeMethod("onRewardedVideoAdFailedToLoad", args)
  }

  override fun onRewardedVideoAdOpened(unitId: String?) {
    MethodChannel(flutterPlugin.binaryMessenger, "adiscopeRewardedVideoListener").invokeMethod("onRewardedVideoAdOpened", unitId)
  }

  override fun onRewardedVideoAdClosed(unitId: String?) {
    MethodChannel(flutterPlugin.binaryMessenger, "adiscopeRewardedVideoListener").invokeMethod("onRewardedVideoAdClosed", unitId)
  }

  override fun onRewarded(unitId: String?, item: RewardItem?) {
    val args: MutableList<Any> = ArrayList()
    unitId?.let { args.add(it) } ?: run { args.add("") }
    item?.let { it.getType()?.let { args.add(it) } } ?: run { args.add("")}
    item?.let { it.getAmount()?.let { args.add(it) } } ?: run { args.add("")}
    MethodChannel(flutterPlugin.binaryMessenger, "adiscopeRewardedVideoListener").invokeMethod("onRewarded", args)
  }

  override fun onRewardedVideoAdFailedToShow(unitId: String?, error: AdiscopeError?) {
    val args: MutableList<Any> = ArrayList()
    unitId?.let { args.add(it) } ?: run { args.add("") }
    error?.let { it.description?.let { args.add(it) } } ?: run { args.add("")}
    error?.let { it.xb3TraceId?.let { args.add(it) } } ?: run { args.add("")}
    MethodChannel(flutterPlugin.binaryMessenger, "adiscopeRewardedVideoListener").invokeMethod("onRewardedVideoAdFailedToShow", args)
  }

  override fun onInterstitialAdLoaded() {
    MethodChannel(flutterPlugin.binaryMessenger, "adiscopeInterstitialListener").invokeMethod("onInterstitialAdLoaded", "")
  }

  override fun onInterstitialAdFailedToLoad(error: AdiscopeError?) {
    val args: MutableList<Any> = ArrayList()
    args.add("")
    error?.let { it.description?.let { args.add(it) } } ?: run { args.add("")}
    error?.let { it.xb3TraceId?.let { args.add(it) } } ?: run { args.add("")}
    MethodChannel(flutterPlugin.binaryMessenger, "adiscopeInterstitialListener").invokeMethod("onInterstitialAdFailedToLoad", args)
  }

  override fun onInterstitialAdOpened(unitId: String?) {
    MethodChannel(flutterPlugin.binaryMessenger, "adiscopeInterstitialListener").invokeMethod("onInterstitialAdOpened", unitId)
  }

  override fun onInterstitialAdClosed(unitId: String?) {
    MethodChannel(flutterPlugin.binaryMessenger, "adiscopeInterstitialListener").invokeMethod("onInterstitialAdClosed", unitId)
  }

  override fun onInterstitialAdFailedToShow(unitId: String?, error: AdiscopeError?) {
    val args: MutableList<Any> = ArrayList()
    unitId?.let { args.add(it) } ?: run { args.add("") }
    error?.let { it.description?.let { args.add(it) } } ?: run { args.add("")}
    error?.let { it.xb3TraceId?.let { args.add(it) } } ?: run { args.add("")}
    MethodChannel(flutterPlugin.binaryMessenger, "adiscopeInterstitialListener").invokeMethod("onInterstitialAdFailedToShow", args)
  }

  override fun onRewardedInterstitialAdSkipped(unitId: String?) {
    MethodChannel(flutterPlugin.binaryMessenger, "adiscopeRewardedInterstitialListener").invokeMethod("onRewardedInterstitialAdSkip", unitId)
  }

  override fun onRewardedInterstitialAdOpened(unitId: String?) {
    MethodChannel(flutterPlugin.binaryMessenger, "adiscopeRewardedInterstitialListener").invokeMethod("onRewardedInterstitialAdOpened", unitId)
  }

  override fun onRewardedInterstitialAdClosed(unitId: String?) {
    MethodChannel(flutterPlugin.binaryMessenger, "adiscopeRewardedInterstitialListener").invokeMethod("onRewardedInterstitialAdClosed", unitId)
  }

  override fun onRewardedInterstitialAdRewarded(unitId: String?, item: RewardItem?) {
    val args: MutableList<Any> = ArrayList()
    unitId?.let { args.add(it) } ?: run { args.add("") }
    item?.let { it.getType()?.let { args.add(it) } } ?: run { args.add("")}
    item?.let { it.getAmount()?.let { args.add(it) } } ?: run { args.add("")}
    MethodChannel(flutterPlugin.binaryMessenger, "adiscopeRewardedInterstitialListener").invokeMethod("onRewardedInterstitialRewarded", args)
  }

  override fun onRewardedInterstitialAdFailedToShow(unitId: String?, error: AdiscopeError?) {
    val args: MutableList<Any> = ArrayList()
    unitId?.let { args.add(it) } ?: run { args.add("") }
    error?.let { it.description?.let { args.add(it) } } ?: run { args.add("")}
    error?.let { it.xb3TraceId?.let { args.add(it) } } ?: run { args.add("")}
    MethodChannel(flutterPlugin.binaryMessenger, "adiscopeRewardedInterstitialListener").invokeMethod("onRewardedInterstitialAdFailedToShow", args)
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    mActivity = binding.activity
  }

  override fun onDetachedFromActivityForConfigChanges() {}

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {}

  override fun onDetachedFromActivity() {}
}
