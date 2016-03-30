function fish_user_key_bindings
  bind \ce accept-autosuggestion execute
  bind \cbackspace 'backward-kill-word'
  bind \cleft 'backward-word'
  bind \cright 'forward-word'
  bind \cc 'echo; commandline ""; commandline -f repaint'
end
