# Set-StrictMode ON
Set-StrictMode -Version Latest
Clear-Host;

try {
  $br = "";
  $time = Get-Date;
  $gitStatus = git status -s;
  $emptyGit = $gitStatus.Length;
#   param (
#     [ValidateLength(1,10)]
#     [parameter(Mandatory=$true)]
#     [string]
#     $emptyGit
# )
  $gitLog = git log --stat --graph -1;
  
 
  # if ($emptyGit) {
  #   $length = ($gitStatus).Length
  #   "sum" + $length
  #   $gitStatus.GetType()
  #   "''.Length " + ''.Length
  #   "($null).Length " + ($null).Length
  #   "'$Null'.Length " + '$Null'.Length
  #   "----------------";
  #   "Debug: $emptyGit";
  #   "----------------"; $br
  #   throw 'The file does not exist'
  # }
  
 
  
  
  function _info([String]$str, [String]$str2 = $null) {
    Write-Host "[$time] [INFO]:" $str -ForegroundColor Cyan; $str2; $br;
  } 
  
  function _done([String]$str) {
    Write-Host "[$time] [DONE]:" $str -ForegroundColor Green;
  } 
  
  function _warn( [String]$str ) {
    # Clear-Host;
    Write-Host "[$time] [WARN]:" $str -ForegroundColor Yellow;
  } 
  
  _info "🙄 Last Commit" $gitLog   
  _info "🤔 New Files" $gitStatus 
  _info "debug " $emptyGit
  
  # $emptyGit -or $null
  if ($emptyGit -or $false) {
    _info "✈️ Uploading files"; git commit -am "⭐ Auto-Commit $time"; git push; $br;
    _done("🟢 SUCCESS!"); $br;
  }
  else { 
    _warn("🔴 Nothing happened"); $br;
  };
  
  #"debug: $state" 
  Read-Host "Press any key to continue ...";
  Exit;
}
catch {
  # _warn("🔴 error"); $br;
  Write-Warning $_
}