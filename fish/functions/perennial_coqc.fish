function perennial_coqc
coqc -Q src Perennial -w -ssr-search-moved -w +deprecated-instance-without-locality -w +ambiguous-paths -w +deprecated-hint-rewrite-without-locality -w -deprecated-field-instance-without-locality -w +deprecated-tactic-notation -w -deprecated-since-8.19 -w -deprecated-since-8.20 -w -deprecated-from-Coq -w -deprecated-dirpath-Coq -w -notation-incompatible-prefix -w -deprecated-typeclasses-transparency-without-locality -w -notation-overridden,-redundant-canonical-projection,-unknown-warning,-argument-scope-delimiter -Q external/stdpp/stdpp stdpp -Q external/stdpp/stdpp_unstable stdpp.unstable -Q external/stdpp/stdpp_bitvector stdpp.bitvector -Q external/iris/iris iris -Q external/iris/iris_deprecated iris.deprecated -Q external/iris/iris_unstable iris.unstable -Q external/iris/iris_heap_lang iris.heap_lang -Q external/coqutil/src/coqutil coqutil -Q external/Goose Goose -Q external/record-update/src RecordUpdate -Q external/coq-tactical/src Tactical -Q external/iris-named-props/src iris_named_props -Q new_trusted_code New.code -Q new_code_axioms New.code -Q new_partial_axioms New.code_axioms -Q new New  -set "Printing Width=1000" $argv
end
