#########################################
# Windows ビルド番号取得
#########################################
function GetWindowsVertion(){
    # ビルド番号詳細
    $RegPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion"
    $RegKey = "BuildLabEx"
    echo (Get-ItemProperty $RegPath -name $RegKey).$RegKey

    # Winver のビルド番号
    $RegPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion"
    $RegKey = "CurrentBuild"
    $MajorNumber = (Get-ItemProperty -Path $RegPath -name $RegKey).$RegKey
    $RegKey = "UBR"
    $MinorNumber = (Get-ItemProperty -Path $RegPath -name $RegKey).$RegKey
    $BuildNumber = $MajorNumber + "." + [String]$MinorNumber
    echo $BuildNumber

    # Winver のバージョン
    $RegPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion"
    $RegKey = "ReleaseId"
    echo (Get-ItemProperty $RegPath -name $RegKey -ErrorAction SilentlyContinue).$RegKey

    # Winver の表示バージョン
    $RegPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion"
    $RegKey = "DisplayVersion"
    echo (Get-ItemProperty $RegPath -name $RegKey -ErrorAction SilentlyContinue).$RegKey

    # Hot Fix
    Get-HotFix | sort InstalledOn -Descending

    # 起動時刻
    $WMI_OpreationSystem = Get-WmiObject win32_operatingsystem
    $Boot = $WMI_OpreationSystem.LastBootUpTime
    $WMI_OpreationSystem.ConvertToDateTime($Boot)
}



