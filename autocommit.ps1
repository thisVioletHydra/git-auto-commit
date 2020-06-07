$br = ""
$time = Get-Date
$gitStatus = git status -s 
$emptyGit = $gitStatus.Length
$gitLog = git log --stat --graph -1 

function info {
  param (
    [string]$info
  )
  Write-Host "[$time] [INFO]" $info -ForegroundColor DarkGreen
} 

Clear-Host

"[$time] [INFO] 🙄 Last Commit"
$gitLog
$br

"[$time] [INFO] 🤔 New Files"  
$gitStatus
$br

if ($emptyGit) {
  "[$time] [INFO] ✈️ Uploading files"  
  git commit -am"⭐ Auto-Commit $time" 
  git push 
  $br

  info("🟢 SUCCESS!")
  # Write-Host "[$time] [INFO] 🟢 SUCCESS!"  -ForegroundColor DarkGreen
  $br
}
else { 
  Clear-Host 
  "[$time] [WARN] 🔴 Nothing happened" 
  $br
};


#"debug: $state" 
Read-Host "Press any key to continue ..."
Exit