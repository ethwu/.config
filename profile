#! /bin/sh
source_if_exists() { [ -f "$1" ] && . "$@" ; }
source_if_exists "$HOME/.profile.env"

# Set up the XDG Base Directories.
export XDG_BIN_HOME="${XDG_BIN_HOME:="$HOME"/.local/bin}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:="$HOME"/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:="$HOME"/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:="$HOME"/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:="$HOME"/.local/state}"
export XDG_DATA_DIRS="${XDG_DATA_DIRS:=/usr/local/share:/usr/share}"
export XDG_CONFIG_DIRS="${XDG_CONFIG_DIRS:=/etc/xdg}"
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:="$HOME"/.local/run/user/"$UID"}"
export LOCAL_PREFIX="$HOME/.local"
export PATH="$LOCAL_PREFIX/bin:$HOME/bin:/opt/local/bin:$PATH"

# C
export C_INCLUDE_PATH="$LOCAL_PREFIX"/include		# -I
export CPLUS_INCLUDE_PATH="$LOCAL_PREFIX"/include	# -I
export LIBRARY_PATH="$LOCAL_PREFIX"/lib			# -L
export PKG_CONFIG_PATH="$LOCAL_PREFIX"/lib/pkgconfig

# Docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME"/docker/machine

# fzf
export FZF_DEFAULT_OPTS="
--ansi
--color='fg+:italic:-1,bg+:-1,hl:5,hl+:italic:5,gutter:-1'
--color='info:3,prompt:4,pointer:5,marker:5,query:5,disabled:5,spinner:13'
--bind ctrl-f:page-down,ctrl-b:page-up"

# Go
export GOPATH="$XDG_DATA_HOME"/go
export PATH="$GOPATH"/bin:"$PATH"

# Java: jenv
export JENV_ROOT="$XDG_DATA_HOME/jenv"

# GNU ls
# generated by `dircolors ~/.config/dir_colors`
export LS_COLORS='rs=00:no=00:fi=00:di=34;01:ow=35;01;04:st=34;01;01:tw=35;01;04;03:ex=32:sg=31;01;03:su=31;01;04:ca=32;03:ln=36;03:mh=36:or=36;07:mi=31;07:pi=32;07:so=33;07:bd=34;07:cd=35;07:do=07:*.tar=34:*.7z=03:*.ace=03:*.alz=03:*.arc=03:*.arj=03:*.bz=03:*.bz2=03:*.cab=03:*.cbio=03:*.dz=03:*.ear=03:*.gz=03:*.jar=03:*.lha=03:*.lrz=03:*.lz=03:*.lz4=03:*.lzh=03:*.lzma=03:*.rar=03:*.war=03:*.xz=03:*.z=03:*.Z=03:*.zip=03:*.zoo=03:*.zst=03:*.tar.7z=34;03:*.tar.bz=34;03:*.tar.bz2=34;03:*.tar.gz=34;03:*.tar.lz=34;03:*.tar.lz4=34;03:*.tar.lzh=34;03:*.tar.lzma=34;03:*.tar.rar=34;03:*.tar.xz=34;03:*.tar.z=34;03:*.tar.zo=34;03:*.tar.zst=34;03:*.taz=34;03:*.tbz=34;03:*.tbz2=34;03:*.tgz=34;03:*.tlz=34;03:*.txz=34;03:*.tz=34;03:*.tzo=34;03:*.tzst=34;03:*.deb=32;04:*.rpm=32;04:*.app=32;03:*.bat=32;03:*.btm=32;03:*.cmd=32;03:*.com=32;03:*.exe=32;03:*.reg=32;03:*~=02:*.bak=02:*.BAK=02:*.DS_Store=02:*.diff=02:*.log=02:*.LOG=02:*.old=02:*.OLD=02:*.orig=02:*.ORIG=02:*.swo=02:*.swp=02:*.aac=33;03:*.au=33;03:*.axa=33;03:*.flac=33;03:*.m4a=33;03:*.mid=33;03:*.midi=33;03:*.mka=33;03:*.mp3=33;03:*.mpc=33;03:*.oga=33;03:*.ogg=33;03:*.ra=33;03:*.spx=33;03:*.xpsf=33;03:*.wav=33;03:*.anx=33;03;04:*.asf=33;03;04:*.avi=33;03;04:*.axv=33;03;04:*.flc=33;03;04:*.fli=33;03;04:*.flv=33;03;04:*.gl=33;03;04:*.m2v=33;03;04:*.m4v=33;03;04:*.mkv=33;03;04:*.mov=33;03;04:*.MOV=33;03;04:*.mp4=33;03;04:*.mp4v=33;03;04:*.mpeg=33;03;04:*.mpg=33;03;04:*.nuv=33;03;04:*.ogm=33;03;04:*.ogv=33;03;04:*.ogx=33;03;04:*.qt=33;03;04:*.rm=33;03;04:*.rmvb=33;03;04:*.swf=33;03;04:*.vob=33;03;04:*.webm=33;03;04:*.wmv=33;03;04:*.ai=33;04:*.bmp=33;04:*.cgm=33;04:*.dl=33;04:*.dvi=33;04:*.emf=33;04:*.eps=33;04:*.gif=33;04:*.jpeg=33;04:*.jpg=33;04:*.JPG=33;04:*.mng=33;04:*.pbm=33;04:*.pcx=33;04:*.pgm=33;04:*.png=33;04:*.PNG=33;04:*.ppm=33;04:*.pps=33;04:*.ppsx=33;04:*.ps=33;04:*.psd=33;04:*.svg=33;04:*.svgz=33;04:*.tga=33;04:*.tif=33;04:*.tiff=33;04:*.xbm=33;04:*.xcf=33;04:*.xpm=33;04:*.xwd=33;04:*.yuv=33;04:*.doc=33:*.docx=33:*.dot=33:*.odg=33:*.odp=33:*.ods=33:*.odt=33:*.otg=33:*.otp=33:*.ots=33:*.ott=33:*.pdf=33:*.ppt=33:*.pptx=33:*.xls=33:*.xlsx=33:*.c=31:*.C=31:*.cc=31:*.cpp=31:*.css=31:*.cxx=31:*.el=31:*.go=31:*.h=31:*.hpp=31:*.hs=31:*.htm=31:*.html=31:*.java=31:*.js=31:*.l=31:*.man=31:*.mkd=31:*.n=31:*.objc=31:*.p=31:*.php=31:*.pl=31:*.pm=31:*.pod=31:*.py=31:*.rb=31:*.rdf=31:*.rkt=31:*.rs=31:*.shtml=31:*.ts=31:*.tex=31:*.vim=31:*__init__.py=31;02:*mod.rs=31;02:*.bash=31;03:*.csh=31;03:*.nu=31;03:*.sh=31;03:*.zsh=31;03:*.a=02:*.o=02:*.pyc=02:*.md=35:*.org=35:*.rst=35:*.rtf=35:*.txt=35:*.csv=35;02:*.json=35;02:*.tsv=35;02:*.xml=35;02:*.log=02:*.cfg=35;03:*.conf=35;03:*.config=35;03:*.ini=35;03:*.properties=35;03:*.toml=35;03:*.yaml=35;03:*.yml=35;03:*configure=33;03:*Dockerfile=33;03:*install=33;03:*Jenkinsfile=33;03:*.just=33;03:*justfile=33;03:*Makefile=33;03:*.mk=33;03:*build.xml=33:*Cargo.toml=33:*CMakeLists.txt=33:*compose.yaml=33:*compose.yml=33:*MANIFEST.in=33:*mise.toml=33:*mise.*.toml=33:*log4j.xml=33:*lombok.config=33:*package.json=33:*pom.xml=33:*pyproject.toml=33:*requirements.txt=33:*requirements-dev.txt=33:*requirements-build.txt=33:*requirements-*.txt=33:*settings.xml=33:*setup.cfg=33:*setup.py=33:*whitesource.config=33:*.git=33;01;02:*venv=33;01;02:*virtualenv=33;01;02:*.egg-info=02:*.lock=02:*node_modules=02:*__pycache__=02:*ignore=33;02:*.gitignore=33;02:*.env=33;03:*.envrc=33;03:*CODEOWNERS=35;01:*LICENSE=35;02:*README=35;01:*README.txt=35;01:*README.md=35;01:*README.rst=35;01:*bash_profile=33;02:*bashrc=33;02:*.profile=33;02:*rc=33;02:*zprofile=33;02:*zshenv=33;02:*zshrc=33;02:'

