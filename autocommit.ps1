$br = ""
$time = Get-Date
$gitStatus = git status -s 
$emptyGit = $gitStatus.Length
$gitLog = git log --stat --graph -1 

Clear-Host

"=== 🙄 Last Commit ==="
$gitLog
$br

"=== 🤔 New Files ==="  
$gitStatus
$br

if ($emptyGit) {
  "=== ✈️ Uploading files ==="  
  git commit -am "⭐ Auto-Commit $time" 
  git push 
  $br

  "=== 🟢 SUCCESS! ==="  
  $br
}
else { 
  Clear-Host 
  "=== 🔴 Nothing happened ===" 
  "=== Upload is Aborted! ===" 
  $br
};


# "debug: $state" 
Read-Host "Press any key to continue ... "
Exit