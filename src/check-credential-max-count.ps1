$TargetNamePrefix = "MidoApp_Powershell_Sample"
$Password = "password"
$CreateCredCount = 1115
$SuccessfullyCreatedCount = 0

. ./lib.ps1

try {
  for ($i=0; $i -lt $CreateCredCount; $i++) {
    echo "Creating ${i}th Generic Credential to Windows Credential Manager"
    $TargetName = "${TargetNamePrefix}_${i}"
    echo $TargetName
    SaveGenericSessionCredential $TargetName $Password
    $SuccessfullyCreatedCount = $SuccessfullyCreatedCount + 1
  }
} catch {
  echo $error
}

try {
  for ($i=0; $i -lt $SuccessfullyCreatedCount; $i++) {
    echo "Removing ${i}th Generic Credential from Windows Credential Manager"
    $TargetName = "${TargetNamePrefix}_${i}"
    RemoveGenericCredential $TargetName
  }
} catch {
  echo $error
}
