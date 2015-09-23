<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#orgheadline1">1. Overview</a></li>
<li><a href="#orgheadline11">2. Most Important Key Chords</a>
<ul>
<li><a href="#orgheadline2">2.1. When Things Go Wrong</a></li>
<li><a href="#orgheadline3">2.2. Meta-X</a></li>
<li><a href="#orgheadline4">2.3. Move Around in Text</a></li>
<li><a href="#orgheadline5">2.4. Mark, Copy, and Paste Text</a></li>
<li><a href="#orgheadline6">2.5. Open File into Buffers</a></li>
<li><a href="#orgheadline7">2.6. Switching Buffers (Open Files)</a></li>
<li><a href="#orgheadline8">2.7. Organizing Buffers into Frames and Windows</a></li>
<li><a href="#orgheadline9">2.8. Search and Replace</a></li>
<li><a href="#orgheadline10">2.9. Change Font Size</a></li>
</ul>
</li>
<li><a href="#orgheadline16">3. Advanced Text Editing</a>
<ul>
<li><a href="#orgheadline12">3.1. Rectangle Copy/Paste</a></li>
<li><a href="#orgheadline13">3.2. Keyboard Macros</a></li>
<li><a href="#orgheadline14">3.3. Run Shell Commands</a></li>
<li><a href="#orgheadline15">3.4. Multiple Cursors</a></li>
</ul>
</li>
<li><a href="#orgheadline19">4. Directory Listings (dired)</a>
<ul>
<li><a href="#orgheadline17">4.1. Give Me a Terminal, NOW!</a></li>
<li><a href="#orgheadline18">4.2. Tramp Mode</a></li>
</ul>
</li>
<li><a href="#orgheadline20">5. Customization</a></li>
<li><a href="#orgheadline21">6. Source code editing</a></li>
<li><a href="#orgheadline31">7. C/C++ Projects</a>
<ul>
<li><a href="#orgheadline22">7.1. Identifier Expansion</a></li>
<li><a href="#orgheadline23">7.2. Snippets</a></li>
<li><a href="#orgheadline24">7.3. Semantics Jumps</a></li>
<li><a href="#orgheadline25">7.4. Ede (Cedet) Projects</a></li>
<li><a href="#orgheadline26">7.5. Grep and Ag</a></li>
<li><a href="#orgheadline27">7.6. Bookmarks</a></li>
<li><a href="#orgheadline28">7.7. ecb - Emacs Code Browser</a></li>
<li><a href="#orgheadline29">7.8. <span class="todo nilTODO">TODO</span> Tag Browsing</a></li>
<li><a href="#orgheadline30">7.9. gdb inside emacs.</a></li>
</ul>
</li>
<li><a href="#orgheadline32">8. Magit - Git Magic!</a></li>
<li><a href="#orgheadline33">9. Editing LaTeX</a></li>
<li><a href="#orgheadline34">10. org-mode</a></li>
<li><a href="#orgheadline35">11. evil-mode</a></li>
</ul>
</div>
</div>


# Overview<a id="orgheadline1"></a>

This is a quick and dirty emacs tutorial. It does not feature the most flashy
features or goodies. Instead, it focuses on solid day-to-day efficiency
features. It is probably best to print out this tutorial, grab a version of
emacs, and start reading and trying out each command in this manual from top to
bottom.

Do not start using emacs with the default config. Clone this repository as
`.emacs.d` by running

`git clone https://github.com/bingmann/dot-emacs.git .emacs.d`

in your home directory. Then start emacs, which will download lots of additional
packages. If that fails, check that you have at least emacs 24.5 by running `emacs
--version`, and download a packaged tarball snapshot of the repository from

<https://github.com/bingmann/dot-emacs/releases/download/20150818/dot-emacs-snapshot-20150818.tar.bz2>

Emacs commands are **sequences of key strokes** also called **key chords**. You must
get every stroke right, otherwise a different command is called. Key modifiers
are are written as

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">`S-`</td>
<td class="org-left">for Shift and/or implicitly notated by a capital or symbol,</td>
</tr>


