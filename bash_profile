# set default architecture on 10.8 to 64bit
export ARCHFLAGS="-arch x86_64"

# homebrew paths
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/usr/local/share/python:$PATH

# rbenv settings
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Pythons virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh

# load a possible bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

# added by Miniconda3 3.6.0 installer
export PATH="/Users/tbass/miniconda3/bin:$PATH"
