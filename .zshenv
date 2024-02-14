# Always sourced, read every time

export PATH=$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH

# Go -- All under ~/go
export GOPATH=$HOME/go             # default
export GOBIN=$GOPATH/bin           # default      'go install' installs here
export GOMODCACHE=$GOBIN/pkg/mod   # default      'go get' cache
# Not set explicitly yet: GOTOOLDIR, GOROOT

export MASONPATH=$HOME/.local/share/nvim/mason

#export TERM=xterm-kitty
export EDITOR=nvim

# nvm - node version manager
export NVM_DIR="$HOME/.nvm"
