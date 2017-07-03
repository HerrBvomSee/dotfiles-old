# set default architecture on 10.8 to 64bit
export ARCHFLAGS="-arch x86_64"

# homebrew paths
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/usr/local/share/python:$PATH

# load a possible bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

eval $(/usr/libexec/path_helper -s)

export PATH="$HOME/.cargo/bin:$PATH"
