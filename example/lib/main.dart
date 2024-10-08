import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:adiscope_flutter_plugin/adiscope_flutter_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var logCount = 0;
  var mediaId;
  var mediaSecret;
  var userId;
  var customdata;
  var subDomain;
  var offerwallId;
  var offerwallDetailUrl;
  var adEventUnitId;
  var rvUnitId;
  var itUnitId;
  var riUnitId1;
  var riUnitId2;
  var riUnitId3;
  var riUnitId4;
  var riUnitId5;

  final _adiscopeFlutterPlugin = AdiscopeFlutterPlugin();
  final _mediaIdController = new TextEditingController();
  final _userIdController = new TextEditingController();
  final _customdataController = new TextEditingController();
  final _callbackTagController = new TextEditingController();
  final _childYNController = new TextEditingController();
  final _unitIdController = new TextEditingController();
  final _offerwallUnitIdController = new TextEditingController();
  final _offerwallItemIdController = new TextEditingController();
  final _adEventUnitIdController = new TextEditingController();
  final _rvUnitIdController = new TextEditingController();
  final _itUnitIdController = new TextEditingController();
  final _riUnitIdController = new TextEditingController();
  final _riUnitId1Controller = new TextEditingController();
  final _riUnitId2Controller = new TextEditingController();
  final _riUnitId3Controller = new TextEditingController();
  final _riUnitId4Controller = new TextEditingController();
  final _riUnitId5Controller = new TextEditingController();
  String _logResult = "";

  @override
  void initState() {
    super.initState();

    userId = "Flutter_Tester_User";
    subDomain = "link";
    if (Platform.isAndroid) {
      mediaId = "";
      mediaSecret = "";
      offerwallId = "";
      adEventUnitId = "";
      rvUnitId = "";
      itUnitId = "";
      riUnitId1 = "";
      riUnitId2 = "";
      riUnitId3 = "";
      riUnitId4 = "";
      riUnitId5 = "";
    } else if (Platform.isIOS) {
      mediaId = "";
      mediaSecret = "";
      offerwallId = "";
      adEventUnitId = "";
      rvUnitId = "";
      itUnitId = "";
      riUnitId1 = "";
      riUnitId2 = "";
      riUnitId3 = "";
      riUnitId4 = "";
      riUnitId5 = "";
    }

    _userIdController.text = userId;
    _offerwallUnitIdController.text = offerwallId;
    _adEventUnitIdController.text = adEventUnitId;
    _rvUnitIdController.text = rvUnitId;
    _itUnitIdController.text = itUnitId;
    _riUnitIdController.text = riUnitId1;
    _riUnitId1Controller.text = riUnitId1;
    _riUnitId2Controller.text = riUnitId2;
    _riUnitId3Controller.text = riUnitId3;
    _riUnitId4Controller.text = riUnitId4;
    _riUnitId5Controller.text = riUnitId5;

    AdiscopeListener.setupOfferwallListener(
    onOfferwallAdOpened: (unitId) {
      pushLog("onOfferwallAdOpened => $unitId");
    }, onOfferwallAdClosed: (unitId) {
      pushLog("onOfferwallAdClosed => $unitId");
    }, onOfferwallAdFailedToShow: (unitId, errorDescription, errorXB3TraceID) {
      pushLog("onOfferwallAdFailedToShow => $unitId, $errorDescription, $errorXB3TraceID");
    });

    AdiscopeListener.setupAdEventListener(
    onAdEventOpened: (unitId) {
      pushLog("onAdEventOpened => $unitId");
    }, onAdEventClosed: (unitId) {
      pushLog("onAdEventClosed => $unitId");
    }, onAdEventFailedToShow: (unitId, errorDescription) {
      pushLog("onAdEventFailedToShow => $unitId, $errorDescription");
    });

    AdiscopeListener.setupRewardedVideoListener(
    onRewardedVideoAdLoaded: (unitId) {
      pushLog("onRewardedVideoAdLoaded => $unitId");
    }, onRewardedVideoAdFailedToLoad: (unitId, errorDescription, errorXB3TraceID) {
      pushLog("onRewardedVideoAdFailedToLoad => $unitId, $errorDescription, $errorXB3TraceID");
    }, onRewardedVideoAdOpened: (unitId) {
      pushLog("onRewardedVideoAdOpened => $unitId");
    }, onRewardedVideoAdClosed: (unitId) {
      pushLog("onRewardedVideoAdClosed => $unitId");
    }, onRewarded: (unitId, currencyUnit, amount) {
      pushLog("onRewarded => $unitId, $currencyUnit, $amount");
    }, onRewardedVideoAdFailedToShow: (unitId, errorDescription, errorXB3TraceID) {
      pushLog("onRewardedVideoAdFailedToShow => $unitId, $errorDescription, $errorXB3TraceID");
    });

    AdiscopeListener.setupInterstitialListener(
    onInterstitialAdLoaded: (unitId) {
      pushLog("onInterstitialAdLoaded => $unitId");
    }, onInterstitialAdFailedToLoad: (unitId, errorDescription, errorXB3TraceID) {
      pushLog("onInterstitialAdFailedToLoad => $unitId, $errorDescription, $errorXB3TraceID");
    }, onInterstitialAdOpened: (unitId) {
      pushLog("onInterstitialAdOpened => $unitId");
    }, onInterstitialAdClosed: (unitId) {
      pushLog("onInterstitialAdClosed => $unitId");
    }, onInterstitialAdFailedToShow: (unitId, errorDescription, errorXB3TraceID) {
      pushLog("onInterstitialAdFailedToShow => $unitId, $errorDescription, $errorXB3TraceID");
    });

    AdiscopeListener.setupRewardedInterstitialListener(
    onRewardedInterstitialAdSkip: (unitId) {
      pushLog("onRewardedInterstitialAdSkip => $unitId");
    }, onRewardedInterstitialAdOpened: (unitId) {
      pushLog("onRewardedInterstitialAdOpened => $unitId");
    }, onRewardedInterstitialAdClosed: (unitId) {
      pushLog("onRewardedInterstitialAdClosed => $unitId");
    }, onRewardedInterstitialRewarded: (unitId, currencyUnit, amount) {
      pushLog("onRewardedInterstitialRewarded => $unitId, $currencyUnit, $amount");
    }, onRewardedInterstitialAdFailedToShow: (unitId, errorDescription, errorXB3TraceID) {
      pushLog("onRewardedInterstitialAdFailedToShow => $unitId, $errorDescription, $errorXB3TraceID");
    });
  }

  Future<void> pushLog(String log) async {
    setState(() {
      if (_logResult.isEmpty) {
        _logResult = "$logCount " + log;
      } else {
        _logResult = "$logCount " + log + "\n" + _logResult;
      }
      logCount++;
    });
  }

  Future<void> initialize() async {
    bool result = false;
    try {
      result = await _adiscopeFlutterPlugin.initialize() ?? false;
    } on PlatformException {
      result = false;
    }
    if (!mounted) return;
    pushLog("Initialize => $result");

    if (result && !_userIdController.text.isEmpty) {
      setUserId(_userIdController.text);
    }
  }

  Future<void> initialize1(String callbackTag) async {
    bool result = false;
    try {
      result = await _adiscopeFlutterPlugin.initialize("", "", callbackTag, "") ?? false;
    } on PlatformException {
      result = false;
    }
    if (!mounted) return;
    pushLog("Initialize => $result");

    if (result && !_userIdController.text.isEmpty) {
      setUserId(_userIdController.text);
    }
  }

  Future<void> initialize2(String callbackTag, String childYN) async {
    bool result = false;
    try {
      result = await _adiscopeFlutterPlugin.initialize("", "", callbackTag, childYN) ?? false;
    } on PlatformException {
      result = false;
    }
    if (!mounted) return;
    pushLog("Initialize => $result");

    if (result && !_userIdController.text.isEmpty) {
      setUserId(_userIdController.text);
    }
  }

  Future<void> initialize3(String mediaId, String mediaSecret) async {
    bool result = false;
    try {
      result = await _adiscopeFlutterPlugin.initialize(mediaId, mediaSecret, "", "") ?? false;
    } on PlatformException {
      result = false;
    }
    if (!mounted) return;
    pushLog("Initialize => $result");

    if (result && !_userIdController.text.isEmpty) {
      setUserId(_userIdController.text);
    }
  }

  Future<void> initialize4(String mediaId, String mediaSecret, String callbackTag) async {
    bool result = false;
    try {
      result = await _adiscopeFlutterPlugin.initialize(mediaId, mediaSecret, callbackTag, "") ?? false;
    } on PlatformException {
      result = false;
    }
    if (!mounted) return;
    pushLog("Initialize => $result");

    if (result && !_userIdController.text.isEmpty) {
      setUserId(_userIdController.text);
    }
  }

  Future<void> initialize5(String mediaId, String mediaSecret, String callbackTag, String childYN) async {
    bool result = false;
    try {
      result = await _adiscopeFlutterPlugin.initialize(mediaId, mediaSecret, callbackTag, childYN) ?? false;
    } on PlatformException {
      result = false;
    }
    if (!mounted) return;
    pushLog("Initialize => $result");

    if (result && !_userIdController.text.isEmpty) {
      setUserId(_userIdController.text);
    }
  }

  Future<void> setUserId(String userId) async {
    bool result = false;
    try {
      result = await _adiscopeFlutterPlugin.setUserId(userId) ?? false;
    } on PlatformException {
      result = false;
    }
    if (!mounted) return;
    pushLog("Set User ID => $result / $userId");
  }

  Future<void> setRewardedCheckParam(String param) async {
    try {
      await _adiscopeFlutterPlugin.setRewardedCheckParam(param);
    } on PlatformException {
    }
    if (!mounted) return;
    pushLog("CustomData => $param");
  }

  Future<void> isInitialized() async {
    bool result = false;
    try {
      result = await _adiscopeFlutterPlugin.isInitialized() ?? false;
    } on PlatformException {
      result = false;
    }
    if (!mounted) return;
    pushLog("Initialized Flag => $result");
  }

  Future<void> getSDKVersion() async {
    String result = "";
    try {
      result = await _adiscopeFlutterPlugin.getSDKVersion() ?? "";
    } on PlatformException {
      result = "";
    }
    if (!mounted) return;
    pushLog("SDK Version => $result");
  }

  Future<void> getNetworkVersions() async {
    String result = "";
    try {
      result = await _adiscopeFlutterPlugin.getNetworkVersions() ?? "";
    } on PlatformException {
      result = "";
    }
    if (!mounted) return;
    pushLog("Network Versions => $result");
  }

  Future<void> getUnitStatus(String unitId) async {
    if (unitId.isEmpty) {
      pushLog("Not Found UnitID => $unitId");
      return;
    }

    Map result = {};
    try {
      result = await _adiscopeFlutterPlugin.getUnitStatus(unitId) ?? {};
    } on PlatformException {
      result = {};
    }
    if (!mounted) return;
    pushLog("$unitId UnitID Status => $result");
  }

  Future<void> showMaxMediationDebugger() async {
    try {
      await _adiscopeFlutterPlugin.showMaxMediationDebugger();
    } on PlatformException {
    }
    if (!mounted) return;
    pushLog("Show Max Mediation Debugger");
  }

  Future<void> showAdmobMediationDebugger() async {
    try {
      await _adiscopeFlutterPlugin.showAdmobMediationDebugger();
    } on PlatformException {
    }
    if (!mounted) return;
    pushLog("Show Admob Mediation Debugger");
  }

  Future<void> setVolumeOff(isOn) async {
    try {
      await _adiscopeFlutterPlugin.setVolumeOff(isOn);
    } on PlatformException {
    }
    if (!mounted) return;
    if (isOn) {
      pushLog("Ad Sound Off");
    } else {
      pushLog("Ad Sound On");
    }
  }

  Future<void> showOfferwall(String unitId) async {
    if (unitId.isEmpty) {
      pushLog("Not Found UnitID => $unitId");
      return;
    }

    bool result = false;
    try {
      result = await _adiscopeFlutterPlugin.showOfferwall(unitId.toUpperCase()) ?? false;
    } on PlatformException {
      result = false;
    }
    if (!mounted) return;
    pushLog("Show Offerwall => $result");
  }

  Future<void> showOfferwallDetail(String unitId, String itemId) async {
    if (unitId.isEmpty || itemId.isEmpty) {
      pushLog("Not Found UnitID => $unitId, itemID => $itemId");
      return;
    }

    bool result = false;
    try {
      result = await _adiscopeFlutterPlugin.showOfferwallDetail(unitId, itemId) ?? false;
    } on PlatformException {
      result = false;
    }
    if (!mounted) return;
    pushLog("Show Offerwall Detail => $result");
  }

  Future<void> showOfferwallDetailFromUrl(String unitId, String itemId) async {
    if (unitId.isEmpty || itemId.isEmpty) {
      pushLog("Not Found UnitID => $unitId, itemID => $itemId");
      return;
    }

    bool result = false;
    try {
      String url = "https://$subDomain.adiscope.com/$mediaId/$unitId/0/$itemId";
      result = await _adiscopeFlutterPlugin.showOfferwallDetailFromUrl(url) ?? false;
    } on PlatformException {
      result = false;
    }
    if (!mounted) return;
    pushLog("Show Offerwall Detail From Url => $result");
  }

  Future<void> showAdEvent(String unitId) async {
    if (unitId.isEmpty) {
      pushLog("Not Found UnitID => $unitId");
      return;
    }

    bool result = false;
    try {
      result = await _adiscopeFlutterPlugin.showAdEvent(unitId.toUpperCase()) ?? false;
    } on PlatformException {
      result = false;
    }
    if (!mounted) return;
    pushLog("Show AdEvent => $result");
  }

  Future<void> rewardedVideoLoad(String unitId) async {
    if (unitId.isEmpty) {
      pushLog("Not Found UnitID => $unitId");
      return;
    }

    bool result = false;
    try {
      result = await _adiscopeFlutterPlugin.rewardedVideoLoad(unitId) ?? false;
    } on PlatformException {
      result = false;
    }
    if (!mounted) return;
    pushLog("Click RewardedVideo Load => $result");
  }

  Future<void> rewardedVideoIsLoad(String unitId) async {
    if (unitId.isEmpty) {
      pushLog("Not Found UnitID => $unitId");
      return;
    }

    bool result = false;
    try {
      result = await _adiscopeFlutterPlugin.rewardedVideoIsLoad(unitId) ?? false;
    } on PlatformException {
      result = false;
    }
    if (!mounted) return;
    pushLog("RewardedVideo IsLoad => $result");
  }

  Future<void> rewardedVideoShow() async {
    bool result = false;
    try {
      result = await _adiscopeFlutterPlugin.rewardedVideoShow() ?? false;
    } on PlatformException {
      result = false;
    }
    if (!mounted) return;
    pushLog("RewardedVideo Show => $result");
  }

  Future<void> interstitialLoad(String unitId) async {
    if (unitId.isEmpty) {
      pushLog("Not Found UnitID => $unitId");
      return;
    }

    bool result = false;
    try {
      result = await _adiscopeFlutterPlugin.interstitialLoad(unitId) ?? false;
    } on PlatformException {
      result = false;
    }
    if (!mounted) return;
    pushLog("Click Interstitial Load => $result");
  }

  Future<void> interstitialIsLoad(String unitId) async {
    if (unitId.isEmpty) {
      pushLog("Not Found UnitID => $unitId");
      return;
    }

    bool result = false;
    try {
      result = await _adiscopeFlutterPlugin.interstitialIsLoad(unitId) ?? false;
    } on PlatformException {
      result = false;
    }
    if (!mounted) return;
    pushLog("Interstitial IsLoad => $result");
  }

  Future<void> interstitialShow() async {
    bool result = false;
    try {
      result = await _adiscopeFlutterPlugin.interstitialShow() ?? false;
    } on PlatformException {
      result = false;
    }
    if (!mounted) return;
    pushLog("Interstitial Show => $result");
  }

  Future<void> getUnitStatusRewardedInterstitial(String unitId) async {
    if (unitId.isEmpty) {
      pushLog("Not Found UnitID => $unitId");
      return;
    }

    Map result = {};
    try {
      result = await _adiscopeFlutterPlugin.getUnitStatusRewardedInterstitial(unitId) ?? {};
    } on PlatformException {
      result = {};
    }
    if (!mounted) return;
    pushLog("RewardedInterstitial Unit Status => $result");
  }

  Future<void> preLoadAllRewardedInterstitial() async {
    bool result = false;
    try {
      result = await _adiscopeFlutterPlugin.preLoadAllRewardedInterstitial() ?? false;
    } on PlatformException {
      result = false;
    }
    if (!mounted) return;
    pushLog("Click PreLoad All RewardedInterstitial => $result");
  }

  Future<void> preLoadRewardedInterstitial(List<String>? unitIds) async {
    bool result = false;
    try {
      result = await _adiscopeFlutterPlugin.preLoadRewardedInterstitial(unitIds) ?? false;
    } on PlatformException {
      result = false;
    }
    if (!mounted) return;
    pushLog("Click PreLoad UnitIDs RewardedInterstitial => $result");
  }

  Future<void> showRewardedInterstitial(String unitId) async {
    bool result = false;
    try {
      result = await _adiscopeFlutterPlugin.showRewardedInterstitial(unitId) ?? false;
    } on PlatformException {
      result = false;
    }
    if (!mounted) return;
    pushLog("RewardedInterstitial Show => $result");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Adiscope Example App'),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                height: 1.0,
                width: double.infinity,
                color:Colors.black,
              ),
              Container(
                color: Colors.white,
                child: SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Scrollbar(
                    thumbVisibility: true,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text('$_logResult'),
                    ),
                  ),
                ),
              ),
              Container(
                height: 1.0,
                width: double.infinity,
                color:Colors.black,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(5),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox( height: 10,),
                      Row(
                        children: [
                          Text("Media ID"),
                          SizedBox( width: 10,),
                          Flexible(
                            child: SizedBox(
                              height: 30,
                              child: TextField(
                                controller: _mediaIdController,
                                textAlignVertical: TextAlignVertical.center,
                                enabled: false,
                                decoration: InputDecoration(
                                  labelText: mediaId,
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox( height: 5,),
                      SizedBox(
                        height: 38,
                        child: TextField(
                          controller: _userIdController,
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                            border: InputBorder.none,
                            labelText: 'User ID',
                          ),
                        ),
                      ),
                      SizedBox( height: 5,),
                      Container(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () { setUserId(_userIdController.text); },
                          child: Text("Set User ID")
                        ),
                      ),
                      SizedBox( height: 10,),
                      SizedBox(
                        height: 38,
                        child: TextField(
                          controller: _callbackTagController,
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                            border: InputBorder.none,
                            labelText: 'Callback Tag',
                          ),
                        ),
                      ),
                      SizedBox( height: 5,),
                      SizedBox(
                        height: 38,
                        child: TextField(
                          controller: _childYNController,
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                            border: InputBorder.none,
                            labelText: 'Child YN',
                          ),
                        ),
                      ),
                      SizedBox( height: 10,),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () { initialize(); },
                                child: Text("Initializ()")
                              ),
                            ),
                          ),
                          SizedBox( width: 5,),
                          Flexible(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () { initialize1(_callbackTagController.text); },
                                child: Text("Initializ(callbackTag)")
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox( height: 5,),
                      Container(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () { initialize2(_callbackTagController.text, _childYNController.text); },
                          child: Text("Initializ(callbackTag, childYN)")
                        ),
                      ),
                      SizedBox( height: 5,),
                      Container(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
                            initialize3(mediaId, mediaSecret);
                          },
                          child: Text("Initializ(mediaId, mediaSecret)")
                        ),
                      ),
                      SizedBox( height: 5,),
                      Container(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
                            initialize4(mediaId, mediaSecret, _callbackTagController.text);
                          },
                          child: Text("Initializ(mediaId, mediaSecret, callbackTag)")
                        ),
                      ),
                      SizedBox( height: 5,),
                      Container(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
                            initialize5(mediaId, mediaSecret, _callbackTagController.text, _childYNController.text);
                          },
                          child: Text("Initializ(mediaId, mediaSecret, callbackTag, childYN)")
                        ),
                      ),
                      SizedBox( height: 5,),
                      Container(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () { isInitialized(); },
                          child: Text("isInitialized")
                        ),
                      ),
                      SizedBox( height: 20,),
                      Text(
                        "Other",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox( height: 5,),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          controller: _customdataController,
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                            border: InputBorder.none,
                            labelText: 'CustomData',
                          ),
                        ),
                      ),
                      SizedBox( height: 5,),
                      Container(
                        width: double.infinity,
                        child: OutlinedButton(
                            onPressed: () { setRewardedCheckParam(_customdataController.text); },
                            child: Text("CustomData")
                        ),
                      ),
                      SizedBox( height: 5,),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () { getSDKVersion(); },
                                child: Text("Print SDK Version")
                              ),
                            ),
                          ),
                          SizedBox( width: 5,),
                          Flexible(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () { getNetworkVersions(); },
                                child: Text("Print Network Version")
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox( height: 5,),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          controller: _unitIdController,
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                            border: InputBorder.none,
                            labelText: 'Unit ID',
                          ),
                        ),
                      ),
                      SizedBox( height: 5,),
                      Container(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () { getUnitStatus(_unitIdController.text); },
                          child: Text("Get UnitID Status")
                        ),
                      ),
                      SizedBox( height: 10,),
                      Container(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () { showMaxMediationDebugger(); },
                          child: Text("Show Max Mediation Debugger - 앱 구동 후 첫 진입 시 5초간 대기 후 화면 터치 가능")
                        ),
                      ),
                      SizedBox( height: 5,),
                      Container(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () { showAdmobMediationDebugger(); },
                          child: Text("Show Admob Mediation Debugger - 미동작 시 애드몹 물량 로드 후 진입 가능 (이니셜라이즈 필요)")
                        ),
                      ),
                      SizedBox( height: 10,),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () { setVolumeOff(false); },
                                child: Text("Ad Sound On")
                              ),
                            ),
                          ),
                          SizedBox( width: 5,),
                          Flexible(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () { setVolumeOff(true); },
                                child: Text("Ad Sound Off")
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox( height: 20,),
                      Text(
                        "Offerwall",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox( height: 5,),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          controller: _offerwallUnitIdController,
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                            border: InputBorder.none,
                            labelText: 'Unit ID',
                          ),
                        ),
                      ),
                      SizedBox( height: 5,),
                      Container(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () { showOfferwall(_offerwallUnitIdController.text); },
                          child: Text("Show Offerwall")
                        ),
                      ),
                      SizedBox( height: 10,),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          controller: _offerwallItemIdController,
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                            border: InputBorder.none,
                            labelText: 'Detail Id',
                          ),
                        ),
                      ),
                      SizedBox( height: 5,),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () { showOfferwallDetail(_offerwallUnitIdController.text, _offerwallItemIdController.text); },
                                child: Text("Show Offerwall Detail")
                              ),
                            ),
                          ),
                          SizedBox( width: 5,),
                          Flexible(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () { showOfferwallDetailFromUrl(_offerwallUnitIdController.text, _offerwallItemIdController.text); },
                                child: Text("Show Offerwall Detail From URL")
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox( height: 20,),
                      Text(
                        "AdEvent",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox( height: 5,),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          controller: _adEventUnitIdController,
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                            border: InputBorder.none,
                            labelText: 'Unit ID',
                          ),
                        ),
                      ),
                      SizedBox( height: 5,),
                      Container(
                        width: double.infinity,
                        child: OutlinedButton(
                            onPressed: () { showAdEvent(_adEventUnitIdController.text); },
                            child: Text("Show AdEvent")
                        ),
                      ),
                      SizedBox( height: 20,),
                      Text(
                        "Rewarded Video",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox( height: 5,),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          controller: _rvUnitIdController,
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                            border: InputBorder.none,
                            labelText: 'Unit ID',
                          ),
                        ),
                      ),
                      SizedBox( height: 5,),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () { rewardedVideoLoad(_rvUnitIdController.text); },
                                child: Text("Load")
                              ),
                            ),
                          ),
                          SizedBox( width: 5,),
                          Flexible(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () { rewardedVideoIsLoad(_rvUnitIdController.text); },
                                child: Text("IsLoaded")
                              ),
                            ),
                          ),
                          SizedBox( width: 5,),
                          Flexible(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () { rewardedVideoShow(); },
                                child: Text("Show")
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox( height: 20,),
                      Text(
                        "Interstitial",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox( height: 5,),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          controller: _itUnitIdController,
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                            border: InputBorder.none,
                            labelText: 'Unit ID',
                          ),
                        ),
                      ),
                      SizedBox( height: 5,),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () { interstitialLoad(_itUnitIdController.text); },
                                child: Text("Load")
                              ),
                            ),
                          ),
                          SizedBox( width: 5,),
                          Flexible(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () { interstitialIsLoad(_itUnitIdController.text); },
                                child: Text("IsLoaded")
                              ),
                            ),
                          ),
                          SizedBox( width: 5,),
                          Flexible(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () { interstitialShow(); },
                                child: Text("Show")
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox( height: 20,),
                      Text(
                        "RewardedVideo Interstitial",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox( height: 5,),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          controller: _riUnitId1Controller,
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                            border: InputBorder.none,
                            labelText: 'RI Unit ID1',
                          ),
                        ),
                      ),
                      SizedBox( height: 5,),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          controller: _riUnitId2Controller,
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                            border: InputBorder.none,
                            labelText: 'RI Unit ID2',
                          ),
                        ),
                      ),
                      SizedBox( height: 5,),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          controller: _riUnitId3Controller,
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                            border: InputBorder.none,
                            labelText: 'RI Unit ID3',
                          ),
                        ),
                      ),
                      SizedBox( height: 5,),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          controller: _riUnitId4Controller,
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                            border: InputBorder.none,
                            labelText: 'RI Unit ID4',
                          ),
                        ),
                      ),
                      SizedBox( height: 5,),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          controller: _riUnitId5Controller,
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                            border: InputBorder.none,
                            labelText: 'RI Unit ID5',
                          ),
                        ),
                      ),
                      SizedBox( height: 5,),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () { preLoadAllRewardedInterstitial(); },
                                child: Text("PreLoad All")
                              ),
                            ),
                          ),
                          SizedBox( width: 5,),
                          Flexible(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () {
                                  var item = List<String>.empty(growable : true);
                                  if (_riUnitId1Controller.text.isNotEmpty) {
                                    item.add(_riUnitId1Controller.text);
                                  }
                                  if (_riUnitId2Controller.text.isNotEmpty) {
                                    item.add(_riUnitId2Controller.text);
                                  }
                                  if (_riUnitId3Controller.text.isNotEmpty) {
                                    item.add(_riUnitId3Controller.text);
                                  }
                                  if (_riUnitId4Controller.text.isNotEmpty) {
                                    item.add(_riUnitId4Controller.text);
                                  }
                                  if (_riUnitId5Controller.text.isNotEmpty) {
                                    item.add(_riUnitId5Controller.text);
                                  }
                                  preLoadRewardedInterstitial(item.cast<String>());
                                },
                                child: Text("PreLoad UnitIDs")
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox( height: 5,),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          controller: _riUnitIdController,
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                            border: InputBorder.none,
                            labelText: 'RI Unit ID',
                          ),
                        ),
                      ),
                      SizedBox( height: 5,),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () { showRewardedInterstitial(_riUnitIdController.text); },
                                child: Text("Show")
                              ),
                            ),
                          ),
                          SizedBox( width: 5,),
                          Flexible(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () { getUnitStatusRewardedInterstitial(_riUnitIdController.text); },
                                child: Text("GetUnitStatus")
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox( height: 30,),
                    ],
                  ),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
