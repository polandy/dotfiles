set -g fish_prompt_pwd_dir_length 0
set -g fish_color_user yellow
set -g fish_color_cwd \#00ffff
set -g fish_color_command \#ffff87
set -g fish_color_autosuggestion \#949494

set -g __fish_git_prompt_show_informative_status 1

set -g __fish_git_prompt_showuntrackedfiles 1
set -g __fish_git_prompt_color_branch magenta --bold
set -g __fish_git_prompt_showupstream "informative"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""

set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_dirtystate "✚"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_conflictedstate "✖"
set -g __fish_git_prompt_char_cleanstate "✔"

set -g __fish_git_prompt_color_dirtystate \#afff5f
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -g __fish_git_prompt_color_cleanstate green --bold


function fish_prompt --description 'Write out the prompt'

  set -l last_status $status

  if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
  end

  # USER
  set_color $fish_color_user
  printf "$USER "
  set_color normal

  # PWD
  set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)

  if not test $last_status -eq 0
    set_color -o $fish_color_error
  else
    set_color -o \#00ff00
  end

  # printf '\u25B6 '
  printf '$ '

  set_color normal
end

# Override prompt_pwd
function prompt_pwd --description 'Print the current working directory, NOT shortened to fit the prompt'
  if test "$PWD" != "$HOME"
        printf "%s" (echo $PWD|sed -e 's|/private||' -e "s|^$HOME|~|")
    else
        echo '~'
    end
end