<tr>
<td class="org-left">`C-`</td>
<td class="org-left">for Control, and</td>
</tr>


<tr>
<td class="org-left">`M-`</td>
<td class="org-left">for Alt, called Meta in the emacs world.</td>
</tr>
</tbody>
</table>

I disable the menubar in emacs since it takes up screen space and distracts from
the text. But for learning emacs it is a **good idea to enable it**: edit
`.emacs.d/init.el`, find `(menu-bar-mode -1)`, and replace it with
`(menu-bar-mode 1)` to enable the menubar after the next restart.

emacs has an **invisible interface**; even with the menu bar, you get no buttons
to click on, and only the most necessary output about what it
happening. Interaction and status information is shown in the **mode line** and
the **mini-buffer** at the bottom.

# Most Important Key Chords<a id="orgheadline11"></a>

## When Things Go Wrong<a id="orgheadline2"></a>

These are maybe the **most important** key strokes: canceling when things go
wrong. If some command does not work as expected: press these and try again;
emacs may have been in some state you did not know about.

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">Cancel Command</td>
<td class="org-left">`C-g`</td>
</tr>


<tr>
<td class="org-left">Cancel Minibuffer</td>
<td class="org-left">`C-]` (try if `C-g` did not work)</td>
</tr>


<tr>
<td class="org-left">Undo typing</td>
<td class="org-left">`C-/` or `C-S-_` (underscore)</td>
</tr>
</tbody>
</table>

Some buffers can be closed with `q`, usually those which are interactive buffers
and not plain text editing ones.

## Meta-X<a id="orgheadline3"></a>

Nearly any Emacs command can be called using `M-x +` long function
description. All key chords are bindings to these long functions, and yes, you
can change the key bindings some day.

See this xkcd comic for on what `M-x` is for: <https://xkcd.com/378/>. Then try
`M-x butterfly`.

## Move Around in Text<a id="orgheadline4"></a>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">Move</td>
<td class="org-left">`arrow` keys, `PageUp/Down`, etc</td>
</tr>


<tr>
<td class="org-left">Typing</td>
<td class="org-left">`[keys]`, `Delete`, `Backspace`</td>
</tr>


<tr>
<td class="org-left">Move Faster (jump words)</td>
<td class="org-left">`C-arrows`</td>
</tr>


<tr>
<td class="org-left">Beginning and End</td>
<td class="org-left">`C-Home` / `C-End`</td>
</tr>


<tr>
<td class="org-left">Move Along Brace Tree</td>
<td class="org-left">`C-M-S-arrows`</td>
</tr>


<tr>
<td class="org-left">Center Line in Window</td>
<td class="org-left">`C-l`</td>
</tr>


<tr>
<td class="org-left">Move to Last Edit</td>
<td class="org-left">`C-M-l` (repeatable)</td>
</tr>


<tr>
<td class="org-left">Goto Line</td>
<td class="org-left">`M-g`</td>
</tr>
</tbody>
</table>

## Mark, Copy, and Paste Text<a id="orgheadline5"></a>

Copy and Paste is **totally different** from the usual `C-c`, `C-v` sequences. Get
used to it. `C-c` and `C-x` are much more powerful in emacs than mere
copying/cutting.

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">Start Marking Region</td>
<td class="org-left">`C-space`</td>
</tr>


<tr>
<td class="org-left">Copy</td>
<td class="org-left">`M-w`</td>
</tr>


<tr>
<td class="org-left">Cut (called Kill)</td>
<td class="org-left">`C-w`</td>
</tr>


<tr>
<td class="org-left">Paste (called Yank)</td>
<td class="org-left">`C-y`</td>
</tr>


<tr>
<td class="org-left">Yank previous Kill</td>
<td class="org-left">`M-y` again</td>
</tr>


<tr>
<td class="org-left">Kill Line</td>
<td class="org-left">`C-k` (repeatable)</td>
</tr>


<tr>
<td class="org-left">Kill Word Forward/Backward</td>
<td class="org-left">`C-Delete` / `C-Backspace`</td>
</tr>


