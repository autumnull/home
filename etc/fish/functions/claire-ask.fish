function claire-ask
    if test (count $argv) -lt 2
        echo 'Usage: claire-ask MESSAGE OPTION [OPTION [OPTION]]' >&2
        return 2
    end
    
    if test (count $argv) -gt 4
        echo 'macOS dialogs support at most three options' >&2
        return 2
    end

    set -l message $argv[1]
    set -l buttons $argv[2..-1]
    set -l default_button $buttons[1]
    
    set -l apple_script '
  on run argv
      set messageText to item 1 of argv
      set chosenDefault to item 2 of argv
      set buttonLabels to items 3 thru -1 of argv

      try
          set dialogResult to display dialog messageText buttons buttonLabels default button chosenDefault with title "Message"
          return button returned of dialogResult
      on error number -128
          return "CANCELLED"
      end try
  end run
  '
    
    set -l quoted_args
    for value in "$message" "$default_button" $buttons
        set -a quoted_args (string escape -- "$value")
    end
    
    set -l remote_command (string join ' ' -- osascript - $quoted_args)
    printf '%s\n' "$apple_script" | ssh "$CLAIRE_SSH" "$remote_command"
end
