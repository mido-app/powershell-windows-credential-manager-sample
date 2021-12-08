function SaveGenericSessionCredential($TargetName, $Password) {
  [void] (
    New-StoredCredential `
      -Type GENERIC `
      -Target $TargetName `
      -Persist SESSION `
      -Password $Password `
      -ErrorAction Stop
  )
}

function GetGenericCredential($TargetName) {
  $Credential = Get-StoredCredential `
    -Type GENERIC `
    -Target $TargetName `
    -ErrorAction Stop
  return $Credential
}

function RemoveGenericCredential($TargetName) {
  [void] (
    Remove-StoredCredential `
      -Type GENERIC `
      -Target $TargetName `
      -ErrorAction Stop
  )
}