<tr>
<td class="org-left">Cut Word Forward/Backward</td>
<td class="org-left">`M-Delete` / `M-Backspace`</td>
</tr>
</tbody>
</table>

## Open File into Buffers<a id="orgheadline6"></a>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">Open File</td>
<td class="org-left">`C-x C-f`</td>
</tr>


<tr>
<td class="org-left">Save Buffer</td>
<td class="org-left">`C-x C-s`</td>
</tr>


<tr>
<td class="org-left">Save All Buffers</td>
<td class="org-left">`C-x s`</td>
</tr>


<tr>
<td class="org-left">Save As &#x2026;</td>
<td class="org-left">`C-x C-w`</td>
</tr>


<tr>
<td class="org-left">Close (Kill) Buffer</td>
<td class="org-left">`C-x k`</td>
</tr>


<tr>
<td class="org-left">Revert Buffer</td>
<td class="org-left">`M-x revert-buffer`</td>
</tr>
</tbody>
</table>

You don't need to enter the full path. Just open a directory and use the
directory listing to navigate.

In my config there is a special mode activated which makes opening existing
files faster (you see the available completions), but creating new ones from
scratch difficult. To create a new file press `C-z` while in `C-x C-f` mode. It
stops the automatic fuzzy searches for existing files.

## Switching Buffers (Open Files)<a id="orgheadline7"></a>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">Cycle Buffer</td>
<td class="org-left">`M-S-left` / `M-S-right`</td>
</tr>


<tr>
<td class="org-left">Buffer List</td>
<td class="org-left">`M-S-up` (originally: `C-x b`)</td>
</tr>
</tbody>
</table>

## Organizing Buffers into Frames and Windows<a id="orgheadline8"></a>

There are frames and windows in emacs: frames are independent windows as seen by
their border. Frames can internally be split into windows (horizontally or
vertically). This often happens automatically, but you can do it manually to
edit files at multiple places.

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">Full Frame</td>
<td class="org-left">`M-~` (remap this if you use a German keyboard) or `C-x 1`</td>
</tr>


<tr>
<td class="org-left">Split Frame</td>
<td class="org-left">`M-2` or `C-x 5`</td>
</tr>


<tr>
<td class="org-left">Kill Frame</td>
<td class="org-left">`M-3`</td>
</tr>


<tr>
<td class="org-left">Split Window</td>
<td class="org-left">`C-x 2` horizontally, `C-x 3` vertically</td>
</tr>


<tr>
<td class="org-left">Movement among frames</td>
<td class="org-left">`M-left` / `M-right`</td>
</tr>


<tr>
<td class="org-left">Switch to other frame</td>
<td class="org-left">`C-x o`</td>
</tr>
</tbody>
</table>

## Search and Replace<a id="orgheadline9"></a>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">Incremental Search</td>
<td class="org-left">`C-s <text>`</td>
</tr>


<tr>
<td class="org-left">Search Backwards</td>
<td class="org-left">`C-r <text>`</td>
</tr>


<tr>
<td class="org-left">Search/Replace</td>
<td class="org-left">`M-S-%` (follow prompt, keys: `y`, `n`, `^`, `!`)</td>
</tr>


<tr>
<td class="org-left">Regex Search/Replace</td>
<td class="org-left">`C-M-S-%`</td>
</tr>
</tbody>
</table>

## Change Font Size<a id="orgheadline10"></a>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">Larger Font</td>
<td class="org-left">`C-mouse wheel up` or `C-x +` (repeat `+`)</td>
</tr>


<tr>
<td class="org-left">Smaller Font</td>
<td class="org-left">`C-mouse wheel down` or `C-x -` (repeat `-`)</td>
</tr>


<tr>
<td class="org-left">Zero Font Size</td>
<td class="org-left">`C-x 0`</td>
</tr>
</tbody>
</table>

# Advanced Text Editing<a id="orgheadline16"></a>

Undo, redo, search and replace can be constrained using the mark region. Undo
only within a marked region is very powerful for coding!

Further simple commands are:

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">Comment or Uncomment Region</td>
<td class="org-left">(mark region) `C-space`</td>
</tr>


