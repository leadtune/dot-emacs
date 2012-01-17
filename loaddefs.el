;;; loaddefs.el --- automatically extracted autoloads
;;
;;; Code:

;;;***

;;;### (autoloads (cheat) "elpa-to-submit/cheat" "elpa-to-submit/cheat.el"
;;;;;;  (20244 22393))
;;; Generated autoloads from elpa-to-submit/cheat.el

(autoload 'cheat "elpa-to-submit/cheat" "\
Show the specified cheat sheet.

If SILENT is non-nil then do not print any output, but return it
as a string instead.

\(fn NAME &optional SILENT)" t nil)

;;;***

;;;### (autoloads (cperl-perldoc-at-point cperl-perldoc cperl-mode)
;;;;;;  "elpa-to-submit/cperl-mode" "elpa-to-submit/cperl-mode.el"
;;;;;;  (20244 22393))
;;; Generated autoloads from elpa-to-submit/cperl-mode.el

(fset 'perl-mode 'cperl-mode)

(autoload 'cperl-mode "elpa-to-submit/cperl-mode" "\
Major mode for editing Perl code.
Expression and list commands understand all C brackets.
Tab indents for Perl code.
Paragraphs are separated by blank lines only.
Delete converts tabs to spaces as it moves back.

Various characters in Perl almost always come in pairs: {}, (), [],
sometimes <>.  When the user types the first, she gets the second as
well, with optional special formatting done on {}.  (Disabled by
default.)  You can always quote (with \\[quoted-insert]) the left
\"paren\" to avoid the expansion.  The processing of < is special,
since most the time you mean \"less\".  CPerl mode tries to guess
whether you want to type pair <>, and inserts is if it
appropriate.  You can set `cperl-electric-parens-string' to the string that
contains the parenths from the above list you want to be electrical.
Electricity of parenths is controlled by `cperl-electric-parens'.
You may also set `cperl-electric-parens-mark' to have electric parens
look for active mark and \"embrace\" a region if possible.'

CPerl mode provides expansion of the Perl control constructs:

   if, else, elsif, unless, while, until, continue, do,
   for, foreach, formy and foreachmy.

and POD directives (Disabled by default, see `cperl-electric-keywords'.)

The user types the keyword immediately followed by a space, which
causes the construct to be expanded, and the point is positioned where
she is most likely to want to be.  eg. when the user types a space
following \"if\" the following appears in the buffer: if () { or if ()
} { } and the cursor is between the parentheses.  The user can then
type some boolean expression within the parens.  Having done that,
typing \\[cperl-linefeed] places you - appropriately indented - on a
new line between the braces (if you typed \\[cperl-linefeed] in a POD
directive line, then appropriate number of new lines is inserted).

If CPerl decides that you want to insert \"English\" style construct like

            bite if angry;

it will not do any expansion.  See also help on variable
`cperl-extra-newline-before-brace'.  (Note that one can switch the
help message on expansion by setting `cperl-message-electric-keyword'
to nil.)

\\[cperl-linefeed] is a convenience replacement for typing carriage
return.  It places you in the next line with proper indentation, or if
you type it inside the inline block of control construct, like

            foreach (@lines) {print; print}

and you are on a boundary of a statement inside braces, it will
transform the construct into a multiline and will place you into an
appropriately indented blank line.  If you need a usual
`newline-and-indent' behaviour, it is on \\[newline-and-indent],
see documentation on `cperl-electric-linefeed'.

Use \\[cperl-invert-if-unless] to change a construction of the form

	    if (A) { B }

into

            B if A;

\\{cperl-mode-map}

