/title/ {
  for(i=2;i<=NF;++i)
    issueTitle=$i" ";
  
  touch "$issueTitle.md"
}