<tr>
<td class="org-left">Wrap (Fill) Paragraph</td>
<td class="org-left">`M-q`</td>
</tr>


<tr>
<td class="org-left">Fix indentation of region</td>
<td class="org-left">`M-C-q` (depends on mode)</td>
</tr>


<tr>
<td class="org-left">Upper/Lowercase Words</td>
<td class="org-left">`M-u` / `M-l`</td>
</tr>
</tbody>
</table>

## Rectangle Copy/Paste<a id="orgheadline12"></a>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">Mark Rectangle Region</td>
<td class="org-left">`C-space` (ignore blue marking area)</td>
</tr>


<tr>
<td class="org-left">Insert Text in each line</td>
<td class="org-left">`C-x r t`</td>
</tr>


<tr>
<td class="org-left">Open Area (insert with spaces)</td>
<td class="org-left">`C-x r o`</td>
</tr>


<tr>
<td class="org-left">Cancel Area (overwrite with spaces)</td>
<td class="org-left">`C-x r c`</td>
</tr>


<tr>
<td class="org-left">Kill (Cut) Area</td>
<td class="org-left">`C-x r k`</td>
</tr>


<tr>
<td class="org-left">Yank (Paste) Area (inserts space)</td>
<td class="org-left">`C-x r y`</td>
</tr>
</tbody>
</table>

## Keyboard Macros<a id="orgheadline13"></a>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">Record Macro</td>
<td class="org-left">`C-x (`</td>
</tr>


<tr>
<td class="org-left">End Recording</td>
<td class="org-left">`C-x )`</td>
</tr>


<tr>
<td class="org-left">Execute Macro</td>
<td class="org-left">`C-x e` (then repeat `e` for more)</td>
</tr>


<tr>
<td class="org-left">Repeated Execution</td>
<td class="org-left">`ESC <num> C-x e`</td>
</tr>
</tbody>
</table>

## Run Shell Commands<a id="orgheadline14"></a>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">Run Single Command</td>
<td class="org-left">`M-S-!`</td>
</tr>


<tr>
<td class="org-left">Pipe Marked Area to Command</td>
<td class="org-left">`M-S-(pipe)`</td>
</tr>
</tbody>
</table>

## Multiple Cursors<a id="orgheadline15"></a>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">Make more Cursors</td>
<td class="org-left">`C-S-click`</td>
</tr>


<tr>
<td class="org-left">Exit Multi-Cursors</td>
<td class="org-left">`C-g`</td>
</tr>


<tr>
<td class="org-left">Mark all like this with cursors</td>
<td class="org-left">`C-c !`</td>
</tr>
</tbody>
</table>

Multi cursors is a hack, but works reasonably well for simple things.

# Directory Listings (dired)<a id="orgheadline19"></a>

The directory listing, called dired, can be used to navigate the file system,
perform copy/move operations, and more.

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">Show Dir/File</td>
<td class="org-left">`Enter`</td>
</tr>


<tr>
<td class="org-left">Go Up To Parent Directory</td>
<td class="org-left">`Backspace`</td>
</tr>


<tr>
<td class="org-left">Refresh</td>
<td class="org-left">`g`</td>
</tr>


<tr>
<td class="org-left">Mark File</td>
<td class="org-left">`m`</td>
</tr>


<tr>
<td class="org-left">Unmark File</td>
<td class="org-left">`u`</td>
</tr>


<tr>
<td class="org-left">Unmark all</td>
<td class="org-left">`S-U`</td>
</tr>


<tr>
<td class="org-left">Delete File or Marked Files</td>
<td class="org-left">`D`</td>
</tr>


<tr>
<td class="org-left">Copy File or Marked Files</td>
<td class="org-left">`C`</td>
</tr>


<tr>
<td class="org-left">Rename File or Marked Files</td>
<td class="org-left">`C`</td>
</tr>


<tr>
<td class="org-left">Chmod a File</td>
<td class="org-left">`M`</td>
</tr>


