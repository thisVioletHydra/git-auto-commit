$br = "";

Clear-Host
Clear-History

"=====  Last Commit  =====  "
git log --stat --graph -1 
$br

"=====  New Files  ====="  
$state = git status -s 
$br

"=====  Start Upload  ====="  
git commit -am ' Auto-Commit' 
git push 
$br

"=====  SUCCESS!  ====="  
$br

"Press any key to continue ... "
Pause 
if ($state) { Exit } else { Clear-Host };
"=====  Nothing happened  =====" 
"=====  Upload is Aborted!  =====" 
 
Exit