# appends /usr/local/lib/ to the PATH env var
export PATH=$PATH:/usr/local/lib

# separates config (.bashrc) from aliases (.custom_aliases)
# by sourcing the .custom_aliases file
if [ -f ~/.custom_aliases ]; then
	. ~/.custom_aliases
fi
