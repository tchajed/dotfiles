function gh-latest-run
    argparse 'w/workflow=' -- $argv
    or return

    set -l workflow_arg
    if set -q _flag_workflow
        set workflow_arg --workflow $_flag_workflow
    end

    gh run watch (gh run list --limit 1 $workflow_arg --json databaseId --jq '.[] | .databaseId')
end