<tr>
<td class="org-left">Copy Marked Filelist to Clipboard</td>
<td class="org-left">`M-w` (Copy)</td>
</tr>


<tr>
<td class="org-left">Cut Marked Filelist to Clipboard</td>
<td class="org-left">`C-w` (Cut)</td>
</tr>


<tr>
<td class="org-left">Paste Filelist from Clipboard</td>
<td class="org-left">`C-y` (Paste)</td>
</tr>


<tr>
<td class="org-left">Make Directory</td>
<td class="org-left">`+`</td>
</tr>


<tr>
<td class="org-left">Search and Replace in Marked Files</td>
<td class="org-left">`Q`</td>
</tr>


<tr>
<td class="org-left">Mark File for Deletion</td>
<td class="org-left">`d`</td>
</tr>


<tr>
<td class="org-left">Execute Deletion for Marks</td>
<td class="org-left">`x`</td>
</tr>
</tbody>
</table>

Note: with my config, PDFs open with evince.

## Give Me a Terminal, NOW!<a id="orgheadline17"></a>

If dired is not good enough, and you need a terminal. The `F4` key opens an
(external) terminal in the current directory. It works *everywhere*, also if you
are editing a file.

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">Open Terminal, HERE.</td>
<td class="org-left">`F4`</td>
</tr>
</tbody>
</table>

## Tramp Mode<a id="orgheadline18"></a>

Emacs can also edit files on a remote system, controlling it via ssh. For this
"open" a remote directory using `/[user@]ssh-host:path`. You can also just as
`/ssh-host:` if you ssh shortcuts are configured.

Most (really: almost all) operations are fully transparent, e.g., dired works on
the remote system just as well. Yes, copy and paste works across machines. Yes,
open a terminal if you need it. Yes, magit works (see below).

# Customization<a id="orgheadline20"></a>

Emacs has a myriad of customizable configuration variables, and every package
can add its own set. But customizing all this complexity is actually easy,
because the configuration browser is very good.

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">Launch customization browser</td>
<td class="org-left">`M-x customize`</td>
</tr>


<tr>
<td class="org-left">Search variables, funtions, etc</td>
<td class="org-left">`M-x apropos`</td>
</tr>


<tr>
<td class="org-left">Change face (e.g., color) under cursor</td>
<td class="org-left">`M-x customize-face`</td>
</tr>
</tbody>
</table>

Note that you must load the package you want to customize before calling
customize, otherwise the options may not appear. (Kind of obvious, otherwise
options of all possible packages would need to be in the menu).

# Source code editing<a id="orgheadline21"></a>

Buffers in emacs have so called "modes" active, which enable various features
for the particular buffer. E.g., modes add color highlighting, keybindings,
extra macros and functions, etc. Modes can be activated and deactivated, usually
done using `M-x blah-mode`. E.g. `M-x orgtbl-mode` activates/deactives the
org-table-mode in the buffer.

Emacs knows most programming languages, even hip new ones. If not
out-of-the-box, then there is an addon mode for it. They are usually
automatically activated by the file extension.

TAB and **automatic indentation** is highly sophisticated in emacs. Do not fight
it, emacs will win. Instead either customized it (to the peril that others will
use the defaults), or adapt to it.

# C/C++ Projects<a id="orgheadline31"></a>

## Identifier Expansion<a id="orgheadline22"></a>

emacs has the cedet package for parsing C/C++ files. It is not as good as one
wants and it is slow. There are some newer alternatives that use clang, but I
have not been happy with them. Everything breaks down once there are few
dependent or complicated templates around.

Hence, I only use a dumb, very fast expander: you write a prefix and it will
look backwards in the text for a word that starts with it. This often turns out
to be more powerful, since it also expands words from strings, and from
comments, from other open buffers, and then looks into the current directory for
matching file names.

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">hippie-expand</td>
<td class="org-left">`M-/`</td>
</tr>
</tbody>
</table>

## Snippets<a id="orgheadline23"></a>

I use yasnippets to expand some very frequently used code blocks. There are not
that many, otherwise you should use the language and write a function for
it. Expansion is trigged by snippet `keyword + TAB`.

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">`main`</td>
<td class="org-left">`int main(int argc...) ...`</td>
</tr>


