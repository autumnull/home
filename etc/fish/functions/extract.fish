# # extract - archive extractor
# # usage: extract <file>
function extract -d "archive extractor";
    if [ (count $argv) = 0 ]
        echo "usage: extract <file>"
    else if ! [ -f $argv[1] ]
        echo "'$argv[1]' is not a file"
    else
        switch $argv[1]
        case '*.tar.bz2'
            tar -xjvf $argv[1]
        case '*.tar.gz'
            tar -xzvf $argv[1]
        case '*.tar.xz'
            tar -xJvf $argv[1]
        case '*.tar.zst'
            tar --use-compress-program zstd -xvf $argv[1]
        case '*.bz2'
            bunzip2 $argv[1]
        case '*.rar'
            unrar -x $argv[1]
        case '*.gz'
            gunzip $argv[1]
        case '*.tar'
            tar -xvf $argv[1]
        case '*.tbz2'
            tar -xjvf $argv[1]
        case '*.tgz'
            tar -xzvf $argv[1]
        case '*.zip'
            unzip $argv[1]
        case '*.epub'
            unzip $argv[1]
        case '*.Z'
            uncompress $argv[1]
        case '*.7z'
            7z x $argv[1]
        case '*'
            echo "'$argv[1]' cannot be extracted via extract()"
        end
    end
end
