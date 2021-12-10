# �ƿ� ��Ÿ�÷��̾� ����/���� ������Դϴ�.
# 
# ���� �������丮:
# https://www.github.com/kms1212/mac-starplayer-shortcut
# 
# �� ����� ��ũ��Ʈ�� BSD3 ���̼����� �����ϴ�.
# ���̼��� ����:
# https://raw.githubusercontent.com/kms1212/mac-starplayer-shortcut/main/LICENSE

on check_app_status(appName)
	tell application "System Events" to (name of processes) contains appName
end check_app_status

on run
	set stplRunning to check_app_status("StarPlayerAgent")
	if stplRunning then
		set stplDialog to display dialog "StarPlayerAgent��(��) ���� ���Դϴ�. �����Ͻðڽ��ϱ�? (root���� �ʿ�)" buttons {"�ƴϿ�", "��"} default button "��" cancel button "�ƴϿ�"
		if (button returned of stplDialog) is equal to "��" then
			do shell script "pkill -9 StarPlayerAgent" with administrator privileges
			display dialog "����Ǿ����ϴ�."
		end if
	else
		set stplDialog to display dialog "StarPlayerAgent��(��) ���� ���� �ƴմϴ�. �����Ͻðڽ��ϱ�?" buttons {"�ƴϿ�", "��"} default button "��" cancel button "�ƴϿ�"
		if (button returned of stplDialog) is equal to "��" then
			do shell script "open /Library/PrivilegedHelperTools/StarPlayerAgent.app"
			display dialog "����Ǿ����ϴ�."
		end if
	end if
end run