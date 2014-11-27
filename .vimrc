" F1: set number
map [11~ :set number
" F2: set nonumber
map [12~ :set nonumber
" F3: check perl syntax
map [13~ :w:!perl -c %
" F5: execute current file
map [15~ :w:!./%
" F9: Paste toggle
set pastetoggle=[20~


syntax on	" Highlight syntax
colorscheme evening
filetype plugin indent on	" auto indent
set nocompatible	" use Vim defaults (much better!)
set bs=indent,eol,start	" allow backspacing over everything in insert mode
set ruler	" show the cursor position all the time
set hlsearch	 " highlight search patterns
set path=** 	" find files in subdirectories
set autoindent	" handy for email and programming
set remap	" hm. don't recall, but I know I like it.  ;-)
set report=1	" *always* show me changes that commands make
set shiftwidth=2	" i like minimal indentation. see tabstops (ts), too.
set showmode	" portable method to show the current mode on bottom line
set tabstop=2	" this should be the same as the next line. not always.
set ts=2	" only indent 2 spaces. see shiftwidth (sw) above.
set terse	" no news is good news.

" where to put temporary files. good for most systems
set directory=/tmp
"
" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" Have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
     \| exe "normal! g'\"" | endif
endif

if has("autocmd")
	" perl
	augroup perl
		au FileType perl setlocal equalprg=perltidy\ -bl\ -q\ -l=260\ -pt=2\ -sbt=2\ -bt=2\ -bbt=2\ -nsfs\ -nwls=\".\"\ -nwrs=\".\"\ -ole=unix\ -iob\ -et=4\ -i=2
	augroup END

	" xml
	augroup xml
		au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
	augroup END

	" puppet
	augroup puppet
		au FileType puppet setlocal equalprg=~/.dev/puppet-tidy
	augroup END

	" markdown
	augroup md
		autocmd FileType mkd setlocal tw=0
		autocmd FileType mkd setlocal nocursorline
	augroup END
endif

" load pathogen modules
execute pathogen#infect()


" inside screen / tmux
map <Esc>[C <C-Right>
map <Esc>[D <C-Left>
" insert mode
map! <Esc>[C <C-Right>
map! <Esc>[D <C-Left>
" no screen
map <Esc>[1;5D <C-Left>
map <Esc>[1;5C <C-Right>
" insert mode
map! <Esc>[1;5D <C-Left>
map! <Esc>[1;5C <C-Right>

nnoremap <C-t> :tabnew<CR>
nnoremap <C-q> :tabclose<CR>
nnoremap <C-right> :tabnext<CR>
nnoremap <C-left> :tabprevious<CR>
" insert mode
inoremap <C-t> <Esc>:tabnew<CR>
inoremap <C-q> <Esc>:tabclose<CR>
inoremap <C-right> <Esc>:tabnext<CR>
inoremap <C-left> <Esc>:tabprevious<CR>