Setting the variable `cperl-font-lock' to t switches on font-lock-mode
\(even with older Emacsen), `cperl-electric-lbrace-space' to t switches
on electric space between $ and {, `cperl-electric-parens-string' is
the string that contains parentheses that should be electric in CPerl
\(see also `cperl-electric-parens-mark' and `cperl-electric-parens'),
setting `cperl-electric-keywords' enables electric expansion of
control structures in CPerl.  `cperl-electric-linefeed' governs which
one of two linefeed behavior is preferable.  You can enable all these
options simultaneously (recommended mode of use) by setting
`cperl-hairy' to t.  In this case you can switch separate options off
by setting them to `null'.  Note that one may undo the extra
whitespace inserted by semis and braces in `auto-newline'-mode by
consequent \\[cperl-electric-backspace].

If your site has perl5 documentation in info format, you can use commands
\\[cperl-info-on-current-command] and \\[cperl-info-on-command] to access it.
These keys run commands `cperl-info-on-current-command' and
`cperl-info-on-command', which one is which is controlled by variable
`cperl-info-on-command-no-prompt' and `cperl-clobber-lisp-bindings'
\(in turn affected by `cperl-hairy').

Even if you have no info-format documentation, short one-liner-style
help is available on \\[cperl-get-help], and one can run perldoc or
man via menu.

It is possible to show this help automatically after some idle time.
This is regulated by variable `cperl-lazy-help-time'.  Default with
`cperl-hairy' (if the value of `cperl-lazy-help-time' is nil) is 5
secs idle time .  It is also possible to switch this on/off from the
menu, or via \\[cperl-toggle-autohelp].  Requires `run-with-idle-timer'.

Use \\[cperl-lineup] to vertically lineup some construction - put the
beginning of the region at the start of construction, and make region
span the needed amount of lines.

Variables `cperl-pod-here-scan', `cperl-pod-here-fontify',
`cperl-pod-face', `cperl-pod-head-face' control processing of POD and
here-docs sections.  With capable Emaxen results of scan are used
for indentation too, otherwise they are used for highlighting only.

Variables controlling indentation style:
 `cperl-tab-always-indent'
    Non-nil means TAB in CPerl mode should always reindent the current line,
    regardless of where in the line point is when the TAB command is used.
 `cperl-indent-left-aligned-comments'
    Non-nil means that the comment starting in leftmost column should indent.
 `cperl-auto-newline'
    Non-nil means automatically newline before and after braces,
    and after colons and semicolons, inserted in Perl code.  The following
    \\[cperl-electric-backspace] will remove the inserted whitespace.
    Insertion after colons requires both this variable and
    `cperl-auto-newline-after-colon' set.
 `cperl-auto-newline-after-colon'
    Non-nil means automatically newline even after colons.
    Subject to `cperl-auto-newline' setting.
 `cperl-indent-level'
    Indentation of Perl statements within surrounding block.
    The surrounding block's indentation is the indentation
    of the line on which the open-brace appears.
 `cperl-continued-statement-offset'
    Extra indentation given to a substatement, such as the
    then-clause of an if, or body of a while, or just a statement continuation.
 `cperl-continued-brace-offset'
    Extra indentation given to a brace that starts a substatement.
    This is in addition to `cperl-continued-statement-offset'.
 `cperl-brace-offset'
    Extra indentation for line if it starts with an open brace.
 `cperl-brace-imaginary-offset'
    An open brace following other text is treated as if it the line started
    this far to the right of the actual line indentation.
 `cperl-label-offset'
    Extra indentation for line that is a label.
 `cperl-min-label-indent'
    Minimal indentation for line that is a label.

Settings for classic indent-styles: K&R BSD=C++ GNU PerlStyle=Whitesmith
  `cperl-indent-level'                5   4       2   4
  `cperl-brace-offset'                0   0       0   0
  `cperl-continued-brace-offset'     -5  -4       0   0
  `cperl-label-offset'               -5  -4      -2  -4
  `cperl-continued-statement-offset'  5   4       2   4

CPerl knows several indentation styles, and may bulk set the
corresponding variables.  Use \\[cperl-set-style] to do this.  Use
\\[cperl-set-style-back] to restore the memorized preexisting values
\(both available from menu).  See examples in `cperl-style-examples'.

Part of the indentation style is how different parts of if/elsif/else
statements are broken into lines; in CPerl, this is reflected on how
templates for these constructs are created (controlled by
`cperl-extra-newline-before-brace'), and how reflow-logic should treat
\"continuation\" blocks of else/elsif/continue, controlled by the same
variable, and by `cperl-extra-newline-before-brace-multiline',
`cperl-merge-trailing-else', `cperl-indent-region-fix-constructs'.

If `cperl-indent-level' is 0, the statement after opening brace in
column 0 is indented on
`cperl-brace-offset'+`cperl-continued-statement-offset'.

Turning on CPerl mode calls the hooks in the variable `cperl-mode-hook'
with no args.

DO NOT FORGET to read micro-docs (available from `Perl' menu,
or as help on variables `cperl-tips', `cperl-problems',
`cperl-non-problems', `cperl-praise', `cperl-speed',
`cperl-tips-faces').

\(fn)" t nil)

(autoload 'cperl-perldoc "elpa-to-submit/cperl-mode" "\
Run `perldoc' on WORD.

\(fn WORD)" t nil)

(autoload 'cperl-perldoc-at-point "elpa-to-submit/cperl-mode" "\
Run a `perldoc' on the word around point.

\(fn)" t nil)
(add-to-list 'auto-mode-alist '("\\.\\([pP][LlMm]\\|al\\)\\'" . perl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . perl-mode))

;;;***

;;;### (autoloads (erc-highlight-nicknames) "elpa-to-submit/erc-highlight-nicknames"
;;;;;;  "elpa-to-submit/erc-highlight-nicknames.el" (20244 22393))
;;; Generated autoloads from elpa-to-submit/erc-highlight-nicknames.el

(autoload 'erc-highlight-nicknames "elpa-to-submit/erc-highlight-nicknames" "\
Searches for nicknames and highlights them. Uses the first
twelve digits of the MD5 message digest of the nickname as
color (#rrrrggggbbbb).

\(fn)" nil nil)

;;;***

;;;### (autoloads (espresso-mode) "elpa-to-submit/espresso" "elpa-to-submit/espresso.el"
;;;;;;  (20244 22393))
;;; Generated autoloads from elpa-to-submit/espresso.el

(autoload 'espresso-mode "elpa-to-submit/espresso" "\
Major mode for editing JavaScript source text.

Key bindings:

\\{espresso-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads (moz-minor-mode) "elpa-to-submit/moz" "elpa-to-submit/moz.el"
;;;;;;  (20244 22393))
;;; Generated autoloads from elpa-to-submit/moz.el

(autoload 'moz-minor-mode "elpa-to-submit/moz" "\
Toggle Mozilla mode.
With no argument, this command toggles the mode.
Non-null prefix argument turns on the mode.
Null prefix argument turns off the mode.

When Mozilla mode is enabled, some commands become available to
send current code area (as understood by c-mark-function) or
region or buffer to an inferior mozilla process (which will be
started as needed).

\(fn &optional ARG)" t nil)

(eval-after-load 'js2-mode '(add-hook 'js2-mode-hook 'moz-minor-mode))

;;;***

;;;### (autoloads (pcomplete/rake) "elpa-to-submit/pcmpl-rake" "elpa-to-submit/pcmpl-rake.el"
;;;;;;  (20244 22393))
;;; Generated autoloads from elpa-to-submit/pcmpl-rake.el

(autoload 'pcomplete/rake "elpa-to-submit/pcmpl-rake" "\
Completion rules for the `ssh' command.

\(fn)" nil nil)

;;;***

;;;### (autoloads (perl-find-file perldoc) "elpa-to-submit/perl-find-library"
;;;;;;  "elpa-to-submit/perl-find-library.el" (20244 22393))
;;; Generated autoloads from elpa-to-submit/perl-find-library.el

(autoload 'perldoc "elpa-to-submit/perl-find-library" "\
Invoke `cperl-perldoc' on LIBRARY, but do completion using *PERL-LIBRARIES*
when run interactively

\(fn LIBRARY)" t nil)

(autoload 'perl-find-file "elpa-to-submit/perl-find-library" "\
Find a perl library by module name

\(fn LIBRARY)" t nil)

;;;***

;;;### (autoloads (pod-mode) "elpa-to-submit/pod-mode" "elpa-to-submit/pod-mode.el"
;;;;;;  (20244 22393))
;;; Generated autoloads from elpa-to-submit/pod-mode.el

(autoload 'pod-mode "elpa-to-submit/pod-mode" "\
Major mode for editing POD files (Plain Old Documentation for Perl).

\(fn)" t nil)

;;;***

;;;### (autoloads (ri) "elpa-to-submit/ri" "elpa-to-submit/ri.el"
;;;;;;  (20244 22393))
;;; Generated autoloads from elpa-to-submit/ri.el

(autoload 'ri "elpa-to-submit/ri" "\
Look up Ruby documentation.

\(fn &optional RI-DOCUMENTED)" t nil)

;;;***

;;;### (autoloads (ruby-electric-mode) "elpa-to-submit/ruby-electric"
;;;;;;  "elpa-to-submit/ruby-electric.el" (20244 22393))
;;; Generated autoloads from elpa-to-submit/ruby-electric.el

(autoload 'ruby-electric-mode "elpa-to-submit/ruby-electric" "\
Toggle Ruby Electric minor mode.
With no argument, this command toggles the mode.  Non-null prefix
argument turns on the mode.  Null prefix argument turns off the
mode.

When Ruby Electric mode is enabled, an indented 'end' is
heuristicaly inserted whenever typing a word like 'module',
'class', 'def', 'if', 'unless', 'case', 'until', 'for', 'begin',
'do'. Simple, double and back quotes as well as braces are paired
auto-magically. Expansion does not occur inside comments and
strings. Note that you must have Font Lock enabled.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (textile-mode) "elpa-to-submit/textile-mode" "elpa-to-submit/textile-mode.el"
;;;;;;  (20244 22393))
;;; Generated autoloads from elpa-to-submit/textile-mode.el

(autoload 'textile-mode "elpa-to-submit/textile-mode" "\
A major mode for editing textile files.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.textile\\'" . textile-mode))

;;;***

;;;### (autoloads (tt-mode) "elpa-to-submit/tt-mode" "elpa-to-submit/tt-mode.el"
;;;;;;  (20244 22393))
;;; Generated autoloads from elpa-to-submit/tt-mode.el

(autoload 'tt-mode "elpa-to-submit/tt-mode" "\
Major mode for editing Template Toolkit files

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("elpa-to-submit/color-theme.el" "elpa-to-submit/eshell-vc.el"
;;;;;;  "elpa-to-submit/notify.el") (20244 30894 345098))

;;;***

(provide 'loaddefs)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; loaddefs.el ends here
