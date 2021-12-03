function SaveGenericSessionCredential($TargetName, $Password) {
  New-StoredCredential `
    -Type GENERIC `
    -Target $TargetName `
    -Persist SESSION `
    -Password $Password
}

function GetGenericCredential($TargetName) {
  Get-StoredCredential `
    -Type GENERIC `
    -Target $TargetName
}

function RemoveGenericCredential($TargetName) {
  Remove-StoredCredential `
    -Type GENERIC `
    -Target $TargetName
}
