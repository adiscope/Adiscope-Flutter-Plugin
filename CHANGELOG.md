## 3.10.1
* Android
  * 버그 수정
## 3.10.0
* 공통
  * Rewarded Video의 초기 Loading 속도 개선 기능 추가
  * 이벤트 페이지 추가
  * 네트워크 제거
    * AppLovin, Fan, MobVista Adapter 제거
  * 버그 수정
* Android
  * compileSdk 업데이트 (33 -> `34`)
* iOS
  * 네트워크 버전 Update
    * Liftoff Monetize : 7.4.0 -> `7.4.2`
  * MAX 비더 추가
    * BidMachine : `3.0.1`
    * Ogury : `4.4.2`
  * Max Bidding 모듈화
## 3.9.2
* Android
  * max UnityAds Bidder SDK 버전 원복 (4.12.2 -> `4.6.1`)
## 3.9.1
* iOS
  * 네트워크 버전 원복
    * Fan : 6.15.2 -> `6.15.0`
## 3.9.0
* 공통
  * Adapter Version Check Log 추가
  * Rewarded Callback 시 지정한 값이 전달 되도록 추가
  * 네트워크 제거
    * UnityAds 제거
  * 버그 수정
* Android
  * 코어 minSdk 변경 (15 → 21)
  * chartboost SDK 업데이트
    * 9.3.1 -> `9.7.0`
  * pangle SDK 업데이트
    * 5.6.0.3 -> `6.1.0.9`
  * AdmobDF 3rd party bidder SDK 업데이트
    * mobvista: 16.5.91.0 -> `16.8.31.0`
    * pangle: 5.6.0.3.0 -> `6.1.0.9.0`
  * MAX 3rd party bidder SDK 업데이트
    * mobvista: 16.5.91.0 -> `16.8.31.0`
    * pangle: 5.6.0.3.0 -> `6.1.0.9.0`
    * unityads: 4.6.1.0 -> `4.12.2.0`
    * inmobi: 10.6.6.0 -> `10.7.5.0`
    * bidmachine: 2.7.0.0 -> `3.0.0.0`
    * verve: 2.20.0.0 -> `3.0.2.0`
* iOS
  * iOS 18 & Xcode 16 support
  * 네트워크 버전 Update
    * Inmobi : 10.7.1 -> `10.7.5`
    * Fan : 6.15.0 -> `6.15.2`
    * UnityAds : 4.10.0 -> `4.12.2`
  * 네트워크 제거
    * BidMachine
    * Ogury
## 3.8.3
* iOS
  * 네트워크 버전 Update
    * Pangle : 6.1.0.5 -> `6.2.0.6`
## 3.8.2
* iOS
  * 네트워크 버전 Update
    * Moloco : 3.0.0 -> `3.1.1`
## 3.8.1
* Android
  * RewardedVideo 버그 수정
* iOS
  * 네트워크 버전 Update
    * Pangle : 5.8.0.7 -> `6.1.0.5`
  * framework 구조에서 xcframework 구조로 변경
## 3.8.0
* 공통
  * 오퍼월 어뷰징 제어 기능 고도화
  * 오퍼월 내 RV 영역 고도화 및 버그 수정
    * 플로팅 버튼 UI/UX 개선
* Android
  * Vungle SDK 업데이트
    * Vungle Adapter: 7.1.0.0 → `7.3.2.0`
    * Admob Adapter: 22.3.0.3 → `22.3.0.4`
    * Admob Mediation Vungle Adapter: 7.1.0.0 -> `7.3.2.0`
    * Max Mediation Vungle Adapter: 7.1.0.0 -> `7.3.2.2`
  * Applovin SDK 업데이트
    * Applovin Adapter: 12.1.0.1 → `12.3.1.0`
    * Max Adapter: 12.1.0.4 → `12.3.1.0`
  * MAX 비더 추가
    * Amazon Publisher Services : `9.10.1.1`
    * BidMachine : `2.7.0.0`
    * DT Exchange : `8.2.7.1`
    * Ogury : `5.6.2.2`
    * Moloco : `3.0.1.0`
  * 버그 수정
* iOS
  * 네트워크 버전 Update
    * Liftoff Monetize : 7.2.2 -> `7.4.0`
  * MAX 비더 추가
    * Amazon Publisher Services : `4.9.6`
    * BidMachine : `2.7.0`
    * DT Exchange : `8.3.1`
    * Ogury : `4.4.0`
    * Moloco : `3.0.0`
## 3.7.0
* Android
  * 오퍼월 내 RewardedVideo 영역 추가
    * 우측 하단의 플로팅 버튼 클릭 시 RV 광고 시청 및 리워드 제공
    * 애디스콥 어드민 설정으로 플로팅 버튼 노출 제어
  * AdmobDF 3rd party bidder 추가 (Vungle, Mobvista)
    * Admob Adapter: 22.3.0.2 -> 22.3.0.3
  * Ironsource 어댑터 미지원
    * 기연동 되어있는 매체의 경우 해당 어댑터의 의존성 제거 필요
  * RV 버그 수정
    * getXb3TraceId()의 NullPointerException 이슈 수정
* iOS
  * 오퍼월에 RewardedVideo 추가
  * Admob Dynamic Floor에 Adapter 추가
    * Liftoff, Meta, Mintegral, Pangle
  * Ironsoure 제거
## 3.6.0
* Flutter officially released
## 0.0.9
* Flutter development testing
## 0.0.8
* Flutter development testing
## 0.0.7
* Flutter development testing
## 0.0.6
* Flutter development testing
## 0.0.5
* Flutter development testing
## 0.0.4
* Flutter development testing
## 0.0.3
* Flutter development testing
## 0.0.2
* Flutter development testing
## 0.0.1
* Flutter development testing
