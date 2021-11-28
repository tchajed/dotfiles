# only offer PDFs as completions
complete -c skim --exclusive --keep-order -a "(
	__fish_complete_suffix .pdf
)
"
