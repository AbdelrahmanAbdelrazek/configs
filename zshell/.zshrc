#
##  ███████╗███████╗██╗  ██╗██████╗  ██████╗
##  ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
##    ███╔╝ ███████╗███████║██████╔╝██║     
##   ███╔╝  ╚════██║██╔══██║██╔══██╗██║     
##  ███████╗███████║██║  ██║██║  ██║╚██████╗
##  ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
#
#------------------------------------------- zsh files--------------------------------------------------------
[[ ! -f ~/.zaliases ]] || source ~/.zaliases
[[ ! -f ~/.zwork ]] || source ~/.zwork

#------------------------------------------- tmux ------------------------------------------------------------
[[ ! -d ~/.tmux/plugins/tpm ]] && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && 1

#--------------------------------------- powerlevel10k -------------------------------------------------------
[[ ! -d ~/.powerlevel10k ]] && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
[[ ! -f ~/.powerlevel10k/powerlevel10k.zsh-theme ]] || source ~/.powerlevel10k/powerlevel10k.zsh-theme


#--------------------------------------------- zinit ---------------------------------------------------------
zinit_path='~/.zinit'
[[ ! -d ~/.zinit ]] && mkdir ~/.zinit && git clone https://github.com/zdharma/zinit.git ~/.zinit/bin && zinit self-update
[[ ! -f  ~/.zinit/bin/zinit.zsh ]] || source ~/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
zinit load zdharma/history-search-multi-word

# sharkdp/fd
zinit ice as"command" from"gh-r" mv"fd* -> fd" pick"fd/fd"
zinit light sharkdp/fd
alias find='fd'

# sharkdp/bat
zinit ice as"command" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zinit light sharkdp/bat
alias cat='bat'

# ogham/exa, replacement for ls
zinit ice wait"2" lucid from"gh-r" as"program" mv"exa* -> exa"
zinit light ogham/exa
alias ls='exa'

#fzf fuzzy finder
zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin

# Binary release in archive, from GitHub-releases page.
# After automatic unpacking it provides program "fzf".
[[ ! -d ~/.fzf ]] && git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
#-------------------------------------------------------------------------------------------------------------

# [[ ! -d ~/.zinit ]] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)" && zinit self-update

HISTFILE=~/.zhist
SAVEHIST=1000000000
HISTSIZE=1000000000
DIRSTACKSIZE=10

export LS_COLORS='no=0;38;15:rs=0:di=1;34:ln=01;35:mh=00:pi=40;33:so=1;38;211:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=30;42:st=37;44:ex=1;30;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=01;33:*.au=01;33:*.flac=01;33:*.mid=01;33:*.midi=01;33:*.mka=01;33:*.mp3=01;33:*.mpc=01;33:*.ogg=01;33:*.ra=01;33:*.wav=01;33:*.axa=01;33:*.oga=01;33:*.spx=01;33:*.xspf=01;33:*.doc=01;91:*.ppt=01;91:*.xls=01;91:*.docx=01;91:*.pptx=01;91:*.xlsx=01;91:*.odt=01;91:*.ods=01;91:*.odp=01;91:*.pdf=01;91:*.tex=01;91:*.md=01;91:*.C=00;33:*.h=00;33:*.txt=00;36:*.log=00;36:*.rdb=00;33:*.err=00;31:';

export EXA_COLORS='*.C=00;33:*.c=00;33:*.h=00;35:*.H=00;35:*:*.log=00;36:*.rdb=00;33:*.err=00;31;01:*.conf=00;36;:*.ini=00;36;';
export DISPLAY=:0
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh