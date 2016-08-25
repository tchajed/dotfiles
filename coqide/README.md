For OS X:

- Download Coq from <https://coq.inria.fr/distrib/V8.5beta2/files/CoqIDE_8.5beta2.dmg> and copy to /Applications
- Add [coqide](../bin/coqide) (a simple shell script that launches the app) to a directory on your path
- Put [coqide.keys](./coqide.keys) in "~/Library/Application Support/coq/"

    Note that if you update this file while CoqIDE is running it will overwrite it with the old configuration, so make sure to update when CoqIDE is not running.

    This keymap changes many shortcuts to more common OS X defaults (eg, <kbd>⌘</kbd><kbd>{</kbd> and <kbd>⌘</kbd><kbd>}</kbd> to navigate tabs, <kbd>⌘</kbd><kbd>,</kbd> for preferences). It also makes some common Coq shortcuts more convenient. Some examples include:
    * <kbd>F1</kbd>: toggle (including re-focusing) the query pane
    * <kbd>F2</kbd>: previous
    * <kbd>F3</kbd>: next
    * <kbd>F4</kbd>: go to
    * <kbd>⌘</kbd>-<kbd>home</kbd> (<kbd>⌘</kbd>-<kbd>fn</kbd>-<kbd>left</kbd> on a laptop): restart Coq
    * <kbd>⌘</kbd>-<kbd>end</kbd> (<kbd>⌘</kbd>-<kbd>fn</kbd>-<kbd>right</kbd> on a laptop): evaluate to end
    * <kbd>⌘</kbd>-<kbd>period</kbd> to interrupt Coq

    If you have suggestions for other keybindings to improve, let me know.
