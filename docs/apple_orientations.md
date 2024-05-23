# iOS 16+ Offerwall 세로 모드 전환 적용 방법
- 적용하는 App이 `Portrait`를 사용하지 않을 경우 필수로 적용   
<br/>

## Swift 코드 적용
- 프로젝트 파일 내에 {projectroot}/ios/Runner/AppDelegate.swift 파일에 Adiscope 주석문 사이를 추가
```swift
import UIKit
import Flutter
//***** Adiscope import Start *****//
import Adiscope
//***** Adiscope import End *****//

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

//***** Adiscope Orientation Start *****//
  override func application(
    _ application: UIApplication,
    supportedInterfaceOrientationsFor window: UIWindow?
  ) -> UIInterfaceOrientationMask {
    if AdiscopeInterface.sharedInstance().isOfferwallViewPortrait() {
      return UIInterfaceOrientationMask.portrait
    }
    return UIInterfaceOrientationMask.all  // App의 방향에 맞게 설정
  }
//***** Adiscope Orientation End *****//
}
```

## Object-C 코드 적용
- 프로젝트 파일 내에 {projectroot}/ios/Runner/AppDelegate.m 파일에 Adiscope 주석문 사이를 추가
```objectivec   
#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
//***** Adiscope import Start *****//
#import <Adiscope/Adiscope.h>
//***** Adiscope import End *****//

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

//***** Adiscope Orientation Start *****//
- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    if (AdiscopeInterface.sharedInstance.isOfferwallViewPortrait) {
        return UIInterfaceOrientationPortrait;
    }
    return UIInterfaceOrientationMaskAll;
}
//***** Adiscope Orientation End *****//
@end
```   
<br/>

## Offerwall 세로 모드 전환 이유
- 사용성으로 세로 모드로 고정해 지원
<br/>

## iOS 16+에서 직접 코드 수정 필요 이유
- AppDelegate 함수에 추가 없으면 requestGeometryUpdate(_:errorHandler:) 에서 오류 발생   
  `Error Domain=UISceneErrorDomain Code=101 "None of the requested orientations are supported by the view controller. Requested: portrait; Supported: landscapeLeft, landscapeRight" UserInfo={NSLocalizedDescription=None of the requested orientations are supported by the view controller. Requested: portrait; Supported: landscapeLeft, landscapeRight}"`   
<br/>

## 참고 자료
- [GameCenter를 사용하는 iOS의 방향 문제](https://support.unity.com/hc/en-us/articles/208532136-Orientation-problem-on-iOS-with-GameCenter)
- [iOS 16+에서 requestGeometryUpdate 추가](https://developer.apple.com/documentation/uikit/uiwindowscene/3975944-requestgeometryupdate/)
