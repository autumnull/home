function binadd -d "install a binary in ~/bin or ~/usr/bin"
        if [ (count $argv) -ne 2 ]
                echo "usage: binadd <binary> <install folder (relative to homedir)>"
                return 1
        end
        set bin (realpath $argv[1])
        ln -s $bin ~/$argv[2]/(basename $bin)
end
