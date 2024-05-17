# Adiscope Error Information

## 1. ErrorCode Detail Info
### AdiscopeError Code
|Code	|Value	|Description	|Cause	|Instruction|
|-------|-------|---------------|-------|-----------|
|INTERNAL_ERROR	|0	|"Internal error"	|Adiscope Sdk 내부 오류 혹은 Adiscope Server 오류	|지속적으로 발생 시 Adiscope 개발팀에 문의|
|MEDIATION_ERROR	|1	|"3rd party mediation network error"	|Mediation 광고 Network의 3rd party sdk 혹은 server 오류	|지속적으로 발생 시 Adiscope 개발팀에 문의|
|INITIALIZE_ERROR	|2	|"mediaId/mediaSecret must be valid"	|Adiscope.Sdk.Initialize 시 mediaId/mediaSecret이 유효하지 않음	|지속적으로 발생 시 Adiscope 개발팀에 문의|
|SERVER_SETTING_ERROR	|3	|"Server settings are incorrect"	|광고를 보여주기 위해 필요한 내부 설정값 오류. AndroidManifest에 설정된 값이거나 Runtime 시 server로 부터 전달 받은 값이 정확하지 않음<br>Adiscope admin 설정의 수익화, 유닛 활성화가 OFF인 경우	|Adiscope admin page에서 등록된 media (application)의 id와 secret을 확인<br>Adiscope admin page의 설정 확인|
|INVALID_REQUEST	|4	|"The request is invalid"	|Show() 시 입력한 unitId 오류	|Adiscope admin page에 정의된 각 unitId를 다시 확인 후 Show()에 입력|
|NETWORK_ERROR	|5	|"There is a network problem"	|Network read/write timed out 혹은 Network connection 오류	|Device의 network 연결 상태를 확인|
|NO_FILL	|6	|"No more ads to show"	|하루에 볼 수 있는 Rewarded Video 광고의 횟수를 모두 소진 하였을 경우	|Adiscope admin page의 media (application)에 설정된 기준 시각이 지나면 광고 횟수가 다시 초기화 되므로 기준 시각 이후(next day)에 다시 시도|
|TIME_LIMIT	|7	|"It was time-limited"	|Rewarded Video 광고를 한번 보여주고 난 후 일정 시간 (30초~60초, Adiscope admin page에서 설정된 시간 간격)이 지나기 전에 다시 Show를 시도할 경우	|Adiscope admin page에서 설정된 시간 간격 만큼 간격을 두고 다시 시도|
|"NOT_EXIST_IDFA (Only iOS)"	|8	|iOS 디바이스에서 추출된 IDFA 값이 "00000000-0000-0000-0000-000000000000" 인 경우	|"Internal error"	|iOS 디바이스 설정에서 "광고 추적 제한" 설정이 ON 일 경우에 발생되며, 이 경우, SDK에서는 사용자가 "광고 추적 제한" 설정을 OFF 하도록 유도하는 안내 문구를 System Alert으로 띄운다. 사용자가 "광고 추적 제한" 설정을 OFF 후 게임을 재실행하면 광고 참여가 가능하다|
|GOOGLE_FAMILY_ERROR (Only Android)	|9	|"It is not available because of Google Family Policy"	|구글 가족정책에 의거, 사용할 수 없는 기능이 호출되었음을 의미	|구글 가족정책 가이드 참고|
|INVALID_ADID (Only Android)	|10	|"ADID value is invalid"	|adid 가 없거나 유효하지 않음을 의미	|지속적으로 발생 시 Adiscope 개발팀에 문의|
|TIME_OUT	|11	|"Time out"	|세팅한 기간 내에 Mediation 광고 네트워크의 로드 성공 콜백이 오지 않은 경우	|지속적으로 발생 시 Adiscope 개발팀에 문의|
|SHOW_CALLED_BEFORE_LOAD	|12	|"Show called before load"	|RewardedVideoAd.Show()를 Load() 없이 실행하였을 경우	|지속적으로 발생 시 Adiscope 개발팀에 문의|
|ADID IS NOT AVAILABLE (Only Android)		|13	|"When users delete ADID or opt out of Ads personalization"	|개인 정보 활용 동의 안함	|유저는 광고 참여 및 보상 획득을 위해 필수로 ADID 정보가 있거나 광고 개인 최적화 선택 해제 해야함 에러코드 발생 시 광고 ID 설정하는 화면으로 이동. 관련 매체 자체 대응을 희망할 경우 이를 유념하여 구성|
|"UNKNOWN_ERROR (Only Unity)"	|-1	|""	|알 수 없는 오류	|지속적으로 발생 시 Adiscope 개발팀에 문의|