<tr>
<td class="org-left">`for`</td>
<td class="org-left">a for loop with index</td>
</tr>


<tr>
<td class="org-left">`fori`</td>
<td class="org-left">a for loop with iterators</td>
</tr>


<tr>
<td class="org-left">`inc`</td>
<td class="org-left">`#include <...>`</td>
</tr>


<tr>
<td class="org-left">`noncopyable`</td>
<td class="org-left">copy-construct + operator= set to "delete"</td>
</tr>


<tr>
<td class="org-left">`noncopyablemove`</td>
<td class="org-left">noncopyable + move constructor / operator= set to "default"</td>
</tr>


<tr>
<td class="org-left">`op<<`</td>
<td class="org-left">`friend std::ostream operator << (...)`</td>
</tr>


<tr>
<td class="org-left">`copy`</td>
<td class="org-left">`Copyright (C) <year> Timo Bingmann <tb...`</td>
</tr>


<tr>
<td class="org-left">`cout`</td>
<td class="org-left">`std::cout << ... << std::endl;`</td>
</tr>


<tr>
<td class="org-left">`hr`</td>
<td class="org-left">`/***************/` (80 cols) horizontal rule</td>
</tr>


<tr>
<td class="org-left">`lock`</td>
<td class="org-left">`std::unique_lock<std::mutex> lock(mutex_);`</td>
</tr>


<tr>
<td class="org-left">`debug`</td>
<td class="org-left">`static const bool debug = true;`</td>
</tr>


<tr>
<td class="org-left">`doc`</td>
<td class="org-left">`/*! doxygen block`</td>
</tr>


<tr>
<td class="org-left">`try`</td>
<td class="org-left">`try { ... } catch (...) { ... }`</td>
</tr>
</tbody>
</table>

## Semantics Jumps<a id="orgheadline24"></a>

Cedet parses the C/C++ files in a project and creates an index of symbols. If I
want to jump to a symbol, I give cedet a try. It works sometimes, usually if the
programs is small. It does not work with templates. Then I use grep. Renaming
variable within the function scope also works sometimes (but not always).

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">Cedet jump to symbol</td>
<td class="org-left">`C-c <`</td>
</tr>


<tr>
<td class="org-left">Cedet rename variable</td>
<td class="org-left">`C-c C-r`</td>
</tr>


<tr>
<td class="org-left">Switch hpp/cpp files</td>
<td class="org-left">`F3`</td>
</tr>
</tbody>
</table>

## Ede (Cedet) Projects<a id="orgheadline25"></a>

Emacs is not very intelligent in detecting the root of a C/C++ project. It must
be told where projects start. This also makes cedet work better.

ede projects work great with CMake. The additional include paths are also used
during keyword expansion.

For emacs to know about a project, you must put the following into your `.emacs.d`:

    (ede-cpp-root-project "thrill"
        :file "~/thrill/CMakeLists.txt"
        :include-path '("/extlib/gtest/")
        :compile-command "cd build && make -j4 && ctest -V && cd .. && doxygen"
        ))

The compile-command can be used to set a default (magic) compile command line to
run within the project directory. Yes, this gives you click-able error
messages. It also saves all buffers for you.

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">Auto-Magic Compile or Recompile</td>
<td class="org-left">`F5`</td>
</tr>


<tr>
<td class="org-left">Custom Compile Command</td>
<td class="org-left">`M-x compile`</td>
</tr>
</tbody>
</table>

## Grep and Ag<a id="orgheadline26"></a>

For searching a source tree I currently use `ag`, which is a `grep` replacement
for source files (construct matching automaton, mmap files, etc goodies, read:
FAST).

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">Search for Words (ag or grep)</td>
<td class="org-left">`C-c C-s`</td>
</tr>
</tbody>
</table>

## Bookmarks<a id="orgheadline27"></a>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">Set/unset bookmark on line</td>
<td class="org-left">`M-F2`</td>
</tr>


