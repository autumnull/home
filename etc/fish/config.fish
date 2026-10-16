if status is-interactive
    abbr -a ocaml 'rlwrap ocaml'
    abbr -a bag 'rlwrap bag'
    abbr -a dc 'rlwrap dc'
    abbr -a ll 'ls -hAlF'
    abbr -a cp 'cp -r'
    abbr -a df 'df -Th'
    abbr -a free 'free -m'
    abbr -a gdb 'gdb -q'
    abbr -a rg 'rg --no-ignore'
    abbr -a fd 'fd --no-ignore'

    alias envp='env | sort'
    alias pathp='for i in $PATH; echo $i; end; true'
    alias cpick='grim -g (slurp -p) -t ppm - | od -t x1 -j 11 | awk \'{ print "#" $2 $3 $4; exit }\' | tee /dev/fd/2 | tr -d \n | waycopy'
    alias sapphothink='straws sappho | cowthink -f sappho -n'
    alias speak='while read -P "♪ " | festival --tts; true; end; true'
    alias entr='inotifywait -r'

    if test $TERM = linux
        set -x STARSHIP_CONFIG $XDG_CONFIG_HOME/starship/ascii.toml
    else
        set -x STARSHIP_CONFIG $XDG_CONFIG_HOME/starship/unicode.toml
    end
    set -x STARSHIP_CACHE $XDG_CACHE_HOME/starship
    starship init fish | source
end
