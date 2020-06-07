$br = "";

Clear-Host
Clear-History

"=====  Last Commit  =====  "
git log --stat --graph -1 
$br

"=====  New Files  ====="  
$state = git status -s 
$br



if ($state.Length) {
  "=====  Start Upload  ====="  
  git commit -am ' Auto-Commit' 
  git push 
  $br

  "=====  SUCCESS!  ====="  
  $br
  "debug: $state" 
  Read-Host "Press any key to continue ... "
  Exit 
}
else { 
  Clear-Host 
  "=====  Nothing happened  =====" 
  "=====  Upload is Aborted!  =====" 
};


"debug: $state" 
Read-Host "Press any key to continue ... "
Exit