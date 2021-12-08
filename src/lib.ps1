function SaveGenericSessionCredential($TargetName, $Password) {
  New-StoredCredential `
    -Type GENERIC `
    -Target $TargetName `
    -Persist SESSION `
    -Password $Password `
    -ErrorAction Stop
}

function GetGenericCredential($TargetName) {
  Get-StoredCredential `
    -Type GENERIC `
    -Target $TargetName `
    -ErrorAction Stop
}

function RemoveGenericCredential($TargetName) {
  Remove-StoredCredential `
    -Type GENERIC `
    -Target $TargetName `
    -ErrorAction Stop
}