<tr>
<td class="org-left">Jump to next bookmarked line</td>
<td class="org-left">`F2`</td>
</tr>


<tr>
<td class="org-left">Jump to previous bookmark</td>
<td class="org-left">`S-F2`</td>
</tr>
</tbody>
</table>

## ecb - Emacs Code Browser<a id="orgheadline28"></a>

Some people like it. It gives you a directory listing, and a class and method
listing for navigation.

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">Start ECB</td>
<td class="org-left">`M-x ecb-activate`</td>
</tr>
</tbody>
</table>

## TODO Tag Browsing<a id="orgheadline29"></a>

This is something I do not know how to use. Apparently, emacs has good support
for `ctags` and `global` tag files, but I never got it to work right for me.

## gdb inside emacs.<a id="orgheadline30"></a>

Possible, but wicked complex. I have not mastered it.

# Magit - Git Magic!<a id="orgheadline32"></a>

**Magit is awesome.** It is version controlling at a new level. It is
also **dangerously magical.**

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">Launch magit</td>
<td class="org-left">`C-F12`</td>
</tr>
</tbody>
</table>

You see a listing of the current status, like `git status`. Navigate it like a
directory listing. **Single keystrokes** do a lot of things in magit, beware!
Keystrokes most often operate on the thing the **usual cursor** is on, beware
where the cursor is!

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">Help!</td>
<td class="org-left">`?`</td>
</tr>


<tr>
<td class="org-left">Visit thing under cursor</td>
<td class="org-left">`Enter`</td>
</tr>


<tr>
<td class="org-left">Expand under cursor</td>
<td class="org-left">`TAB`</td>
</tr>


<tr>
<td class="org-left">Refresh (use often)</td>
<td class="org-left">`g` (same as in dired)</td>
</tr>


<tr>
<td class="org-left">Stage file or diff part</td>
<td class="org-left">`s`</td>
</tr>


<tr>
<td class="org-left">Unstage a staged file or diff</td>
<td class="org-left">`u`</td>
</tr>


<tr>
<td class="org-left">Kill changes in file or diff part</td>
<td class="org-left">`k`</td>
</tr>


<tr>
<td class="org-left">Start Commit</td>
<td class="org-left">`c c`</td>
</tr>


<tr>
<td class="org-left">Amend last commit</td>
<td class="org-left">`c a`</td>
</tr>


<tr>
<td class="org-left">(in commit) Stop commit</td>
<td class="org-left">`C-c C-k` (almost usual "kill buffer")</td>
</tr>


<tr>
<td class="org-left">(in commit) Save commit</td>
<td class="org-left">`C-c C-c`</td>
</tr>


<tr>
<td class="org-left">Push commits</td>
<td class="org-left">`P` (read message) `P`</td>
</tr>


<tr>
<td class="org-left">Pull commits</td>
<td class="org-left">`F F` or `F -r F` for `--rebase`</td>
</tr>


<tr>
<td class="org-left">Show branches</td>
<td class="org-left">`y`</td>
</tr>


<tr>
<td class="org-left">Checkout branch</td>
<td class="org-left">`b b`</td>
</tr>


<tr>
<td class="org-left">Merge branch</td>
<td class="org-left">`m m`</td>
</tr>


<tr>
<td class="org-left">Show log</td>
<td class="org-left">`l` (read 100 options) `l`</td>
</tr>


<tr>
<td class="org-left">Stash</td>
<td class="org-left">`z` (options) `z`</td>
</tr>


<tr>
<td class="org-left">add to .gitignore</td>
<td class="org-left">`i`</td>
</tr>
</tbody>
</table>

Magit lets you do things like:

-   kill only partial changes (use region marking too)
-   commit only a part of the changes in the working directory
-   stash everything not staged (check before committing parts)
-   use emacs merge tools: do magit merge, press `e` on a conflict.
-   apply patch chunks from other diffs `a`. also: revert *parts* of commits.
-   kill local or remote branches: `k` in branch list.
-   spell checking in commit messages.

# Editing LaTeX<a id="orgheadline33"></a>

