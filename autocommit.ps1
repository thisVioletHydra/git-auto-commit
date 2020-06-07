$br = ""
$time = Get-Date
$gitStatus = git status -s 
$emptyGit = $gitStatus.Length
$gitLog = git log --stat --graph -1 

Clear-Host

"[$time] 🙄 Last Commit"
$gitLog
$br

"[$time] 🤔 New Files"  
$gitStatus
$br

if ($emptyGit) {
  "[$time] ✈️ Uploading files"  
  git commit -am"⭐ Auto-Commit $time" 
  git push 
  $br

  "[$time] 🟢 SUCCESS!"  
  $br
}
else { 
  Clear-Host 
  "[$time] 🔴 Nothing happened" 
  "[$time] Upload is Aborted!" 
  $br
};


#"debug: $state" 
Read-Host "Press any key to continue ..."
Exit