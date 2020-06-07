$br = ""
$time = Get-Date
$gitStatus = git status -s 
$emptyGit = $gitStatus.Length
$gitLog = git log --stat --graph -1 

function _info {
  param ( [string]$str )
  Write-Host "[$time] [INFO]:" $str -ForegroundColor Cyan
} 
function _done {
  param ( [string]$str )
  Write-Host "[$time] [DONE]:" $str -ForegroundColor Green
} 
function _warn {
  param ( [string]$str )
  Write-Host "[$time] [WARN]:" $str -ForegroundColor DarkYellow
} 

Clear-Host

_info("🙄 Last Commit") $gitLog $br
_info("🤔 New Files")
$gitStatus
$br

if ($emptyGit) {
  _info("✈️ Uploading files")
  git commit -am"⭐ Auto-Commit $time" 
  git push 
  $br

  _done("🟢 SUCCESS!")
  $br
}
else { 
  Clear-Host 
  _warn("🔴 Nothing happened")
  $br
};


#"debug: $state" 
Read-Host "Press any key to continue ..."
Exit