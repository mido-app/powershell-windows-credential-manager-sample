$TargetName = "MidoApp_MaxLength_Test"
$MaxLength = 1000
$ItemRemaining = $False

. ./lib.ps1

function CreatePasswordWithLength($Length) {
  $Password = ""
  for ($i=0; i -lt $Length; $i++) {
    $Password = $Password + "a"
  }
  return $Password
}

try {
  for($i=1; i -le $MaxLength; $i++) {
    echo "Creating Generic Credential with Password Length ${i} to Windows Credential Manager"
    $ItemRemaining = $True
    $Password = CreatePasswordWithLength $i
    SaveGenericSessionCredential $TargetName $Password
    echo "Removing Generic Credential with Password Length ${i} from Windows Credential Manager"
    RemoveGenericCredential $TargetName
    $ItemRemaining = $False
  }      
} catch {
  echo $error
} finally {
  if ($ItemRemaining) {
    RemoveGenericCredential $TargetName
  }
}

