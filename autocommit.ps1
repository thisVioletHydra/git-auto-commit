$br = "";
$time = Get-Date;
$gitStatus = git status -s;
$emptyGit = $gitStatus.Length;
$gitLog = git log --stat --graph -1;

Clear-Host;

function _info {
  param( [String]$str, [string[]]$Obj )
  Write-Host "[$time] [INFO]:" $str -ForegroundColor Cyan;
  $Obj;
  $br;
} 
function _done {
  param( [String]$str )
  Write-Host "[$time] [DONE]:" $str -ForegroundColor Green;
} 
function _warn {
  param( [String]$str )
  Clear-Host;
  Write-Host "[$time] [WARN]:" $str -ForegroundColor Yellow;
} 

_info("🙄 Last Commit", $gitLog);  
_info("🤔 New Files", $gitStatus);

if ($emptyGit) {
  _info("✈️ Uploading files"); git commit -am "⭐ Auto-Commit $time"; git push; $br;
  _done("🟢 SUCCESS!"); $br;
}
else { 
  _warn("🔴 Nothing happened"); $br;
};

#"debug: $state" 
Read-Host "Press any key to continue ...";
Exit;