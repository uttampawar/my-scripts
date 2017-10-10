parse_git_project() {
  git remote -v 2> /dev/null|grep origin |grep push|cut -d'/' -f5|cut -d'.' -f1 
}
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
detail_name() {
  p=`parse_git_project`
  b=`parse_git_branch`
  if [[ -n $p && -n $b ]]; then
    echo [$p:$b]
  fi  
}
export PS1="\n->\u\[\033[31m\]\w\n\$(detail_name)\[\033[00m\]$ "
