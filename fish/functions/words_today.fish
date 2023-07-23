# Defined interactively
function words_today
set -l file $argv[1]
set -l ext (string split -m1 -r '.' $file)[-1]
set -l fmt ""
if test $ext = "tex"
  set fmt latex
else
  set fmt markdown
end
set -l old (git show 'HEAD@{1.day.ago}':./$file | pandoc -f $fmt -t markdown | wc -w)
set -l new (pandoc -f $fmt -t markdown $argv[1] | wc -w)
set -l diff (math $new - $old)
echo $diff = (string trim $new) - (string trim $old)
end
