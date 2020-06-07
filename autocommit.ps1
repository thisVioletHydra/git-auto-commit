$gitLog = git log --stat --graph -1
$gitStatus = git status -s
$gitEmpty = "$gitStatus".Length


function Write-ColorizedMSG {
  param(
    [String]$str,
    [Parameter(Mandatory = $false)]
    [ValidateSet("INFO", "DONE", "WARN")]
    [string]$MSGtype = "INFO",
    [Parameter(Mandatory = $false)]
    [System.Object]$obj = $null
  )
  switch ($MSGtype) {
    'INFO' { $Color = "Cyan" }
    'DONE' { $Color = "Green" }
    'WARN' { $Color = "Yellow" }
    default {
      Write-Host "`r`nImpossible MSGType selected"
      $Color = "Magenta"
    }
  }
  Write-Host "`r`n[$(Get-Date)][$MSGtype]: $str" -ForegroundColor $Color
  $obj | Out-Host
}

function Push-GitAutoCommit {
  git commit -am "⭐️ Auto-Commit $(Get-Date)"
  git push
} 

Write-ColorizedMSG -str "🙄 Last Commit" -MSGtype 'INFO' -obj $gitLog
Write-ColorizedMSG -str "🤔 New Files" -MSGtype 'INFO' -obj $gitStatus

if ($gitEmpty -gt 0) {
  Write-ColorizedMSG -str "✈️ Uploading files" -MSGtype 'INFO'
  try {
    # $ErrorActionPrefference = 'Stop'
    Push-GitAutoCommit
    Write-ColorizedMSG -str "🟢 SUCCESS!" -MSGtype 'DONE'
  }
  catch {
    Write-ColorizedMSG "Shit happend : $_"
  }
}
else { 
  Clear-Host
  Write-ColorizedMSG -str "`r`n🔴 Nothing happened" -MSGtype 'WARN'
}
Exit