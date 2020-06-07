# Set-StrictMode ON
Set-StrictMode -Version Latest
Clear-Host;

try {
  $br = "";
  $time = Get-Date;
  $gitLog = git log --stat --graph -1;
  $gitStatus = git status -s;
  $gitEmpty = "$gitStatus".Length ?? 0;

  function _info([String]$str, [System.Object]$obj = $null) {
    Write-Host "[$time] [INFO]:" $str -ForegroundColor Cyan; $obj; $br;
  } 
  
  function _done([String]$str) {
    Write-Host "[$time] [DONE]:" $str -ForegroundColor Green; $br;
  } 
  
  function _warn( [String]$str ) {
    Clear-Host;
    Write-Host "[$time] [WARN]:" $str -ForegroundColor Yellow; $br;
  } 
  
  function _UPLOAD([String]$str) {
    Write-Host "[$time] [INFO]:" $str -ForegroundColor Cyan;
    git commit -am "⭐ Auto-Commit $time";
    git push; $br;
  } 
  
  _info "🙄 Last Commit" $gitLog   
  _info "🤔 New Files" $gitStatus 

  if ($gitEmpty -gt 0) { _UPLOAD "✈️ Uploading files"; _done("🟢 SUCCESS!"); }
  else { _warn("🔴 Nothing happened"); };
  Exit;
}
catch {
  Write-Warning $_
  Read-Host "Press any key to continue ...";
  Exit;
}