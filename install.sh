#!/bin/zsh

# 맥용 스타플레이어 실행/종료 단축어입니다.
# 
# 원본 레포지토리:
# https://www.github.com/kms1212/mac-starplayer-shortcut
# 
# 이 단축어 스크립트는 BSD3 라이선스를 따릅니다.
# 라이선스 전문:
# https://raw.githubusercontent.com/kms1212/mac-starplayer-shortcut/main/LICENSE

set -e -o pipefail

echo "Please enter sudo password."
sudo true

echo "Stopping StarPlayerAgent..."
sudo pkill -9 StarPlayerAgent

echo "Getting current UID to find service from launchctl..."
cUID=$( scutil <<< "show State:/Users/ConsoleUser" | awk '/kCGSSessionUserIDKey :/ && ! /loginwindow/ { print $3 }' )

echo "Disabling service com.axissoft.StarPlayerAgent from launchctl..."
sudo launchctl disable gui/${cUID}/com.axissoft.StarPlayerAgent

echo "Removing /Library/LaunchAgents/com.axissoft.StarPlayerAgent.plist"
sudo rm -f /Library/LaunchAgents/com.axissoft.StarPlayerAgent.plist

echo "All of the operations are completed. Thank you!"