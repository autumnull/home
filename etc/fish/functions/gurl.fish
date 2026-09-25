function gurl -d "curl for gemini protocol";
    argparse -n gurl 'h/help' 'v/verbose' -- $argv
    or return
    set usage_text "usage: gurl [-h/--help] [-v/--verbose] <url>"
    set help_text $usage_text
    if [ $_flag_help ]
        echo $help_text; return
    end

    if [ (count $argv) = 0 ]
        echo $usage_text; return
    end
    
    set -l url $argv[1]
    if not string match --quiet --ignore-case 'gemini://*' -- "$url"
        set url "gemini://$url"
    end
    set url (string replace --regex '#.*$' '' -- "$url")
    set -l address (string match --regex --ignore-case --groups-only '^gemini://((?:\[[0-9a-f:.]+\]|[^/?#:@[:space:]]+)(?::[0-9]+)?)(?:[/?]|$)' -- "$url")
    if not set --query address[1]
        printf 'gurl: invalid Gemini URL\n' >&2
        return 2
    end
    if not string match --quiet --regex ':[0-9]+$' -- "$address"
        set address "$address:1965"
    end
    printf '%s\r\n' "$url" | openssl s_client -connect "$address" -quiet 2> /dev/null
end
