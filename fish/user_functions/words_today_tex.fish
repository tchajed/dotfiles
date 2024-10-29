# Defined interactively
function words_today_tex
set -l old (git show 'HEAD@{1.day.ago}':./$argv[1] | detex | wc -w)
set -l new (detex $argv[1] | wc -w)
math $new - $old
end
