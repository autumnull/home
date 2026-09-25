function codex --wraps codex
    set -l profile --profile home
    for arg in $argv
        switch $arg
            case -p --profile '--profile=*' '-p?*' agents login logout plugin app-server remote-control completion update doctor debug apply migrate-rollouts cloud exec-server features help
                set profile
                break
        end
    end
    command codex $profile $argv
end

alias ocaml='rlwrap ocaml'
alias bag='rlwrap bag'
alias dc='rlwrap dc'

alias ll='ls -hAlF' # human sizes, almost-all, long, filetype chars
alias cp="cp -r" # recursive
alias df='df -Th' # filesystem types, human-readable sizes
alias free='free -m' # show sizes in MB
alias gdb='gdb -q' # don't print version info
alias rg="rg --no-ignore" # don't pay attention to .gitignore
alias fd="fd --no-ignore" # don't pay attention to .gitignore
#alias make="make -j(nproc)" # use all cores for make

alias envp='env | sort'
alias pathp='for i in $PATH; echo $i; end; true'

alias cpick='grim -g (slurp -p) -t ppm - | od -t x1 -j 11 | awk \'{ print "#" $2 $3 $4; exit }\' | tee /dev/fd/2 | tr -d \n |  waycopy'
alias miniserve='miniserve -v -t "Kitty\'s interplanetary file transfer system" --hide-theme-selector'
alias sapphothink='straws sappho | cowthink -f sappho -n'
alias speak='while read -P "♪ " | festival --tts; true; end; true'
alias entr='inotifywait -r'

function fish_user_key_bindings
    bind \b backward-kill-path-component # ctrl-backspace
    bind \e\[3\;5~ kill-word # ctrl-delete
end

if status is-interactive
    if test $TERM = linux
        set -x STARSHIP_CONFIG $XDG_CONFIG_HOME/starship/ascii.toml
    else
        set -x STARSHIP_CONFIG $XDG_CONFIG_HOME/starship/unicode.toml
    end
    set -x STARSHIP_CACHE $XDG_CACHE_HOME/starship
    starship init fish | source
end
