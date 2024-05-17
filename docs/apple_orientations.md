# iOS 16+ Offerwall 세로 모드 전환 적용 방법
- 적용하는 App이 `Portrait`를 사용하지 않을 경우 필수로 적용   
<br/>

## 코드 적용
- iOS용으로 빌드 후 `UnityAppController.mm` 파일에서 `supportedInterfaceOrientationsForWindow` 코드 수정
```cpp
#import <Adiscope/Adiscope.h>
```
```cpp    
//***** Adiscope Start *****//
if (AdiscopeInterface.sharedInstance.isOfferwallViewPortrait) {
    return UIInterfaceOrientationPortrait;
}
//****** Adiscope End ******//
```

- 추가 되어야 하는 함수 및 위치   
```cpp   
- (NSUInteger)application:(UIApplication*)application supportedInterfaceOrientationsForWindow:(UIWindow*)window   
{   
    // No rootViewController is set because we are switching from one view controller to another, all orientations should be enabled   
    if ([window rootViewController] == nil)   
        return UIInterfaceOrientationMaskAll;   
   
    // During splash screen show phase no forced orientations should be allowed.   
    // This will prevent unwanted rotation while splash screen is on and application is not yet ready to present (Ex. Fogbugz cases: 1190428, 1269547).   
    if (!_unityAppReady)   
        return [_rootController supportedInterfaceOrientations];   
   
   
    //***** Adiscope Start *****//
    if (AdiscopeInterface.sharedInstance.isOfferwallViewPortrait) {
        return UIInterfaceOrientationPortrait;
    }
    //****** Adiscope End ******//
   
   
    // Some presentation controllers (e.g. UIImagePickerController) require portrait orientation and will throw exception if it is not supported.   
    // At the same time enabling all orientations by returning UIInterfaceOrientationMaskAll might cause unwanted orientation change   
    // (e.g. when using UIActivityViewController to "share to" another application, iOS will use supportedInterfaceOrientations to possibly reorient).   
    // So to avoid exception we are returning combination of constraints for root view controller and orientation requested by iOS.   
    // _forceInterfaceOrientationMask is updated in willChangeStatusBarOrientation, which is called if some presentation controller insists on orientation change.   
    return [[window rootViewController] supportedInterfaceOrientations] | _forceInterfaceOrientationMask;   
}   
```   
<br/>

## Offerwall 세로 모드 전환 이유
- 사용성으로 세로 모드로 고정해 지원
<br/>

## iOS 16+에서 직접 코드 수정 필요 이유
- [application:(UIApplication*)application supportedInterfaceOrientationsForWindow:(UIWindow*)window] 함수에 추가 없으면   
  requestGeometryUpdate(_:errorHandler:) 에서 오류 발생   
  `Error Domain=UISceneErrorDomain Code=101 "None of the requested orientations are supported by the view controller. Requested: portrait; Supported: landscapeLeft, landscapeRight" UserInfo={NSLocalizedDescription=None of the requested orientations are supported by the view controller. Requested: portrait; Supported: landscapeLeft, landscapeRight}"`   
<br/>

## 참고 자료
- [GameCenter를 사용하는 iOS의 방향 문제](https://support.unity.com/hc/en-us/articles/208532136-Orientation-problem-on-iOS-with-GameCenter)
- [iOS 16+에서 requestGeometryUpdate 추가](https://developer.apple.com/documentation/uikit/uiwindowscene/3975944-requestgeometryupdate/)
