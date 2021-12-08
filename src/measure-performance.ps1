$TrialCount = 100
$TargetNamePrefix = "MidoApp_MeasurePerformance"
$Password = "abcdefghij"

. ./lib.ps1

try {
  echo "Measuring Time to Create $TrialCount New Credential"
  Measure-Command {
    for ($i=0; $i -lt $TrialCount; $i++) {
      $TargetName = "${TargetNamePrefix}_${i}"
      SaveGenericSessionCredential $TargetName $Password
    }
  }

  echo "Measuring Time to Get $TrialCount Credential"
  Measure-Command {
    for ($i=0; $i -lt $TrialCount; $i++) {
      $TargetName = "${TargetNamePrefix}_${i}"
      GetGenericCredential $TargetName
    }
  }

  echo "Measuring Time to Remove $TrialCount Credential"
  Measure-Command {
    for ($i=0; $i -lt $TrialCount; $i++) {
      $TargetName = "${TargetNamePrefix}_${i}"
      RemoveGenericCredential $TargetName
    }
  }
} catch {
  echo $error
}
