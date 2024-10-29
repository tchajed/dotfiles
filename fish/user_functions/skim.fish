# only offer PDFs as completions
function skim -a file
  open -a Skim.app $file
end

complete -c skim --exclusive --keep-order -a "(
	__fish_complete_suffix .pdf
)
"
