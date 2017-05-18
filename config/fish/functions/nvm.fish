# nvm fish wrapper
# uses https://github.com/edc/bass
function nvm
  bass source /usr/share/nvm/init-nvm.sh ';' nvm $argv
end
