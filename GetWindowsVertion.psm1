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

    # OS のエディション
    $Win32_OperatingSystem = Get-CimInstance Win32_OperatingSystem
    $OS = $Win32_OperatingSystem.Caption
    $SP = $Win32_OperatingSystem.ServicePackMajorVersion
    if( $SP -ne 0 ){ $OS += " SP" + $SP }
    echo ""
    echo $OS

    # Hot Fix
    Get-HotFix | sort InstalledOn -Descending

    # 起動時刻
    $WMI_OpreationSystem = Get-CimInstance win32_operatingsystem
    $WMI_OpreationSystem.LastBootUpTime
}



