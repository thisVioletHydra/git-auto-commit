$br = "";
$time = Get-Date

Clear-Host
Clear-History

"=====  Last Commit  =====  "
git log --stat --graph -1 
$br

"=====  New Files  ====="  
$state = git status -s 
$state
$br

if ($state.Length) {
  "=====  Start Upload  ====="  
  git commit -am "⭐ Auto-Commit $time" 
  git push 
  $br

  "=====  SUCCESS!  ====="  
  $br
}
else { 
  Clear-Host 
  "=====  Nothing happened  =====" 
  "=====  Upload is Aborted!  =====" 
};


# "debug: $state" 
Read-Host "Press any key to continue ... "
Exit