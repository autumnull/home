# # colors - ANSI 256-color gallery
# # usage: colors
function colors -d "ANSI 256-color gallery";
    printf '\033[4mANSI 256-color mode\033[0m\n'
    echo "foreground: \033[38;5;<n>m"
    echo "background: \033[48;5;<n>m"
    printf '\033[0m\n'
    
    echo 'Standard colors'
    for n in (seq 0 7);
        printf '\033[38;5;%dm%3s ' $n $n;
    end
    printf '\033[0m\n\n'
    
    echo 'High-intensity colors'
    for n in (seq 8 15);
        printf '\033[38;5;%dm%3s ' $n $n;
    end
    printf '\033[0m\n\n'

    echo '216 colors'
    for r in (seq 0 5);
        for g in (seq 0 5);
            for b in (seq 0 5);
                set n (math 16 + 36 x $r + 6 x $g + 1 x $b);
                printf '\033[38;5;%dm%3s ' $n $n;
            end
            printf '\033[0m\n'
        end
    end
    printf '\033[0m\n'

    echo 'Grayscale colors'
    for n in (seq 232 255);
        printf '\033[38;5;%dm%3s ' $n $n;
    end
    printf '\033[0m\n\n'
end
