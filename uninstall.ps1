# モジュール名
$ModuleName = "GetWindowsVertion"

# モジュール Path
$ModulePath = Join-Path (Split-Path $PROFILE -Parent) "Modules"

# モジュールを配置する Path
$NewPath = Join-Path $ModulePath $ModuleName

# ディレクトリ削除
Remove-Item $NewPath
