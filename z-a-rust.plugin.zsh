# Copyright (c) 2019 Sebastian Gniazdowski
# Copyright (c) 2021 Z-Shell ZI Contributors
#
# According to the Zsh Plugin Standard:
# http://zdharma.org/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html

0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

autoload .za-rust-bin-or-src-function-body \
    →za-rust-atload-handler →za-rust-atclone-handler \
    →za-rust-atpull-handler →za-rust-help-handler \
    →za-rust-atdelete-handler

# An empty stub to fill the help handler fields
→za-rust-help-null-handler() { :; }

@zi-register-annex "z-a-rust" \
    hook:atload-40 \
    →za-rust-atload-handler \
    →za-rust-help-handler \
    "rustup|cargo''" # also register new ices

@zi-register-annex "z-a-rust" \
    hook:atclone-40 \
    →za-rust-atclone-handler \
    →za-rust-help-null-handler

@zi-register-annex "z-a-rust" \
    hook:\%atpull-40 \
    →za-rust-atclone-handler \
    →za-rust-help-null-handler

@zi-register-annex "z-a-rust" \
    hook:atdelete-40 \
    →za-rust-atdelete-handler \
    →za-rust-help-null-handler