# Node.js
export NODE_REPL_HISTORY="$XDG_STATE_HOME"/nodejs/node_repl_history
# NVM
export NVM_DIR="$XDG_DATA_HOME"/nvm

# Perl
export PERL5LIB="$LOCAL_PREFIX"/lib/perl5
export PERL_LOCAL_LIB_ROOT="$LOCAL_PREFIX"
export PERL_MB_OPT="--install_base \"$LOCAL_PREFIX\""
export PERL_MM_OPT="INSTALL_BASE=\"$LOCAL_PREFIX\""

# Python
export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/startup.py
# Python: Rye
export RYE_HOME="$XDG_DATA_HOME"/rye
export PATH="$RYE_HOME"/shims:"$PATH"

# Racket
export PLTCONFIGHOME="$XDG_CONFIG_HOME"/racket
export PLTUSERHOME="$XDG_DATA_HOME"/racket

# GNU readline
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc

# Ruby: RubyGems
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
export PATH="$GEM_HOME"/bin:"$PATH"

# Rust: Cargo
export CARGO_HOME="$XDG_DATA_HOME"/cargo
source_if_exists "$CARGO_HOME"/env
export PATH="$CARGO_HOME"/bin:"$PATH"
# Rust: Rustup
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

# SQLite
export SQLITE_HISTORY="$XDG_STATE_HOME"/sqlite/history

# wget
export WGETRC="$XDG_CONFIG_HOME"/wget/wgetrc
alias wget='wget --hsts-file="$XDG_STATE_HOME"/wget-hsts'

# Wine
export WINEPREFIX="$XDG_DATA_HOME"/wine

# source "$XDG_CONFIG_HOME"/nushell/env.toml

if [ -n "$BASH_VERSION" ] ; then
    [ -f "$HOME"/.bashrc ] && . "$HOME"/.bashrc
    [ -f "$XDG_CONFIG_HOME"/bash/bashrc ] && . "$XDG_CONFIG_HOME"/bash/bashrc
fi

source_if_exists "$HOME"/.local.profile
