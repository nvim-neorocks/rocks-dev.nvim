format:
	stylua -v --verify lua/rocks-dev/ plugin/

check:
	luacheck lua/rocks-dev plugin/
