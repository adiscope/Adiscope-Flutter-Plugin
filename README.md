# Adiscope Flutter Plugin
[![GitHub package.json version](https://img.shields.io/badge/Flutter-4.5.3-blue)](./CHANGELOG.md)
[![GitHub package.json version](https://img.shields.io/badge/Android-4.5.3-blue)](https://github.com/adiscope/Adiscope-Android-Sample)
[![GitHub package.json version](https://img.shields.io/badge/iOS-4.4.0-blue)](https://github.com/adiscope/Adiscope-iOS-Sample)
[![GitHub package.json version](https://img.shields.io/badge/Unity-4.5.3-blue)](https://github.com/adiscope/Adiscope-Unity-UPM)
[![GitHub package.json version](https://img.shields.io/badge/ReactNative-4.5.3-blue)](https://www.npmjs.com/package/@adiscope.ad/adiscope-react-native)

- Android Target API Level : 31+
- Android Minimum API Level : 21
- iOS Minimum Version : 13.0
- Xcode Minimum Version : Xcode 16.0
<details>
<summary>Networks Version</summary>
<div markdown="1">  

| Ad Network          | Android Version | iOS Version |
|---------------------|-----------------|-------------|
| AdMob               | 24.4.0          | 12.2.0      |
| Amazon              | 11.0.1          | 5.1.0       |
| AppLovin            | 13.3.1          | 13.1.0      |
| BidMachine          | 3.3.0           | 3.2.1       |
| Chartboost          | 9.8.3           | 9.8.1       |
| DT Exchange         | 8.3.7           | 8.3.5       |
| InMobi              | 10.8.3          | 10.8.2      |
| Ironsource          | 8.9.1           | 8.8.0.0     |
| Liftoff(Vungle)     | 7.5.0           | 7.4.4       |
| Meta(Fan)           | 6.20.0          | 6.17.1      |
| Mintegral(Mobvista) | 16.9.71         | 7.7.7       |
| Moloco              | 3.10.0          | 3.7.2       |
| Ogury               | 6.0.1           | 5.0.2       |
| Pangle              | 7.2.0.4         | 6.5.0.9     |
| Smaato              | 22.7.2          | 없음         |
| Unity Ads           | 4.15.0          | 4.14.0      |

> 기존 gms SDK 사용중인 퍼블리셔는 admob 혹은 max 어댑터 사용 시 24버전으로 마이그레이션 필요 [(관련 문서)](https://developers.google.com/admob/android/migration?hl=en)
> - gms 22 버전: 애디스콥 `3.3.0`~`3.10.3`
> - gms 23 버전: 애디스콥 `4.1.0`~`4.3.1`
> - gms 24 버전: 애디스콥 `4.4.0` 이상

</div>
</details>
<br/>

## Contents
#### [Add the Adiscope package to Your Project](#add-the-adiscope-package-to-your-project-1)
- [Installation](#1-installation)
- [Setup Android](#2-setup-android)
- [Setup iOS](#3-setup-ios)
#### [Adiscope Overview](#adiscope-overview-1)
- [Import](#1-import)
- [AdiscopeFlutterPlugin 생성](#2-adiscopeflutterplugin-생성)
- [Initialize](#3-initialize)
- [사용자 정보 설정](#4-사용자-정보-설정)
- [Offerwall](#5-offerwall)
- [RewardedVideo](#6-rewardedvideo)
- [Interstitial](#7-interstitial)
- [RewardedInterstitial](#8-rewardedinterstitial)
- [AdEvent](#9-adevent)
- [Etc](#10-etc)
#### [웹사이트 필수 등록](#웹사이트-필수-등록-android-전용)
#### [Adiscope Server 연동하기](./docs/reward_callback_info.md)
#### [Privacy Manifest 정책 적용](#privacy-manifest-정책-적용-ios-전용)
#### [iOS 16+ Offerwall 세로 모드 전환 적용 방법(가로모드 전용일 경우)](./docs/apple_orientations.md)
#### [Adiscope Error Information](./docs/error_info.md)
#### etc
- [Sample App 폴더 이동](./example)
- [Releases](./CHANGELOG.md)
- [LICENSE](./LICENSE)
<br/>


## Add the Adiscope package to Your Project
### 1. Installation
#### A. Latest version Installation
```ruby
flutter pub add adiscope_flutter_plugin
```
- 프로젝트의 IDE루트 경로에서 터미널을 열고 위과 같이 실행하여 플러그인을 설치
<br/>

#### B. Specific version Installation
```ruby
flutter pub add adiscope_flutter_plugin:4.5.3
```
- 프로젝트의 IDE루트 경로에서 터미널을 열고 위과 같이 특정 버전을 추가로 실행하여 플러그인을 설치    
<br/><br/><br/>

### 2. Setup Android
#### A. Setup AndroidManifest
```xml
<application>
    <meta-data android:name="adiscope_media_id" android:value="${adiscope_media_id}"/>
    <meta-data android:name="adiscope_media_secret" android:value="${adiscope_media_secret}"/>
    <meta-data android:name="com.google.android.gms.ads.APPLICATION_ID" android:value="${adiscope_admob_id}"/>
</application>
```
- Android 프로젝트의 `AndroidManifest.xml`파일에 다음과 같은 설정
- meta-data 복사해서 변경 없이 추가 (아래 B - 나의 Module Gradle의 변수 값을 참조 함)
<br/>

#### B. Setup Gradle
##### 가. Setup Project Gradle
```gradle
allprojects {
    repositories {
        maven { url 'https://repository.adiscope.com/repository/adiscope/' }
        maven { url "https://s3.amazonaws.com/smaato-sdk-releases/" }                                 // max 연동 시 추가
	maven { url "https://artifactory.bidmachine.io/bidmachine" }                                  // max 연동 시 추가
	maven { url "https://maven.ogury.co" }                                                        // max 연동 시 추가
        maven { url "https://dl-maven-android.mintegral.com/repository/mbridge_android_sdk_oversea" } // max 연동 시 추가
	maven { url "https://android-sdk.is.com" }                                                    // max 연동 시 추가
        maven { url "https://artifact.bytedance.com/repository/pangle" }                              // max 혹은 pangle 연동 시 추가
        maven { url 'https://cboost.jfrog.io/artifactory/chartboost-ads/' }                           // chartboost 연동 시 추가
    }
}
```
- Adiscope SDK는 Maven Central에 배포
- 프로젝트 파일 내에 {projectroot}/android/build.gradle 파일에 `maven` 추가
- max를 연동 시 6개를 추가하고, chartboost를 연동 시 1개를 추가
<br/>

##### 나. Setup Module Gradle
```gradle
android {
    defaultConfig {
        manifestPlaceholders = [
                adiscope_media_id    : "media id 기입 필요",
                adiscope_media_secret: "media secret 기입 필요",
                adiscope_sub_domain  : "sub domain 기입 필요",		// 옵션값 (오퍼월 상세페이지 이동 기능, 필요시 담당자 전달 예정)
                adiscope_admob_id    : "admob_app_id 기입 필요"           // Admob 사용 시 필요
        ]
    }
}
dependencies {
    implementation 'com.nps.adiscope:adiscopeCore:4.5.3'
    implementation 'com.nps.adiscope:adiscopeAndroid:1.2.2'
    implementation 'com.nps.adiscope:adapter.chartboost:9.8.3.0'        // chartboost
    implementation 'com.nps.adiscope:adapter.max:13.3.1.2'              // max
    implementation 'com.nps.adiscope:adapter.admob:24.4.0.0'            // admob
    implementation "com.nps.adiscope:adapter.pangle:7.2.0.4.0"          // pangle
    implementation 'com.nps.adiscope:adapter.vungle:7.5.0.0'            // vungle
}
```
- 애디스콥 측에 media_id 와 media_secret, sub_domain 문의!
- adiscope_media_id: 매체 아이디
- adiscope_media_secret: 매체 시크릿키
- adiscope_sub_domain: 옵션값 (오퍼월 상세페이지 이동 기능, 필요시 담당자 전달 예정)
- adiscope_admob_id: admob을 접속 하기 위한 키
- 프로젝트 파일 내에 {projectroot}/android/app/build.gradle 파일에 `manifestPlaceholders`, `implementation` 추가
- Third Party 네트워크사들을 확인 후 필요한 네트워크사들만 추가
- 특정 버전의 adapter들 버전을 확인 방법
  - `Releases`에서 `Source Code` 파일 다운로드 후 `README.md` 파일 확인
- Adapter Version이 상이할 경우 Initialize시 Log를 통해 확인 가능<br/>
![adapter version checker log](https://github.com/user-attachments/assets/286e83f0-8b63-4e3f-bb09-ad86e15df83c)<br/>    
<br/><br/><br/>

### 3. Setup iOS
#### A. Setup Podfile
```ruby
target 'Runner' do
  use_frameworks!
  use_modular_headers!
  pod 'AdiscopeAdEvent', '4.3.0'
  pod 'AdiscopeMediaAdManager', '4.3.0'
  pod 'AdiscopeMediaAdMob', '4.3.0'
  pod 'AdiscopeMediaChartBoost', '4.3.0'
  pod 'AdiscopeMediaPangle', '4.3.0'
  pod 'AdiscopeMediaVungle', '4.3.0'
  pod 'AdiscopeMediaMax', '4.3.0'
  pod 'AdiscopeMediaMaxAdapterAdManager', '4.3.0'
  pod 'AdiscopeMediaMaxAdapterAdMob', '4.3.0'
  pod 'AdiscopeMediaMaxAdapterAmazon', '4.3.0'
  pod 'AdiscopeMediaMaxAdapterBidMachine', '4.3.0'
  pod 'AdiscopeMediaMaxAdapterChartBoost', '4.3.0'
  pod 'AdiscopeMediaMaxAdapterDTExchange', '4.3.0'
  pod 'AdiscopeMediaMaxAdapterFan', '4.3.0'
  pod 'AdiscopeMediaMaxAdapterInMobi', '4.3.0'
  pod 'AdiscopeMediaMaxAdapterIronSource', '4.3.0'
  pod 'AdiscopeMediaMaxAdapterMobVista', '4.3.0'
  pod 'AdiscopeMediaMaxAdapterMoloco', '4.3.0'
  pod 'AdiscopeMediaMaxAdapterOgury', '4.3.0'
  pod 'AdiscopeMediaMaxAdapterPangle', '4.3.0'
  pod 'AdiscopeMediaMaxAdapterUnityAds', '4.3.0'
  pod 'AdiscopeMediaMaxAdapterVungle', '4.3.0'
end
```
- 프로젝트 파일 내에 {projectroot}/ios/Podfile 파일에 `pod` 추가
- Third Party 네트워크사들을 확인 후 필요한 네트워크사들만 추가
- Adapter Version이 상이할 경우 Initialize시 Xcode Log를 통해 확인 가능<br/>
![AdapterChecked](https://github.com/user-attachments/assets/c0c4e33f-d535-45fb-8115-115e57c70522)<br/>
<br/>

#### B. Setup Plist
- 프로젝트 파일 내에 {projectroot}/ios/Runner/Info.plist 파일에 추가

##### 가. AdiscopeMediaId, AdiscopeMediaSecret 추가
```xml
<key>AdiscopeMediaId</key>
<string>{media id 기입 필요}</string>
<key>AdiscopeMediaSecret</key>
<string>{media secret 기입 필요}</string>
```
<br/>

##### 나. App Tracking Permission 추가
```xml
<key>NSUserTrackingUsageDescription</key>
<string></string>
```
- ex : Some ad content may require access to the user tracking.
<br/>

##### 다. SKAdNetwork 추가 ([Download](https://github.com/adiscope/Adiscope-iOS-Sample/releases/download/3.8.0/AdiscopeSkAdNetworks.plist))
```xml
<dict>
    <key>SKAdNetworkItems</key>
    <array>
	<dict>
	    <key>SKAdNetworkIdentifier</key>
	    <string></string>
	</dict>
    </array>
</dict>
```
- SKAdNetwork Download File 내용 추가 ([Download](https://github.com/adiscope/Adiscope-iOS-Sample/releases/download/3.8.0/AdiscopeSkAdNetworks.plist))
<br/>

##### 라. Admob, Max의 Admob 사용 시 추가
```xml
<key>GADIsAdManagerApp</key>
<true/>
<key>GADApplicationIdentifier</key>
<string>{admob_app_id 기입 필요}</string>
```
- "GADIsAdManagerApp" 설정 및 "GADApplicationIdentifier"의 Key 설정
<br/><br/><br/><br/>

## Adiscope Overview
### 1. Import
```dart
import 'package:adiscope_flutter_plugin/adiscope_flutter_plugin.dart';
```
- Adiscope을 사용하기 위해서 추가    
<br/><br/><br/>

### 2. AdiscopeFlutterPlugin 생성
```dart
final _adiscopeFlutterPlugin = AdiscopeFlutterPlugin();
```
- Adiscope을 사용하기 위해서 추가    
<br/><br/><br/>

### 3. Initialize
#### A. Code에서 Media 없이 Initialize 방법
```dart
Future<void> initialize() async {
    bool result = await _adiscopeFlutterPlugin.initialize() ?? false;
    if (result) {
        // Initialize Call Back
    } else {
        // Initialize Fail
    }
}
```
- Android는 [AndroidManifest](#a-setup-androidmanifest) 파일과 [Module Gradle](#나-setup-module-gradle) 파일 세팅 필요
- iOS는 [Plist](#가-adiscopemediaid-adiscopemediasecret-추가) 파일 세팅 필요
- App 실행 시 1회 설정 권장
- Adiscope에서는 Google Play 가족 정책을 준수해야 함 (Android 전용 - [Adiscope Google Play 가족 정책 확인](./docs/familiespolicy.md))
  - ⚠️ 정책 미준수시 광고에 제한이 생김 (광고 물량 축소 및 오퍼월 진입 불가)
<br/>

#### B. Code에서 직접 Media 넣어서 Initialize 방법
```dart
Future<void> initialize() async {
    var mediaId = "";        // 관리자를 통해 발급
    var mediaSecret = "";    // 관리자를 통해 발급
    var callbackTag = "";    // 관리자를 통해 발급, 기본 ""
    var childYN = "";        // 어린이 여부를 설정 해주는 값(Google GMA에 세팅)
    bool result = await _adiscopeFlutterPlugin.initialize(mediaId, mediaSecret, callbackTag, childYN) ?? false;
    if (result) {
        // Initialize Call Back
    } else {
        // Initialize Fail
    }
}
```
- App 실행 시 1회 설정 권장
- Adiscope에서는 Google Play 가족 정책을 준수해야 함 (Android 전용 - [Adiscope Google Play 가족 정책 확인](./docs/familiespolicy.md))
  - ⚠️ 정책 미준수시 광고에 제한이 생김 (광고 물량 축소 및 오퍼월 진입 불가)
<br/><br/><br/>

### 4. 사용자 정보 설정
```dart
Future<void> setUserId() async {
    var userId = "";        // set unique user id to identify the user in reward information
    bool result =  await _adiscopeFlutterPlugin.setUserId(userId) ?? false;
}
```
- ⚠️ `Offerwall`, `RewardedVideo`, `RewardedInterstitial`를 사용하기 위해 필수 설정
- 64자까지 설정 가능 
<br/><br/><br/>

### 5. Offerwall
#### A. Show
```dart
Future<void> showOfferwall() async {
    var unitId = "";        // 관리자를 통해 발급
    bool result = await _adiscopeFlutterPlugin.showOfferwall(unitId) ?? false;
}
```
- `Show`가 실행되면 (return값이 True일 경우) `onOfferwallAdOpened`와 `onOfferwallAdFailedToShow` 중 하나가 항상 호출되고, `onOfferwallAdOpened`가 호출되었다면 이후 `onOfferwallAdClosed`가 항상 호출
<br/>

#### B. Callbacks
```dart
AdiscopeListener.setupOfferwallListener(
    onOfferwallAdOpened: (unitId) {
    },
    onOfferwallAdClosed: (unitId) {
    },
    onOfferwallAdFailedToShow: (unitId, errorDescription, errorXB3TraceID) {
    }
);
```
- [Initialize](#3-initialize)를 실행 해야 Callbacks 호출
- Show 성공 시 `onOfferwallAdOpened`, `onOfferwallAdClosed` callback이 순차적으로 호출
- `onOfferwallAdFailedToShow`시 [AdiscopeError 참고](./docs/error_info.md) 
<br/><br/><br/>

### 6. RewardedVideo
#### A. Load
```dart
Future<void> rewardedVideoLoad() async {
    var unitId = "";      // 관리자를 통해 발급
    bool result = await _adiscopeFlutterPlugin.rewardedVideoLoad(unitId) ?? false;
}
```
- 해당 유닛에 속한 ad 네크워크들의 광고를 Load
- `onRewardedVideoAdLoaded` callback이 호출되면 Load가 완료
- `Load`가 실행되면 `onRewardedVideoAdLoaded` 와 `onRewardedVideoAdFailedToLoad` 중 하나의 callback은 항상 호출
- Rewarded Video Ad의 `Load`와 `Show`는 pair로 호출
- Load를 한 후 Show를 하고, 광고를 Show한 후에는 다시 Load를 하여 다음 번 Show를 준비
- Load & Show 후 다시 Load를 하려 할 때 Load 는 Show 이후 언제든 호출가능
  - 광고가 Show되는 동안 다음 광고를 Load를 할 수도 있지만 이는 사용하는 mediation ad network company의 종류에 따라 달라질 수 있으므로 항상 보장되는 동작은 아님
- Show의 callback 인 `onRewardedVideoAdClosed`에서 다시 Load를 하는 것을 권장 
  - Abusing 방지를 위해 Rewarded Video Ad를 연속으로 보여주는 것을 제한하여 한번 광고를 보고 나면 일정 시간이 지난 후에 다시 Show를 할 수 있도로록 Admin page에서 서비스 설정 가능
- Load 동작 수행 중에 Load를 여러 번 호출할 수 없음
- (**Optional**) Load의 시간이 필요해 ProgressBar 노출 추천
<br/>

#### B. IsLoaded
```dart
Future<void> rewardedVideoIsLoad() async {
    var unitId = "";      // 관리자를 통해 발급
    bool result = await _adiscopeFlutterPlugin.rewardedVideoIsLoad(unitId) ?? false;
    if (result) {
        // show ad here
    } else {
        // do something else
    }
}
```
- 광고가 Load 되었는지 상태를 확인
<br/>

#### C. Show
```dart
Future<void> rewardedVideoShow() async {
    var unitId = "";      // 관리자를 통해 발급
    bool result = await _adiscopeFlutterPlugin.rewardedVideoIsLoad(unitId) ?? false;
    if (result) {
        bool resultShow = await _adiscopeFlutterPlugin.rewardedVideoShow() ?? false;
        if (resultShow) {
            // Success
        } else {
            // This Show request is duplicated
        }
    } else {
        // ad is not loaded
    }
}
```
- 마지막으로 Load된 광고를 사용자에게 보여줌
- Show 호출 후에는 다시 Load를 호출 할 수 있음
- Show method는 중복하여 호출 할 수 없음
- `Show`가 실행되면 (return값이 True일 경우) `onRewardedVideoAdOpened`와 `onRewardedVideoAdFailedToShow` 중 하나가 항상 호출되고, `onRewardedVideoAdOpened`가 호출되었다면 이후 `onRewardedVideoAdClosed`가 항상 호출
- Rewarded Video Ad의 `Load`와 `Show`는 pair로 호출
    - Load를 한 후 Show를 하고, 광고를 Show한 후에는 다시 Load를 하여 다음번 Show를 준비
<br/>

#### D. Callback Reward
```dart
AdiscopeListener.setupRewardedVideoListener(
    onRewarded: (unitId, currencyUnit, amount) {
	// unitId - 해당 rewarded video ad의 unitId (rewardedVideoShow 시 입력한 값)
    	// currencyUnit - 보상 type
    	// amount - 보상의 양
    },
);
```
- [Initialize](#3-initialize)를 실행 해야 Callbacks 호출
- 보상이 주어져야 할 경우 `onRewarded`가 호출되며 그 parameter로 관련 정보가 전달
- 이 보상 정보를 바탕으로 게임 내에서 보상을 지급
- `onRewarded`는 보통 `onRewardedVideoAdOpened` 와 `onRewardedVideoAdClosed` 사이에 호출되는 경우가 많으나 광고 System의 상황에 따라 달라 질 수 있음
- `onRewarded`가 호출되지 않는 경우도 존재할 수 있음(Reward 설정을 Server-to-server로 하였다면, Video 시청 후에는 `OnRewarded`가 호출되지 않음)
- Reward 정보는 abusing 방지를 위해서 Server-to-server 방식으로 전달 받는 것을 권장
- Server-to-server 방식을 선택하더라도 보상이 전달 될 시에는 `onRewarded`가 호출
  - 이때는 Server를 통해 전달받은 정보를 기준으로 처리하고, `onRewarded`를 통해 전달받은 정보는 검증용으로 사용하거나 무시하도록 함
<br/>

#### D. Callback Others
```dart
AdiscopeListener.setupRewardedVideoListener(
    onRewardedVideoAdLoaded: (unitId) {
    },
    onRewardedVideoAdFailedToLoad: (unitId, errorDescription, errorXB3TraceID) {
    },
    onRewardedVideoAdOpened: (unitId) {
    },
    onRewardedVideoAdClosed: (unitId) {
    },
    onRewardedVideoAdFailedToShow: (unitId, errorDescription, errorXB3TraceID) {
    }
);
```
- [Initialize](#3-initialize)를 실행 해야 Callbacks 호출
- `Load` 성공 시 `onRewardedVideoAdLoaded`, 실패 시 `onRewardedVideoAdFailedToLoad`가 호출
- `Show` 성공 시 `onRewardedVideoAdOpened`, `onRewardedVideoAdClosed`가 순차적으로 호출되고, 실패시 `onRewardedVideoAdFailedToShow`가 호출
- `onRewardedVideoAdFailedToLoad`, `onRewardedVideoAdFailedToShow`시 [AdiscopeError 참고](./docs/error_info.md) 
<br/><br/><br/>

### 7. Interstitial
#### A. Load
```dart
Future<void> interstitialLoad() async {
    var unitId = "";      // 관리자를 통해 발급
    bool result = await _adiscopeFlutterPlugin.interstitialLoad(unitId) ?? false;
}
```
- 해당 유닛에 속한 ad 네크워크들의 광고를 Load
- `onInterstitialAdLoaded` callback이 호출되면 Load가 완료
- Interstitial의 `Load`와 `Show`는 pair로 호출
- Load를 한 후 Show를 하고, 광고를 Show한 후에는 다시 Load를 하여 다음 번 Show를 준비
- 광고가 Show되는 동안 다음 광고를 load를 할 수도 있지만 이는 사용하는 mediation ad network company의 종류에 따라 달라질 수 있으므로 항상 보장되는 동작은 아님
- Load 동작 수행 중에 Load를 여러 번 호출할 수 없음
- (**Optional**) Load의 시간이 필요해 ProgressBar 노출 추천
<br/>

#### B. IsLoaded
```dart
Future<void> interstitialIsLoad() async {
    var unitId = "";      // 관리자를 통해 발급
    bool result = await _adiscopeFlutterPlugin.interstitialIsLoad(unitId) ?? false;
    if (result) {
        // show ad here
    } else {
        // do something else
    }
}
```
- 광고가 Load 되었는지 상태를 확인
<br/>

#### C. Show
```dart
Future<void> interstitialShow() async {
    var unitId = "";      // 관리자를 통해 발급
    bool result = await _adiscopeFlutterPlugin.interstitialIsLoad(unitId) ?? false;
    if (result) {
        bool resultShow = await _adiscopeFlutterPlugin.interstitialShow() ?? false;
        if (interstitialAd.Show()) {
            // Success
        } else {
            // This Show request is duplicated
        }
    } else {
        // ad is not loaded
    }
}
```
- 마지막으로 Load된 광고를 사용자에게 보여줌
- Show 호출 후에는 다시 Load를 호출 할 수 있음
- Show method는 중복하여 호출 할 수 없음
- `Show`가 실행되면 (return값이 True일 경우) `onInterstitialAdLoaded`와 `onInterstitialAdFailedToLoad` 중 하나가 항상 호출되고, `onInterstitialAdOpened`가 호출되었다면 이후 `onInterstitialAdClosed`가 항상 호출
- Rewarded Video Ad의 `Load`와 `Show`는 pair로 호출
    - Load를 한 후 Show를 하고, 광고를 Show한 후에는 다시 Load를 하여 다음번 Show를 준비
<br/>

#### D. Callback
```dart
AdiscopeListener.setupInterstitialListener(
    onInterstitialAdLoaded: (unitId) {
    },
    onInterstitialAdFailedToLoad: (unitId, errorDescription, errorXB3TraceID) {
    },
    onInterstitialAdOpened: (unitId) {
    },
    onInterstitialAdClosed: (unitId) {
    },
    onInterstitialAdFailedToShow: (unitId, errorDescription, errorXB3TraceID) {
    }
);
```
- [Initialize](#3-initialize)를 실행 해야 Callbacks 호출
- `Load` 성공 시 `onInterstitialAdLoaded`, 실패 시 `onInterstitialAdFailedToLoad`가 호출
- `Show` 성공 시 `onInterstitialAdOpened`, `onInterstitialAdClosed`가 순차적으로 호출되고, 실패 시 `onInterstitialAdFailedToShow`가 호출 
- `onInterstitialAdFailedToLoad`, `onInterstitialAdFailedToShow`시 [AdiscopeError 참고](./docs/error_info.md) 
<br/><br/><br/>

### 8. RewardedInterstitial
#### A. PreLoadAll
```dart
Future<void> preLoadAllRewardedInterstitial() async {
    bool result = await _adiscopeFlutterPlugin.preLoadAllRewardedInterstitial() ?? false;
}
```
- Initialize Call Back 후 1회 설정 권장
- 관리자가 설정된 활성화된 모든 유닛들을 Load 진행
<br/>

#### B. Unit 지정 PreLoad
```dart
Future<void> preLoadRewardedInterstitial() async {
    var unitIds = List<String>.empty(growable : true);
    unitIds.add(unitId1);
    unitIds.add(unitId2);
    bool result = await _adiscopeFlutterPlugin.preLoadRewardedInterstitial(unitIds) ?? false;
}
```
- Initialize Call Back 후 1회 설정 권장
- 입력된 유닛들을 Load 진행
<br/>

#### C. Show
```dart
Future<void> showRewardedInterstitial(String unitId) async {
    var unitId = "";      // 관리자를 통해 발급
    bool result = await _adiscopeFlutterPlugin.showRewardedInterstitial(unitId) ?? false;
}
```
- 해당 유닛이 Load되어 있으면 안내 팝업을 보여 준 뒤 해당 광고를 사용자에게 보여줌
- showRewardedInterstitial method는 중복하여 호출 할 수 없음
- `showRewardedInterstitial`가 실행되면 (return값이 True일 경우) `onRewardedInterstitialAdSkip`와 `onRewardedInterstitialAdOpened`와 `onRewardedInterstitialAdFailedToShow` 중 하나가 항상 호출되고, `onRewardedInterstitialAdOpened`가 호출되었다면 이후 `onRewardedInterstitialAdClosed`가 항상 호출
- `onRewardedInterstitialAdClosed`와 `onRewardedInterstitialAdFailedToShow`가 호출 되면 내부에서 해당 유닛을 자동 Load 시킴
<br/>

#### D. Callbacks Reward
```dart
AdiscopeListener.setupRewardedInterstitialListener(
    onRewardedInterstitialRewarded: (unitId, currencyUnit, amount) {
	// unitId - 해당 rewarded video ad의 unitId (ShowRewardedInterstitial 시 입력한 값)
    	// currencyUnit - 보상 type
    	// amount - 보상의 양
    },
);
```
- [Initialize](#3-initialize)를 실행 해야 Callbacks 호출
- 보상이 주어져야 할 경우 `onRewardedInterstitialRewarded`가 호출되며 그 parameter로 관련 정보가 전달
- 이 보상 정보를 바탕으로 게임 내에서 보상을 지급
- `onRewardedInterstitialRewarded`는 보통 `onRewardedInterstitialAdOpened` 와 `onRewardedInterstitialAdClosed` 사이에 호출되는 경우가 많으나 광고 System의 상황에 따라 달라 질 수 있음
- `onRewardedInterstitialRewarded`가 호출되지 않는 경우도 존재할 수 있음(Reward 설정을 Server-to-server로 하였다면, Video 시청 후에는 `OnRewarded`가 호출되지 않음)
- Reward 정보는 abusing 방지를 위해서 Server-to-server 방식으로 전달 받는 것을 권장
- Server-to-server 방식을 선택하더라도 보상이 전달 될 시에는 `onRewardedInterstitialRewarded`가 호출
  - 이때는 Server를 통해 전달받은 정보를 기준으로 처리하고, `onRewardedInterstitialRewarded`를 통해 전달받은 정보는 검증용으로 사용하거나 무시하도록 함
<br/>

#### D. Callbacks Others
```dart
AdiscopeListener.setupRewardedInterstitialListener(
    onRewardedInterstitialAdSkip: (unitId) {
    },
    onRewardedInterstitialAdOpened: (unitId) {
    },
    onRewardedInterstitialAdClosed: (unitId) {
    },
    onRewardedInterstitialAdFailedToShow: (unitId, errorDescription, errorXB3TraceID) {
    }
);
```
- [Initialize](#3-initialize)를 실행 해야 Callbacks 호출
- Show 성공 후 Skip 시 `onRewardedInterstitialAdSkip`가 호출
- Show 성공 후 영상 시청 시 `onRewardedInterstitialAdOpened`, `onRewardedInterstitialAdClosed`가 순차적으로 호출되고, 실패 시 `onRewardedInterstitialAdFailedToShow`가 호출 
- `onRewardedInterstitialAdFailedToShow`시 [AdiscopeError 참고](./docs/error_info.md) 
<br/><br/><br/>

### 9. AdEvent
#### A. Show
```dart
Future<void> showAdEvent() async {
    var unitId = "";        // 관리자를 통해 발급
    bool result = await _adiscopeFlutterPlugin.showAdEvent(unitId) ?? false;
}
```
- `Show`가 실행되면 (return값이 True일 경우) `onAdEventOpened`와 `onAdEventFailedToShow` 중 하나가 항상 호출되고, `onAdEventOpened`가 호출되었다면 이후 `onAdEventClosed`가 항상 호출
<br/>

#### B. Callbacks
```dart
AdiscopeListener.setupAdEventListener(
    onAdEventOpened: (unitId) {
    },
    onAdEventClosed: (unitId) {
    },
    onAdEventFailedToShow: (unitId, errorDescription, errorXB3TraceID) {
    }
);
```
- [Initialize](#3-initialize)를 실행 해야 Callbacks 호출
- Show 성공 시 `onAdEventOpened`, `onAdEventClosed` callback이 순차적으로 호출
- `onAdEventFailedToShow`시 [AdiscopeError 참고](./docs/error_info.md) 
<br/><br/><br/>

### 10. Etc
#### A. Adiscope SDK Version
```dart
Future<void> getSDKVersion() async {
    String result = await _adiscopeFlutterPlugin.getSDKVersion() ?? "";
}
```
- Android와 iOS의 Core SDK Version 확인
<br/>

#### B. Adiscope Network Versions
```dart
Future<void> getNetworkVersions() async {
    String result = await _adiscopeFlutterPlugin.getNetworkVersions() ?? "";
}
```
- Android와 iOS의 Third Party SDK Versions 확인
<br/>

#### C. Set Rewarded Check Param
```dart
Future<void> setRewardedCheckParam(String param) async {
    await _adiscopeFlutterPlugin.setRewardedCheckParam(param);
}
```
- Rewarded callback 시 parameters을 추가
- 해당 정보는 Rewarded 지급 등에 있어 구분하는데 사용 할 수 있음
- 내부 설정 후 사용 가능 ( 담당자에게 요청 부탁 )
- param은 Base64 Encoded(UTF8)를 처리 후 1000자내로 설정
<br/>

#### D. Volume
```dart
Future<void> setVolumeOff() async {
    bool isOff = true;  // Ad Sound Off
    bool isOff = false; // Ad Sound On (Default)
    await _adiscopeFlutterPlugin.setVolumeOff(isOff);
    if (isOff) {
      pushLog("Ad Sound Off");
    } else {
      pushLog("Ad Sound On");
    }
}
```
- `Admob`, `AppLovin`, `Mintegral`, `Verve` 만 적용 가능 
<br/><br/><br/>

## 웹사이트 필수 등록 (Android 전용)
- 관리자에게 전달받은 `app-ads.txt`를 웹사이트에 등록
> - [app-ads.txt 등록 방법 및 정보](https://github.com/adiscope/Adiscope-Android-Sample/docs/app-ads.txt.md)
<br/><br/>

## Adiscope Server 연동하기
> - [연동하기](./docs/reward_callback_info.md)
<br/><br/>

## Privacy Manifest 정책 적용 (iOS 전용)
- 2024년 5월 1일부터 출시/업데이트 되는 앱에 대해 3rd Party Framework의 개인정보 추가
> - [참고](https://developer.apple.com/videos/play/wwdc2023/10060)
<br/><br/>

## iOS 16+ Offerwall 세로 모드 전환 적용 방법(가로모드 전용일 경우)
> - [적용 방법 확인](./docs/apple_orientations.md)
<br/><br/>

## Adiscope Error Information
> - [Error 정보](./docs/error_info.md)
<br/><br/>

## Adiscope Sample App
> - [Sample App 폴더 이동](./example)
<br/><br/>

## Releases
> - [Releases](./CHANGELOG.md)
<br/><br/>

## LICENSE
> - [LICENSE](./LICENSE)
