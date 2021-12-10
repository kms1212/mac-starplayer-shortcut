# 맥용 스타플레이어 실행/종료 단축어입니다.
# 
# 원본 레포지토리:
# https://www.github.com/kms1212/mac-starplayer-shortcut
# 
# 이 단축어 스크립트는 BSD3 라이선스를 따릅니다.
# 라이선스 전문:
# https://raw.githubusercontent.com/kms1212/mac-starplayer-shortcut/main/LICENSE

on check_app_status(appName)
	tell application "System Events" to (name of processes) contains appName
end check_app_status

on run
	set stplRunning to check_app_status("StarPlayerAgent")
	if stplRunning then
		set stplDialog to display dialog "StarPlayerAgent이(가) 실행 중입니다. 종료하시겠습니까? (root권한 필요)" buttons {"아니오", "예"} default button "예" cancel button "아니오"
		if (button returned of stplDialog) is equal to "예" then
			do shell script "pkill -9 StarPlayerAgent" with administrator privileges
			display dialog "종료되었습니다."
		end if
	else
		set stplDialog to display dialog "StarPlayerAgent이(가) 실행 중이 아닙니다. 실행하시겠습니까?" buttons {"아니오", "예"} default button "예" cancel button "아니오"
		if (button returned of stplDialog) is equal to "예" then
			do shell script "open /Library/PrivilegedHelperTools/StarPlayerAgent.app"
			display dialog "실행되었습니다."
		end if
	end if
end run