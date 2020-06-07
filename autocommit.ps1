# Set-StrictMode ON
Set-StrictMode -Version Latest

$br = "";
$time = Get-Date;
$gitStatus = git status -s;
$emptyGit = $gitStatus.Length;
$gitLog = git log --stat --graph -1;

Clear-Host;

function _info([String]$str, [String]$str2 = $null) {
  Write-Host "[$time] [INFO]:" $str -ForegroundColor Cyan; $str2; $br;
} 

function _done([String]$str) {
  Write-Host "[$time] [DONE]:" $str -ForegroundColor Green;
} 

function _warn( [String]$str ) {
  Clear-Host;
  Write-Host "[$time] [WARN]:" $str -ForegroundColor Yellow;
} 

_info "🙄 Last Commit" $gitLog   
_info "🤔 New Files" $gitStatus 

if ($emptyGit) {
  _info "✈️ Uploading files"; git commit -am "⭐ Auto-Commit $time"; git push; $br;
  _done("🟢 SUCCESS!"); $br;
}
else { 
  _warn("🔴 Nothing happened"); $br;
};

#"debug: $state" 
Read-Host "Press any key to continue ...";
Exit;