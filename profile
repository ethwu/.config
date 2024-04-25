#! /bin/sh
source_if_exists() { [ -f "$1" ] && . "$@" ; }

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
export CPLUS_INCLUDE_PATh="$LOCAL_PREFIX"/include	# -I
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
alias wget='wget --hsts-file="$XDG_STATE_HOME"/wget-hsts"'

# Wine
export WINEPREFIX="$XDG_DATA_HOME"/wine

if [ -n "$BASH_VERSION" ] ; then
    [ -f "$HOME"/.bashrc ] && . "$HOME"/.bashrc
    [ -f "$XDG_CONFIG_HOME"/bash/bashrc ] && . "$XDG_CONFIG_HOME"/bash/bashrc
fi

