# only offer PDFs as completions
complete -c skim -x -a "(
	__fish_complete_suffix .pdf
)
"
