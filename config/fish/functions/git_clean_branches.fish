function git_clean_branches
    set base_branch develop

    # work from our base branch
    git checkout $base_branch

    # remove local tracking branches where the remote branch is gone
    git fetch -p

    # find all local branches that have been merged into the base branch
    # and delete any without a corresponding remote branch
    set local
    for f in (git branch --merged $base_branch | grep -v "\(master\|$base_branch\|\*\)" | awk '/\s*\w*\s*/ {print $1}')
        set local $local $f
    end

    set remote
    for f in (git branch -r | xargs basename)
        set remote $remote $f
    end

    for f in $local
        echo $remote | grep --quiet "\s$f\s"
        if [ $status -gt 0 ]
            git branch -d $f
        end
    end
end