<br/>

## 2. 에러 메시지에 코드 추가
* 사용자가 광고 재생을 시도했으나 실패하여 CS 인입된 경우 빠른 대응을 위해, 사용자 화면의 알림 메시지에 에러 코드를 첨부할 것을 권장한다.
* 사용자에게 전달할 에러 메시지는 커스텀 가능하나, 아래 예시처럼 메시지 뒤에 에러 코드를 첨부한다면 그 상세 배경을 확인하기 용이하므로 Adiscope 개발팀의 빠른 대응이 가능하다.   
### AdiscopeError Message Examples
|Code	|Value	|Cause	|Instruction	|Error Message Examples|
|-------|-------|-------|---------------|----------------------|
|MEDIATION_ERROR|1|Adiscope Sdk 내부 오류 혹은 Adiscope Server 오류|지속적으로 발생 시 Adiscope 개발팀에 문의|**재생 중에 오류가 발생했습니다 잠시 후 다시 시도해주세요 (Code 1)**|
|INVALID_REQUEST|4|Show() 시 입력한 unitId 오류|Adiscope admin page에 정의된 각 unitId를 다시 확인 후 Show()에 입력|**알 수 없는 오류로 재생에 실패하였습니다 고객센터에 문의해주세요 (Code 4)**|
|NETWORK_ERROR|5|Network read/write timed out 혹은 Network connection 오류|Device의 network 연결 상태를 확인|**인터넷 연결 상태를 확인 후 다시 시도해주세요 (Code 5)**|
|NO_FILL|6|하루에 볼 수 있는 Rewarded Video 광고의 횟수를 모두 소진 하였을 경우|Adiscope admin page의 media (application)에 설정된 기준 시각이 지나면 광고 횟수가 다시 초기화 되므로 기준 시각 이후(next day)에 다시 시도|**오늘 시청 가능한 영상이 모두 소진되었습니다 내일 다시 시도해주세요 (Code 6)**|
|TIME_LIMIT|7|Rewarded Video 광고를 한번 보여주고 난 후 일정 시간 (30초~60초, Adiscope admin page에서 설정된 시간 간격)이 지나기 전에 다시 Show를 시도할 경우|Adiscope admin page에서 설정된 시간 간격 만큼 간격을 두고 다시 시도|**재생 중에 오류가 발생했습니다 잠시 후 다시 시도해주세요 (Code 7)**|
|NOT_EXIST_IDFA(Only iOS)|8|iOS 디바이스에서 추출된 IDFA 값이 "00000000-0000-0000-0000-000000000000" 인 경우|iOS 디바이스 설정에서 "광고 추적 제한" 설정이 ON 일 경우에 발생되며, 이 경우, SDK에서는 사용자가 "광고 추적 제한" 설정을 OFF 하도록 유도하는 안내 문구를 System Alert으로 띄운다. 사용자가 "광고 추적 제한" 설정을 OFF 후 게임을 재실행하면 광고 참여가 가능하다|**설정에서 광고 추적을 허용해주세요 (Code 8]**|
|GOOGLE_FAMILY_ERROR (Only Android)|9|구글 가족정책에 의거, 사용할 수 없는 기능이 호출되었음을 의미|구글 가족정책 가이드 참고|**만 13세 미만 사용자에게 광고 시청이 제한되어있습니다 (Code 9)**|
|INVALID_ADID (Only Android)|10|adid 가 없거나 유효하지 않음을 의미|지속적으로 발생 시 Adiscope 개발팀에 문의|**재생 중에 오류가 발생했습니다 잠시 후 다시 시도해주세요(Code 10]**|
|TIME_OUT|11|세팅한 기간 내에 Mediation 광고 네트워크의 로드 성공 콜백이 오지 않은 경우|지속적으로 발생 시 Adiscope 개발팀에 문의|**재생 중에 오류가 발생했습니다 잠시 후 다시 시도해주세요 (Code 11)**|
|SHOW_CALLED_BEFORE_LOAD|12|RewardedVideoAd.Show()를 Load() 없이 실행하였을 경우|load() 실행 후 show() 호출 권고|**재생 중에 오류가 발생했습니다 잠시 후 다시 시도해주세요 (Code 12)**|
|ADID IS NOT AVAILABLE|13|Android 광고 설정의 adid 를 제거한 경우|**개인 정보 활용 동의 안함	|**유저는 광고 참여 및 보상 획득을 위해 필수로 ADID 정보가 있거나 광고 개인 최적화 선택 해제 해야함 에러코드 발생 시 광고 ID 설정하는 화면으로 이동. 관련 매체 자체 대응을 희망할 경우 이를 유념하여 구성 (Code 13)**|