LaTeX editing with emacs works for me as follows. The AUCTeX package have alot
more commands than I use, but the following is all I need. It is activated
automatically when opening a `.tex` file.

You usually want automatic spell checking when editing a LaTeX document, but
emacs must be configured to activate `flyspell` and with the right
**dictionary**. For this one puts the following line as the **first line** in the
`.tex` file:

    % -*- mode: latex; mode: flyspell; ispell-local-dictionary: "en_US"; coding: utf-8 -*-

This enables `latex-mode`, `flyspell-mode`, UTF-8 encoding, and sets the
dictionary to `en_US`. See `/usr/share/hunspell/` for dictionaries available on
your system. There is a snippet for this mode-line, so don't bother copying and
pasting.

When editing LaTeX these are the most important key chords:

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">Compile with pdflatex</td>
<td class="org-left">`C-c C-c`</td>
</tr>


<tr>
<td class="org-left">View PDF file (once compiled)</td>
<td class="org-left">`C-c C-v`</td>
</tr>
</tbody>
</table>

In my config the compile command runs a script `flymake-pdflatex`, which tries
to be smart about when to run `bibtex` for bibliography and `makeindex` for
symbol lists. It is not perfect, but adaptable.

**Emacs and evince can synchronize!** Pressing `C-c C-v` moves the PDF viewer to the
current line in emacs. `C-click` in evince moves emacs to the clicked line (but
only if compiled with `C-c C-c`). I practically **never** search for a section in
emacs: just read the PDF, and click for editing!

Further key chords:

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">Show TOC for navigation</td>
<td class="org-left">`M-S-down` (opposite to buffer menu)</td>
</tr>


<tr>
<td class="org-left">Insert `\ref` from list</td>
<td class="org-left">`M-C-r`</td>
</tr>


<tr>
<td class="org-left">Insert `\cite` from bibliography</td>
<td class="org-left">`M-C-c`</td>
</tr>


<tr>
<td class="org-left">Close environment</td>
<td class="org-left">`C-]`</td>
</tr>


<tr>
<td class="org-left">Align `&` columns in a tabular</td>
<td class="org-left">`M-x align-current`</td>
</tr>
</tbody>
</table>

Snippets while editing LaTeX files:

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">`begin`</td>
<td class="org-left">`\begin{...} ... \end{...}`</td>
</tr>


<tr>
<td class="org-left">`hr`</td>
<td class="org-left">`% -----` (80 cols)</td>
</tr>


<tr>
<td class="org-left">`itemize`</td>
<td class="org-left">`\begin{itemize} \item ... \end{itemize}`</td>
</tr>


<tr>
<td class="org-left">`enumerate`</td>
<td class="org-left">`\begin{enumerate} \item ... \end{enumerate}`</td>
</tr>


<tr>
<td class="org-left">`frame`</td>
<td class="org-left">`% --- \begin{frame}{...} ... \end{frame}`</td>
</tr>


<tr>
<td class="org-left">`modeline`</td>
<td class="org-left">`-*- ... -*-` with dictionary selection</td>
</tr>
</tbody>
</table>

# org-mode<a id="orgheadline34"></a>

Org mode is the ultimate text-based tool for organizing things. The great thing
about org-mode files is, you can send them to people with no comment or
additional program, and they can read it. Plain ASCII files will be readable as
long as there are computers.

Learning org-mode is another presentation: see <http://orgmode.org/>

I use an org-mode file as my "welcome page" to emacs. It contains **everything**:
TODOs, **short cuts to current and past projects**, links to remote configuration
files, general notes, command line snippets, multi-year statistical information
like electricity bills, etc.

This file is written in org-mode, which can export to HTML, Markdown, PDF, and
probably a thousand other formats.

org-mode has automatic text-based tables, which can calculate and sort by
columns.

# evil-mode<a id="orgheadline35"></a>

There is evil in the world. If you want to turn from evil to good, emacs may
help you change from your evil way **gradually**. For this there is `evil-mode`,
which people say does evil things in emacs **better than evil itself**.

<http://www.emacswiki.org/emacs/Evil>
