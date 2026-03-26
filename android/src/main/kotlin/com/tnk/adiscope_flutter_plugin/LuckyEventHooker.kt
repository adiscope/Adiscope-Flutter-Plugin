package com.tnk.adiscope_flutter_plugin

import android.app.Activity
import androidx.fragment.app.FragmentActivity

class LuckyEventHooker {

    companion object {
        // 앱 재시작시 기본 값으로 초기화 된다는 것을 항상 염두에 두고 사용해야함!!
        var schemeEvent: (Activity, String) -> Unit = { _, _ -> }
    }

    fun adEventWebViewNavigated(ac: FragmentActivity, url: String): Boolean {
        if (url.startsWith("tnkscheme:")) {
            // 아래 세 가지 이벤트는 웹뷰에서 처리하도록 남겨둡니다.
            if (url.contains("history_back") || url.contains("close_view") || url.contains("open_new_window")) {
                return false
            } else {
                // 그 외 이벤트는 모두 schemeEvent 콜백으로 전달하여 처리하도록 합니다.
                schemeEvent(ac, url)
                return true
            }
        }
        return false
    }
}