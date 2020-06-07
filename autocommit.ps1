$br = "";

Clear-Host
Clear-History

"=====  Last Commit  =====  "
$log = git log --stat --graph -1 
$br

"=====  New Files  ====="  
git status -s 
$br

"=====  Start Upload  ====="  
git commit -am ' Auto-Commit' 
git push 
$br

"=====  SUCCESS!  ====="  
$br

"Press any key to continue ... "
Pause 
if ($log) { Exit } else { Clear-Host };
"=====  Nothing happened  =====" 
"=====  Upload is Aborted!  =====" 
 
Exit