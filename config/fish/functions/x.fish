# alias to extract files
function x
  if test -z $argv
    echo "Error: No file specified."
    return 1
  end
  if test -e $argv
    for f in $argv
      switch "$f"
        case '*.tar.bz2'
        tar xvjf $f
        case '*.tar.gz'
         tar xvzf $f
        case '*.bz2'
          bunzip2 $f
        case '*.rar'
          unrar x $f
        case '*.gz'
          gunzip $f
        case '*.tar'
          tar xvf $f
        case '*.tbz2'
          tar xvjf $f
        case '*.tgz'
          tar xvzf $f
        case '*.zip'
          unzip $f
        case '*.Z'
          uncompress $f
        case '*.7z'
          7z x $f
        case '*
          echo "'$f' cannot be extracted via extract"
      end
    end
  else
    echo "'$argv' is not a valid file"
  end
end
