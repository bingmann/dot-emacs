;; pmwiki-mode.el --- edit PmWiki pages within Emacs
;;
;; Copyright (C) 2003  Christian Ridderström, 2007 Lukasz Stafiniak
;;
;; Authors:  Christian Ridderström <christian.ridderstrom@home.se>, Lukasz Stafiniak <lukstafi@gmail.com>
;; Maintainer: Lukasz Stafiniak <lukstafi@gmail.com>
;; Release: $Name:  $
;; Revision: $Revision: 1.109 $
;; Keywords: hypermedia
;; URI: http://www.pmwiki.org/wiki/EmacsModes/Pmwiki-mode
;; 
;;
;; This file is not part of GNU Emacs.
;;
;;; License:
;;
;; This is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.
;;
;;; Commentary:
;;
;; Background:
;;
;; `pmwiki-mode' was created by Christian Ridderström in order to
;; easily edit wiki pages at http://wiki.lyx.org (also see
;; http://www.lyx.org). This site uses the wiki engine PmWiki (see
;; http://www.pmwiki.org/wiki).
;;
;; `pmwiki-mode' was created because in order to easily edit wiki
;; pages at http://wiki.lyx.org (also see http://www.lyx.org). This
;; site the wiki engine PmWiki (see http://www.pmwiki.org/wiki).
;;
;; `pmwiki-mode' is based on the source of `simple-wiki-mode', i.e.
;; 	simple-emacswiki.el, simple-wiki-edit.el and simple-wiki.el.
;; `simple-wiki-mode' was written by Alex Schroeder <alex@gnu.org>
;; (see http://www.emacswiki.org/cgi-bin/wiki.pl/SimpleWikiEditMode).
;;
;; Lukasz Stafiniak took over maintenace in 2007 and has partially
;; rewritten `pmwiki-mode' to work on articles on his homepage at
;;    http://www.ii.uni.wroc.pl/~lukstafi/
;;
;;
;; Requirements:
;;
;; This file has been tested with Emacs 22.
;;
;; In addition, this package is useful:
;;	`longlines'	http://www.emacswiki.org/cgi-bin/wiki.pl/LongLines
;;
;; If you downloaded this file as a tar.gz-file, you should already
;; have these packages. Note that the version of `longlines' in the
;; archive has been patched --- this line has been added to the end:
;;	(provide 'longlines)
;; When you have `mmm-mode' installed, some submode support is added.
;;
;; Installation and basic customization:
;;
;; 1. Assuming that this file is located in the directory
;;
;;	~/emacs/pmwiki-mode/
;;
;;    add these lines to your .emacs-file:
;;
;;	(add-to-list 'load-path "~/emacs/pmwiki-mode")
;;	(require 'pmwiki-mode)
;;
;; 2. If you want `preview-latex' to work, copy the "preamble.tex" file,
;;    or your own LaTeX file, to your working directory, and add the line
;;    to your .emacs-file (substitute your directory):
;;
;;    (setq pmwiki-TeX-master-directory "/path/to/working/directory/")
;;
;;    where "~/preamble.tex" is the path to your preamble file
;;    (tested under Linux only).
;;
;; 3. To use `mywiki-open' and `mywiki-save-as' commands, add:
;;
;;    (setq pmwiki-main-wiki-base-uri
;;       "http://your.path.to/WikiEngine")
;;    (setq pmwiki-main-homepage-uri
;;        (concat pmwiki-main-wiki-base-uri "?n=Main.HomePage"))
;;
;;    replace "http://your.path.to/WikiEngine" with your wiki base URI.
;;
;; 4. If you have `mmm-mode' or `mumamo-mode' and use SourceBlock
;;    recipe, add the lines
;;
;;    (pmwiki-multi-source "lisp" 'emacs-lisp-mode 'pmwiki-elisp-submode ?l)
;;
;;    customized for languages you use (optional ?l is a key to use with
;;    [C-c %], 'pmwiki-elisp-mode is arbitrary symbol to name the submode).
;;
;; 5. Optionally, use the command `byte-compile' to compile this file.
;; 6. Restart Emacs.
;;
;;
;; Usage:
;;
;; Two examples to get you started:
;; * Use the command `pmwiki-open' with the argument
;;	Main.WikiSandbox
;;   to download the page Main.WikiSandbox from the PmWiki wiki.
;;
;; * Use the command `pmwiki-open' to open a page by specifying
;;   its URI. For example, to open the page where this mode is
;;   described, give the following URI as argument to the command:
;;
;;	http://www.pmwiki.org/wiki/Cookbook/EmacsPmWikiMode
;;
;; Note:
;; * Do not try to use `pmwiki-mode' to edit a page. 
;;   You must use `pmwiki-open' instead.
;;
;; Enjoy. /Christian, /Lukasz
;;
;;
;; Configuration options:
;;
;; Note that the code below is meant to be inserted in .emacs (or an
;; equivalent file).
;; 
;; If you want to use any of the configuration examples below, first
;; insert this line of code:
;;
;;	(defvar pmwiki-mode-hooks)
;;
;; If your auto-fill-mode is usually on, you might want to turn it off:
;;
;;	(add-hook 'pmwiki-mode-hooks 'turn-off-auto-fill)
;;	
;;
;; Also consider using the package longlines.el, for details see
;;   http://www.emacswiki.org/cgi-bin/wiki.pl/LongLines 
;;
;; 	(add-hook 'pmwiki-mode-hooks
;;	  'pmwiki-delayed-hook-longlines-mode-on)
;;	(add-hook 'pmwiki-save-before-hooks 'longlines-mode-off)
;;
;; in which case, also customize `pmwiki-fill-column' back to 70.
;; Note that you may have to patch the file longlines.el by adding
;; 	(provide 'longlines)
;; to the end of it. As an alternative configuration, this code also
;; makes the `longlines-mode' show the hard newlines.
;;
;; 	(add-hook 'pmwiki-mode-hooks
;;	  'pmwiki-delayed-hook-longlines-mode-showing-hard-newlines)
;;	(add-hook 'pmwiki-save-before-hooks 'longlines-mode-off)
;;
;; Note: PmWiki supports using '\' as line continuation character,
;; i.e. if it is the the last character on the line the linebreak is
;; ignored. This is not supported.
;;
;; !!!Author name
;;
;; The name of the author who modified the page is set through the
;; variable `pmwiki-author'. To configure this, either customize the
;; variable or set it from the your initialization script like this:
;;
;;	(set 'pmwiki-author "chr")
;;
;; !!!File extension for PmWiki-files
;;
;; (add-to-list 'auto-mode-alist '("\\.pmwiki\\'" . pmwiki-mode))
;;

;;; Code:

;;FIXME: do we need these?
;; Are we running XEmacs or Emacs?
;; (defvar pmwiki-running-xemacs (string-match "XEmacs\\|Lucid" emacs-version)
;;   "Indicates if XEmacs (t) or Emacs (nil) is used")
;; (defvar pmwiki-running-emacs (not pmwiki-running-xemacs)
;;   "Indicates if Emacs (t) or XEmacs (nil) is used")
;; (defvar pmwiki-running-emacs-22 (and pmwiki-running-emacs
;; 				     (<= 22 emacs-major-version))
;;   "Indicates if Emacs (t) or XEmacs (nil) is used")

;; Define helper macro for defining functions that might already exist
(defmacro pmwiki-defun-when-void (&rest args)
  "Define a function, just like `defun', unless it's already defined.
Used for compatibility among different emacs variants."
  `(if (fboundp ',(car args))
       nil
     (defun ,@args)))

(require 'thingatpt)
(require 'cl)				; Defines caddr etc
(require 'easymenu)
;; (if pmwiki-running-xemacs
;;     (require 'mule))	     ; Defines encode-coding-string for xemacs

;;
;; Fix required for XEmacs prior to 21.5

(pmwiki-defun-when-void
 replace-regexp-in-string (regexp rep string &optional
				  fixedcase literal subexp start)
"Replace all matches for REGEXP with REP in STRING.
Return a new string containing the replacements.
Optional arguments FIXEDCASE, LITERAL and SUBEXP are like the
arguments with the same names of function `replace-match'.  If START
is non-nil, start replacements at that index in STRING.
REP is either a string used as the NEWTEXT arg of `replace-match' or a
function.  If it is a function it is applied to each match to generate
the replacement passed to `replace-match'; the match-data at this
point are such that match 0 is the function's argument.
To replace only the first match (if any), make REGEXP match up to \\'
and replace a sub-expression, e.g.
  (replace-regexp-in-string \"\\(foo\\).*\\'\" \"bar\" \" foo foo\" nil nil 1)
    => \" bar foo\"
"
  ;; To avoid excessive consing from multiple matches in long strings,
  ;; don't just call `replace-match' continually.  Walk down the
  ;; string looking for matches of REGEXP and building up a (reversed)
  ;; list MATCHES.  This comprises segments of STRING which weren't
  ;; matched interspersed with replacements for segments that were.
  ;; [For a `large' number of replacments it's more efficient to
  ;; operate in a temporary buffer; we can't tell from the function's
  ;; args whether to choose the buffer-based implementation, though it
  ;; might be reasonable to do so for long enough STRING.]
  (let ((l (length string))
        (start (or start 0))
        matches str mb me)
    (save-match-data
      (while (and (< start l) (string-match regexp string start))
        (setq mb (match-beginning 0)
              me (match-end 0))
        ;; If we matched the empty string, make sure we advance by one char
        (when (= me mb) (setq me (min l (1+ mb))))
        ;; Generate a replacement for the matched substring.
        ;; Operate only on the substring to minimize string consing.
        ;; Set up match data for the substring for replacement;
        ;; presumably this is likely to be faster than munging the
        ;; match data directly in Lisp.
        (string-match regexp (setq str (substring string mb me)))
        (setq matches
              (cons (replace-match (if (stringp rep)
                                       rep
                                     (funcall rep (match-string 0 str)))
                                   fixedcase literal str subexp)
                    (cons (substring string start mb) ; unmatched prefix
                          matches)))
        (setq start me))
      ;; Reconstruct a string from the pieces.
      (setq matches (cons (substring string start l) matches)) ; leftover
      (apply #'concat (nreverse matches)))))

;; Fix required for XEmacs since `string-bytes' doesn't exist
(pmwiki-defun-when-void string-bytes (string)
   "Fake replacement for Emacs `string-bytes'. This function fails for
multibyte characters."
    (length string))

;; ----------------------------------------------------------------------
;;
;;	Preliminaries
;;
;; Define variables with various patterns
;;
(defvar pmwiki-HTTP-pattern
  "^[hH][tT][tT][pP][sS]?:"
  "Pattern matching 'http:' (case insensitive) at the beginning of a string.")
(defvar pmwiki-HTTP-or-local-pattern
  (concat "\\(?:" pmwiki-HTTP-pattern "\\|^/\\)")
  "Pattern matching `pmwiki-HTTP-pattern' or '/' at the beginning.")

(defvar pmwiki-base-pattern
  (concat "\\(" pmwiki-HTTP-or-local-pattern "//[^/?]+\\)\\(/?\\)$\\|"
	  "\\(" pmwiki-HTTP-or-local-pattern
	  ".+?\\)\\(\\?n=\\|\\?pagename=\\)\\|"
	  "\\(" pmwiki-HTTP-or-local-pattern
	  ".*\\)\\(/\\)[^/?.]+[/.][^/?.#]*\\($\\|#.*\\)\\|"
	  "\\(\\)\\(/\\)[^/?.]+[/.][^/?.#]*\\($\\|#.*\\)\\|"
	  "\\(" pmwiki-HTTP-or-local-pattern ".+?\\.php\\)\\(/\\|$\\)")
  "This pattern gets WikiEngine address and where pagename starts.")

(setq pmwiki-base-pattern
  (concat "\\(" pmwiki-HTTP-or-local-pattern "//[^/?]+\\)\\(/?\\)$\\|"
	  "\\(" pmwiki-HTTP-or-local-pattern
	  ".+?\\)\\(\\?n=\\|\\?pagename=\\)\\|"
	  "\\(" pmwiki-HTTP-or-local-pattern
	  ".*\\)\\(/\\)[^/?.]+[/.][^/?.#]*\\($\\|#.*\\)\\|"
	  "\\(\\)\\(/\\)[^/?.]+[/.][^/?.#]*\\($\\|#.*\\)\\|"
	  "\\(" pmwiki-HTTP-or-local-pattern ".+?\\.php\\)\\(/\\|$\\)"))

;; The pmwiki-site-pattern is used to extract the name of the 
;; site from a URI. The match with the site is match n:o 1
(defvar pmwiki-site-pattern
  (concat pmwiki-HTTP-pattern "//\\(?:[^@]*@\\|\\)\\(.+?\\)\\(?:[/?]\\|$\\)")
  "Pattern that is used to extract the name of the site")

(defvar pmwiki-link-pattern
  (concat "\\[\\[\\([^]|>]*?\\)"
	  "\\(?:\\]\\]\\||.+?\\]\\]\\)\\|" ; [[ <link> ]] or [[ <link> | ... ]]
	  "\\[\\[.+?->\\([^]|>]*?\\)\\]\\]") ; [[ ... -> <link> ]]
  "The pattern used for `pmwiki-next', `pmwiki-prev', `pmwiki-follow' etc.")

;;
;; Other patterns
;;
(defvar pmwiki-style-pattern
  "%%\\|%[A-Za-z][-,=#\\w\\s]*%"
  "Pattern for PmWiki style tags.")

;; ----------------------------------------------------------------------
;;
;; Define variables with some default URI's
;;

(defvar pmwiki-org-sandbox-uri "http://www.pmwiki.org/wiki/Main/WikiSandbox"
  "URI to sandbox at http://www.pmwiki.org")

(defcustom pmwiki-main-homepage-uri pmwiki-org-sandbox-uri
  "*URI for the entry page of your favorite wiki" :group 'pmwiki-group :type
  '(restricted-sexp :match-alternatives (pmwiki-link-p 'nil)))
(defcustom pmwiki-TeX-master-file "preamble.tex"
  "*LaTeX file with preamble (empty document) for `preview-latex'."
  :group 'pmwiki-group :type 'string)
(defcustom pmwiki-TeX-master-directory nil
  "*Working directory for `preview-latex'
(must contain the `pmwiki-TeX-master-file')."
  :group 'pmwiki-group :type 'file)

;; ----------------------------------------------------------------------
;;
;; Define general variables 
;;
;; `pmwiki-page-uri' becomes local to a buffer in `pmwiki-mode'
(defvar pmwiki-page-uri nil
  "The URI of the page corresponding to the current buffer, thus defining
the base URI of the wiki engine as well as group and page name.")

;;
;; There are too many "URI's" now... basically we have
;; 'base URI' -> the PmWiki-script, e.g. http://wiki.lyx.org/pmwiki.php
;; 'post URI' -> to where the form with a page is posted, same as 'base URI'
;; 'page URI' -> the page, e.g. http://wiki.lyx.org/pmwiki.php/Main/WikiWord
;; 'source URI' -> source of PmWiki-page, e.g.
;;		http://wiki.lyx.org/pmwiki.php/Main/WikiWord?action=source
;;
;; I'm thinking of storing the location data as a list, location-list
;; This requires conversion methods:
;;	data    -> pageURI	=> (pmwiki-loc 'URI  listData)
;;	        -> baseURI	=> (pmwiki-loc 'base listData)
;;	pageURI -> data		=> (pmwiki-uri-to-loc-list URI)
;;	srcURI  -> data		=> (pmwiki-uri-to-loc-list URI)

(defvar pmwiki-location-list nil
  "List with four strings, (<baseURI> <group> <page> . <anchor>),
 specifying the base URI of the wiki engine, group name, page name
and anchor on page. Anchor can be:
* a string: \"here\" means go to [[#here]] or [[##here]]
* a marker means go to the marker
* a cons ('search . regexp) means go to first match of the regexp.")

(defcustom pmwiki-passwords nil
  "*A list of password rules, like:
 '(((('read \"http://www.somewiki.org/wiki\" \"Site\" \"*\")
     . (\"secret\" . \"my-name\"))
   ((nil \"http://www.mywiki.org/wiki\" \"*\" \"*\")
     . (\"secret\" . nil))
   (('save \"http://www.facultywiki.org/wiki\" \"*\" \"Grades\")
     . (\"secret\" . nil)))

Each rule is a cons with location action kind and location list
pattern as car, and a cons of password and author as a cdr. Star
* in a pattern is a wildcard, it matches any substring (these are
not regexps!).  nil as author means that authorisation is not
user-based.  Action kind is one of: 'read, 'edit, 'attribute, 'upload, nil.
nil is a wildcard for action kinds.
Location list is wiki base URI, then group name, then page name."

  :group 'pmwiki-group
  ;;FIXME: "Action kind" is not a string! etc.
  :type '(alist :key-type (list (string :tag "Action kind")
				(choice
				 (const :tag "anything" nil)
				 (const :tag "reading" 'read)
				 (const :tag "editing" 'edit)
				 (const :tag "uploading" 'upload)
				 (const :tag "changing attributes"
					'attribute))
				(string :tag "Wiki engine base URL")
				(choice
				 (string :tag "Group name")
				 (const :tag "Any group" "*"))
				(choice
				 (string :tag "Page name")
				 (const :tag "Any page" "*")))
		:value-type
		(cons (string :tag "Password")
		      (choice (string :tag "User name")
			      (const :tag "Not user authenticated"
				     nil)))))

(defvar pmwiki-session-passwords nil
  "IDs / Passwords remembered from user input.
When a password is not found in `pmwiki-passwords', we look for it in
`pmwiki-session-passwords' by first looking for site/group/page matches,
then for site/group and finally for site matches.")

(defcustom pmwiki-slash-format nil
  "*If nil, format URI as http://...?Group.Page, else as http://.../Group/Page.
Usually set by last user choice, see `pmwiki-freeze-slash-format'.
Buffer local -- global setting is a default for a buffer."
  :group 'pmwiki-group 
  :type '(choice (const :tag "Slash-based URLs" t)
		(const :tag "Question-mark based URLs" nil)))

(defcustom pmwiki-main-group-separator "[./]"
  "Regexp for separator standing between \"real\" group name and page name.
Should not contain numbered regexp subgroups, e.g. \\( ... \\).
Default value: \"[./]\". Some wikis recognize : as a group separator."
  :group 'pmwiki-group :type 'regexp)
(defcustom pmwiki-word-separating-punct "[!@$=_+{}`~\\:;,]\\|\\s-"
  "Regexp for substrings removed from the link after word capitalization.
Default value: \"[!@$=_+{}`~\\:;,]\\|\\s-\"."
  :group 'pmwiki-group :type 'regexp)
(defcustom pmwiki-non-word-separating-punct "[()']"
  "Regexp for substrings removed from the link before word capitalization.
Default value: \"[()']\"."
  :group 'pmwiki-group :type 'regexp)

(defcustom pmwiki-freeze-slash-format nil
  "If non-nil, don't follow user choice of slash vs. question-mark.
See `pmwiki-slash-format'."
  :group 'pmwiki-group :type 'boolean)

(defcustom pmwiki-pagelist-hyphen-subgroups t
  "*When non-nil, join hyphenated subgroups in group names,
e.g. Mammal-canine."
  :group 'pmwiki-group :type 'boolean)
(defcustom pmwiki-pagelist-hyphen-regexp "-"
  "*Subgroup separator in group name."
  :group 'pmwiki-group :type 'regexp)
(defcustom pmwiki-pagelist-join-pages t
  "*When non-nil, join pages in a group by their words."
  :group 'pmwiki-group :type 'boolean)
(defcustom pmwiki-default-encoding 'utf-8
  "Default encoding to encode URL arguments
(and buffer contents for emacs-http)."
  :group 'pmwiki-group :type 'encoding)

(defun pmwiki-encode-url-arg (string)
  "Like `url-hexify-string', but uses `pmwiki-default-encoding'."
  (pmwiki-http-url-encode string pmwiki-default-encoding))

;;I've put the function below directly into `http-get.el', but I place
;;it here to remove dependency with emacs-http for emacs 22 operation.
;;It differs from `url-hexify-string' in that it allows any encoding.
(defconst pmwiki-url-unreserved-chars
  '(
    ?a ?b ?c ?d ?e ?f ?g ?h ?i ?j ?k ?l ?m ?n ?o ?p ?q ?r ?s ?t ?u ?v ?w ?x ?y ?z
    ?A ?B ?C ?D ?E ?F ?G ?H ?I ?J ?K ?L ?M ?N ?O ?P ?Q ?R ?S ?T ?U ?V ?W ?X ?Y ?Z
    ?0 ?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9
    ?- ?_ ?. ?! ?~ ?* ?' ?\( ?\))
  "A list of characters that are _NOT_ reserved in the URL spec.
This is taken from RFC 2396.")
;;;code from `emacs/url-util.el' [lukstafi]
(defun pmwiki-http-url-encode (string encoding)
  "Return a new string that is STRING URI-encoded.
First, STRING is converted to ENCODING, if necessary.  Then, for each
character in the ENCODING string, those found in `url-unreserved-chars'
are left as-is, all others are represented as a three-character
string: \"%\" followed by two lowercase hex digits."
  ;; To go faster and avoid a lot of consing, we could do:
  ;; 
  ;; (defconst url-hexify-table
  ;;   (let ((map (make-vector 256 nil)))
  ;;     (dotimes (byte 256) (aset map byte
  ;;                               (if (memq byte url-unreserved-chars)
  ;;                                   (char-to-string byte)
  ;;                                 (format "%%%02x" byte))))
  ;;     map))
  ;;
  ;; (mapconcat (curry 'aref url-hexify-table) ...)
  (mapconcat (lambda (byte)
               (if (memq byte pmwiki-url-unreserved-chars)
                   (char-to-string byte)
                 (format "%%%02x" byte)))
             (if (multibyte-string-p string)
                 (encode-coding-string string encoding)
               string)
             ""))

(defun pmwiki-http-log-function (string)
  "Debug logging (for emacs-http)."
  (with-current-buffer (get-buffer-create "*URL-DEBUG*")
    (insert string "\n")))

(defcustom pmwiki-debug-level 3
  "*When a positive number, turn on debugging.
Three levels of debugging:
* >=1: URL debugging (in the *URL-DEBUG* buffer)
* >=2: keep responses to save requests (*DEBUG-SAVE: ...* buffers)
* >=3: keep responses to load requests (*DEBUG-LOAD: ...* buffers)
" :group 'pmwiki-group :type 'integer)

(if (require 'url nil t)
    (progn
      (when (and pmwiki-debug-level (<= 1 pmwiki-debug-level))
	(setq url-debug t)
	(require 'url-auth)))
  (message
   "Using `emacs-http' instead of URL from Emacs 22.")
  ;;(sleep-for 1)
  (unless (and (require 'http-get nil t) (require 'http-post nil t))
    (error "Upgrade to Emacs 22 or install `emacs-http'."))
  (when (<= 1 pmwiki-debug-level)
    (setq http-log-function
	  'pmwiki-http-log-function))
  (setq pmwiki-http-action-function 'pmwiki-http-action-alternative))

(defcustom pmwiki-max-redirections 5
  "If non-nil, process that much redirections.
Keep all information across redirections
(page to visit, contents to save)." :group 'pmwiki-group :type 'integer)
(defvar pmwiki-redirect-count pmwiki-max-redirections
  "How many redirections left allowed.")

(defcustom pmwiki-fill-column 76 "*Fill column width for `pmwiki-mode'."
  :group 'pmwiki-group :type 'integer)
(defcustom pmwiki-mode-hooks nil "" :group 'pmwiki-group :type 'hook)
(defcustom pmwiki-save-before-hooks nil ""
  :group 'pmwiki-group :type 'hook)
(defcustom pmwiki-menu-entry-max-length 70
  "*Maximal number of menu entry characters."
  :group 'pmwiki-group :type 'integer)

(defcustom pmwiki-decode nil
  "Function called after loading wiki source. No arguments are passed.
It is supposed to process current buffer contents.
See also `pmwiki-encode'."
  :group 'pmwiki-group
  :type '(choice function (const :tag "No encoding" nil)))
(defcustom pmwiki-encode nil
  "Function called on `buffer-string' before saving it as wiki source.
It is called by `pmwiki-default-save-function', can be bypassed when
customizing `pmwiki-save-function'.
It is supposed to be the inverse of `pmwiki-decode'."
  :group 'pmwiki-group
  :type '(choice function (const :tag "No decoding" nil)))

(defcustom pmwiki-author ""
  "*\"Name\" that shows up as author of the changes
when a page is saved from `pmwiki-mode'."
  :group 'pmwiki-group :type 'string)

(defcustom pmwiki-default-page-name "\\0"
  "*Default page name when page is not given, like in [[Group.]] links.
\\0 is substituted by group name."
  :group 'pmwiki-group :type 'string)

(defcustom pmwiki-minor-edit-sel-type 'auto
  "*Determines how \"minor edit\" option is selected."
  :group 'pmwiki-group
  :type '(choice (const :tag "Semi-automatic" auto)
		 (const :tag "Always ask" always-ask)
		 (const :tag "Don't change my settings" basic)))

(defvar pmwiki-minor-edit
  (equal pmwiki-minor-edit-sel-type 'auto)
  "If non-nil, buffer changes are considered to be minor-edit.")
(make-variable-buffer-local 'pmwiki-minor-edit)

;;FIXME: This doesn't work because I don't know how to evaluate
;;       interactive prompt.
(defcustom pmwiki-default-pagelist-page "Site.SideBar"
  "*The default pagelist page. See `pmwiki-rescan-pages'."
  :group 'pmwiki-group :type '(restricted-sexp :match-alternatives
					       (pmwiki-page-p)))


;; ----------------------------------------------------------------------
;;
;;	Auxiliary helper function
;;
(defun pmwiki-default-string (s s0)
  "Return S if not empty, otherwise return S0"
  (if (string= s "") s0 s))

(defun pmwiki-URIp (name)
  "Returns t if NAME matches a URI pattern `pmwiki-base-pattern'."
  (and name
       (let ((case-fold-search nil))
	 (if (string-match pmwiki-HTTP-pattern name)
	     (if (string-match pmwiki-base-pattern name) t
	       nil)
	   nil))))



;; ----------------------------------------------------------------------
;;
;;	Main code
;;
;; Define the `pmwiki-mode'. 
;;
;; Have to modify patterns for faces. List of faces:
;; builtin, comment, constant, doc, function, keyword, string, type, variable,
;; warning
;;	[=...=]			- string
;;	[[#<target>]]		- constant
;;	[[<uri> <text>]]	- type
;;  ;;	 <monospace>		- comment  (not used anymore)
;;	@@<monospace>@@		- comment
;;	''<emp>''		- type
;;	'''<strong>'''		- function
;;	'''''<extra>'''''	- warning
;;	*...			- builtin
;;	#...			- doc
;;	!...			- function
;;	:..: : <indented par.>	- doc
;;
;; Maybe remove sgml-tag-alist?

;; Special faces
(defface pmwiki-question-face
  '((t (:bold t)))
  "Used to indicate a question in a PmWiki page.")

(defface pmwiki-answer-face
  '((t (:bold t :italic t)))
  "Used to indicate an answer in a PmWiki page.")

;;FIXME: workaround for strange bug
(defvar pmwiki-question-face
  '((t (:bold t)))
  "Used to indicate a question in a PmWiki page.")
(defvar pmwiki-answer-face
  '((t (:bold t :italic t)))
  "Used to indicate an answer in a PmWiki page.")

(defun pmwiki-kill-buffer-cleanup ()
  "Cleanup esp. for buffers opened with `pmwiki-edit'."
  ;;FIXME: More could be done here,
  ;;       for example cleaning `pmwiki-buffers'...
  (if (equal major-mode 'pmwiki-mode)
      (when pmwiki-original (kill-buffer pmwiki-original))
    (when (and (boundp 'mumamo-main-major-mode)
	       (equal mumamo-main-major-mode 'pmwiki-mode))
      (let* ((locvars (assoc (current-buffer) pmwiki-page-local-vars))
	     (orig (assoc 'pmwiki-original locvars)))
	(when (cdr orig) (kill-buffer (cdr orig)))))))

(defun pmwiki-really-kill-buffer ()
  (or (not (buffer-modified-p))
      (if (equal major-mode 'pmwiki-mode)
	  (yes-or-no-p (concat "Page " (buffer-name) " is not saved."
			       " Discard changes? "))  
	(if (and (boundp 'mumamo-main-major-mode)
		   (equal mumamo-main-major-mode 'pmwiki-mode))
	    (yes-or-no-p (concat "Page " (buffer-name) " is not saved."
				 " Discard changes? "))
	  t))))

(defun pmwiki-save-some-pages ()
  "Ask to save modified pages."
  (error "Not implemented yet."))

(defvar pmwiki-page-local-vars nil
  "Global alist with alists of pmwiki buffer-local variables for a page.")

(defun pmwiki-save-local-variables ()
  "Save pmwiki-mode local variables in `pmwiki-page-local-vars'."
  (let ((locvars ))
    (setcdr (assoc (current-buffer) pmwiki-page-local-vars)
	    (list (cons 'pmwiki-timestamp pmwiki-timestamp)
		  (cons 'pmwiki-location-list pmwiki-location-list)
		  (cons 'pmwiki-original pmwiki-original)
		  (cons 'pmwiki-minor-edit pmwiki-minor-edit)
		  (cons 'pmwiki-minor-edit-count pmwiki-minor-edit-count)
		  (cons 'pmwiki-minor-edit-counting pmwiki-minor-edit-counting)
		  (cons 'pmwiki-parent-ee pmwiki-parent-ee)
		  (cons 'pmwiki-page-toc pmwiki-page-toc)
		  (cons 'pmwiki-slash-format pmwiki-slash-format)
		  (cons 'url-http-no-redirect url-http-no-redirect)
		  ))))

(defvar pmwiki-not-pmwiki-mode-buffer nil
  "If non-nil, buffer is not a proper pmwiki-mode buffer.")
(make-variable-buffer-local 'pmwiki-not-pmwiki-mode-buffer)

(define-derived-mode pmwiki-mode text-mode "PmWiki"
  "`pmwiki-mode` v0.4 is a Mode to edit PmWiki pages (http://www.pmwiki.org).

Typically you start by using the function `pmwiki-open' to open a URI, e.g.
	http://www.pmwiki.org/wiki/Main/WikiSandbox
Once you have opened a wiki page, you can simply use `pmwiki-open'
again with a simple argument such as 'Main.OtherPage' to open another
page in the same site.

As a special case, you can also use `pmwiki-open' to open a wiki page
from the site pmwiki.org (since it is the default site) even if you
are currently not in a buffer that contains an opened wiki page.

Pages in the `pmwiki-main-wiki-base-uri' site can always be opened using
`mywiki-open', since this function always assumes that the page names refer
to that site (giving the URI of a page overrides this bevhaviour however).

Note that it is not recommended to use `pmwiki-mode' as a command to
start editing a wiki page - it likely won't work.

Once a page has been opened, you can edit it and then save it using
`pmwiki-save' or `pmwiki-save-as'. The latter function allows you to
save the page with a new name, and even on a different wiki engine by
giving an URI as argument.

To view the wiki page that you are editing in a browser, first save it
and then use the command `pmwiki-browse'.

While editing the page, you can use `pmwiki-next' and `pmwiki-prev' to
quickly go to the next and previous links. And when the point is on a
link, you can use `pmwiki-follow' to goto the page that the link
points to, i.e. that page is opened in a new buffer.

Interactive functions:
`pmwiki-open'    - Open wiki page specified by group/name or URI.
                   The default site is pmwiki.org.
`pmwiki-show-uri` - Show the URI of the current wiki page.
`pmwiki-next'    - Goto the next [[link]].
`pmwiki-prev'    - Goto the previous [[link]].
`pmwiki-follow'  - Open (goto) page pointed to by link at point.
`pmwiki-save'    - Save current buffer to the wiki engine.
`pmwiki-save-as' - Save buffer to new page specified by group/name or URI.
`pmwiki-reload'  - Reload the page.
`pmwiki-browse'  - Show current buffer in browser.
`pmwiki-toc'     - Show Table of Contents for current page.
`pmwiki-search'  - Search the wiki site for a text.
`pmwiki-map-site'  - Generate a map of the site (all groups and pages).
`pmwiki-delete'	 - Delete a page
`pmwiki-rename'	 - Save a page under a different name and delete the original

`mywiki-open'       - Open a page from the LyX wiki.
`mywiki-save-as'    - Save current buffer to page at the LyX wiki.

\\{pmwiki-mode-map}"
  (font-lock-add-keywords
   nil
   '(
     ;;("^[ \t].+?$" . font-lock-comment-face)		;  <monospace>
     ("\\[=[^=]*=\\]" . font-lock-function-name-face)	; [= ... =]
     ("@@[^ \t@][^@]*[^ \t@]@@" . font-lock-comment-face) ; @@a .. b@@
     ("\\(^[*#]+\\)[^*#]" 1 font-lock-constant-face)	; {*|#}+ ...
     ("^!+[^!].*" . font-lock-constant-face)		; !+ ...
     ("\\[\\[<<\\]\\]" . font-lock-comment-face)	; [[<<]]
     ;;("\\[\\[#[^]]+\\]\\]" . font-lock-constant-face)	; [[#<target>]]
     ;;("\\[\\[[^#].*?\\]\\]" . font-lock-type-face)	; [[ ... ]]
     ("\\[\\[.*?\\]\\]" . font-lock-type-face)	; [[ ... ]]
     ("\\\\$" . font-lock-keyword-face)		;     \
     ("^:+ +:" . font-lock-doc-face)			; :..: : 
     ("^:[ \t]*[^ \t:]+[ \t]*+:" . font-lock-string-face) ; : term : 
     ("%[^ \t%][^%]*[^ \t%]%" . font-lock-warning-face) ; %color = red%
     ("^Q:" . pmwiki-question-face)			; Q:
     ("^A:" . pmwiki-answer-face)			; A:
     ))

  (font-lock-mode 1)
  (goto-address)
  (setq indent-tabs-mode t)
  (let ((local-vars (assoc (current-buffer) pmwiki-page-local-vars)))
    (if local-vars
	(dolist (varval (cdr local-vars))
	  (set (make-local-variable (car varval)) (cdr varval)))
      (setq pmwiki-not-pmwiki-mode-buffer t)))
  (set (make-local-variable 'tool-bar-map)
       pmwiki-tool-bar-map)
  (set-fill-column pmwiki-fill-column)
  (unless pmwiki-not-pmwiki-mode-buffer
    (pmwiki-build-menu))
  (set (make-local-variable 'mode-line-buffer-identification)
       (pmwiki-create-mode-line-string))
  (force-mode-line-update)
  (add-hook 'menu-bar-update-hook 'pmwiki-build-menu nil t)
  (add-hook 'post-command-hook 'pmwiki-minor-edit-counter nil t)
  ;;Set globally, to work with mumamo submodes
  (add-hook 'first-change-hook 'pmwiki-minor-edit-start-counter nil nil)
  (add-hook 'kill-buffer-hook 'pmwiki-kill-buffer-cleanup nil nil)
  (unless pmwiki-not-pmwiki-mode-buffer
    (add-hook 'change-major-mode-hook 'pmwiki-save-local-variables nil t))
  ;;(make-local-variable 'speedbar-initial-expansion-list-name)
  ;;(setq speedbar-initial-expansion-list-name "PmWiki")
  (set 'TeX-header-end "^[^%\n]*\\\\begin *{document}")
  (set 'TeX-trailer-start "^[^%\n]*\\\\end *{document}")
  (set 'TeX-master (concat pmwiki-TeX-master-directory
			   pmwiki-TeX-master-file))
  (cd pmwiki-TeX-master-directory)
  (unless pmwiki-not-pmwiki-mode-buffer
    (run-hooks 'pmwiki-mode-hooks)))

;;Set global query, to work with mumamo submodes
(push 'pmwiki-really-kill-buffer kill-buffer-query-functions)

;; Link matching algorithm (v0.4):
;;
;; 1: extract link from "[[" to "|" orelse from "->" to "]]"
;;    orelse from "[[" to "]]"
;;
;; 2: remove non-word-separationg punctuation: e.g. ()'
;;
;; 3: extract the WikiEngine address part if there is one
;;
;; 4: extract anchor if there is one
;;
;; 5: capitalize all words not directly preceded by "-"
;;
;; 6: remove all word-separating punctuation: e.g. SPACE!@$=_+\{}`~\
;;
;; 7: extract parts [<Group>{./}]<Page>[#<anchor>], if Page is preceded
;;    by "!", set group to Category, if by "~", to Profiles,
;;    if Page is not given, set according to `pmwiki-default-page-name'


(defun pmwiki-capitalize (str)
  "Capitalize words in STR without changing the case of inner letters."
  (replace-regexp-in-string "[^-%0-9]\\<[a-z]\\|^[a-z]" 'capitalize str))

;; Implenents the matching algorithm, without the first point,
;; used for `pmwiki-follow' and for `pmwiki-open'
(defun pmwiki-link-to-loc (maybe-link &optional no-default)
  "Convert a string with a page, e.g. \"Group.Page\" to a location list, i.e.
	(\"baseURI\" \"Group\"  \"Page\" . \"anchor\")

All parts (base, group, page, anchor) are optional. If base and only one of
group and page is given, then both group and page are set the same.
NO-DEFAULT turns off filling-in the lacking group/page and instead assumes,
that neither group nor page was given and the whole link constitutes base."
  (let (baseURI anchor-beg anchor group page aux)
    (if (or (not maybe-link) (string= maybe-link "")) nil
      (setq maybe-link (replace-regexp-in-string
			pmwiki-non-word-separating-punct "" maybe-link))
      (if  (string= maybe-link "") nil
	(if (string-match pmwiki-base-pattern maybe-link)
	(progn
	  (setq baseURI
		(or (match-string 1 maybe-link)
		    (match-string 3 maybe-link)
		    (match-string 5 maybe-link)
		    (match-string 8 maybe-link))
		aux (substring
		     maybe-link
		     ;; `and's: strange workaround for XEmacs
		     (or (and (match-end 1) (match-end 2))
			 (and (match-end 3) (match-end 4))
			 (and (match-end 5) (match-end 6))
			 (and (match-end 8) (match-end 9)))))
	  (when (string= baseURI "")
	    (setq baseURI nil))
	  (let ((slashmark
		 (or (and (match-end 1) (match-string 2 maybe-link))
		     (and (match-end 3) (match-string 4 maybe-link))
		     (and (match-end 5) (match-string 6 maybe-link))
		     (and (match-end 8) (match-string 9 maybe-link)))))
	    (unless pmwiki-freeze-slash-format
	      (if (string-match "/" slashmark)
		  (setq pmwiki-slash-format t)
		(if (string-match "?" slashmark)
		    (setq pmwiki-slash-format nil))))
	    (when (and (not baseURI) (string= slashmark "/"))
	      (setq baseURI "/")))
	  (setq maybe-link aux)))
    (setq anchor-beg (string-match "##?\\(\\S-+\\)\\s-*$" maybe-link))
    (if anchor-beg
	(progn
	  (setq anchor (match-string 1 maybe-link))
	  (if (string= anchor "")
	      (setq anchor nil))
	  (setq maybe-link (substring maybe-link 0 anchor-beg))))
    (if (and no-default
	     (not (string-match (concat "^\\(.+\\)"
				   pmwiki-main-group-separator
				   "\\(.+?\\)$") maybe-link)))
	(if (string-match "/$" baseURI)
	    `(,(concat baseURI maybe-link) nil nil)
	  `(,(concat baseURI "/" maybe-link) nil nil))
      (setq maybe-link (pmwiki-capitalize maybe-link))
      (setq maybe-link (replace-regexp-in-string
			pmwiki-word-separating-punct "" maybe-link))
      ;; take the last bit as page name (compatible with Hg)
      (if (string-match (concat "^\\(.+\\)"
				pmwiki-main-group-separator
				"\\(.*?\\)$") maybe-link)
	  (progn
	    (setq group (match-string 1 maybe-link))
	    (setq page (match-string 2 maybe-link))
	    (if (string= page "")
		(setq page
		      (replace-regexp-in-string
		       "\\\\0"
		       group pmwiki-default-page-name))))
	(setq page maybe-link)
	(if baseURI
	    (setq group page)))
      (when (and group (string= group ""))
	(setq group nil))      
      (when (and page (string= page ""))
	(setq page nil))      
      `(,baseURI ,group ,page . ,anchor))))))

(defun pmwiki-link-p (maybe-link)
  "Return nil if MAYBE-LINK is not a valid full page address."
  (interactive "sValidate link: ")
  (let ((loc (and (stringp maybe-link)
		  (pmwiki-link-to-loc maybe-link))))
    (if (and loc (car loc) (cadr loc) (caddr loc)) t
      nil)))

(defun pmwiki-page-p (maybe-link)
  "Return nil if MAYBE-LINK is not a valid page address."
  (interactive "sValidate link: ")
  (let ((loc (and (stringp maybe-link)
		  (pmwiki-link-to-loc maybe-link))))
    (if (and loc (cadr loc) (caddr loc)) t
      nil)))

(defcustom pmwiki-prefer-slashed t
  "If non-nil, prefer for example http://pmwiki.org/Main/HomePage
to http://pmwiki.org/?n=Main.HomePage."
  :group 'pmwiki-group :type 'boolean)

(defun pmwiki-loc (P &optional loc-list)
  "Compute relevant information from location list.
If URI is not given, `pmwiki-location-list' is used instead.
P determines what is returned according to this list:
	'base		-> <BaseURI>
	'group		-> <group>
	'page		-> <page>
	'anchor		-> <anchor>
	'groupENC	-> <group> URL-encoded
	'pageENC	-> <page> URL-encoded
	'anchorENC	-> <anchor> URL-encoded
	'name		-> \"<group>.<page>\" (if <anchor> = nil)
	'nameNA		-> \"<group>.<page>\" (NA = No Anchor)
	'name		-> \"<group>.<page>#<anchor>\"
	'nameENC	-> \"<groupENC>.<pageENC>#<anchorENC>\"
	'nameENCNA	-> \"<groupENC>.<pageENC>\"
	'URI		-> \"<BaseURI>?n=<group>.<page>\" (if <anchor> = nil)
	'URINA		-> \"<BaseURI>?n=<group>.<page>\" (NA = No Anchor)
	'URI		-> \"<BaseURI>?n=<group>.<page>#<anchor>\"
	'site		-> <site> (part of BaseURI)
If `pmwiki-slash-format' is t, replace dots and \"?n=\" with slashes above."
  (unless loc-list (set 'loc-list pmwiki-location-list))
  (unless loc-list
    (error "No location given, set `pmwiki-location-list' first!"))
  (unless (symbolp P)
    (error (concat "`pmwiki-loc': Invalid type of argument `P': "
		   (print P))))
  (let ((s (if (stringp P) P (symbol-name P)))
	(anchor-enc (if (stringp (cdddr loc-list))
			(pmwiki-encode-url-arg (cdddr loc-list))
		      nil))
	(page-enc (pmwiki-encode-url-arg (caddr loc-list)))
	(group-enc (pmwiki-encode-url-arg (cadr loc-list))))
    (cond
     ((string-equal s "base") (car loc-list))
     ((string-equal s "group") (cadr loc-list))
     ((string-equal s "page") (caddr loc-list))
     ((string-equal s "anchor") (cdddr loc-list))
     ((string-equal s "groupENC") group-enc)
     ((string-equal s "pageENC") page-enc)
     ((string-equal s "anchorENC") anchor-enc)
     ((string-equal s "name")
      (concat (cadr loc-list)
	      (if pmwiki-slash-format "/" ".") (caddr loc-list)
	      (if anchor-enc
		  (concat "#" (cdddr loc-list)) "")))
     ((string-equal s "nameNA")
      (concat (cadr loc-list)
	      (if pmwiki-slash-format "/" ".") (caddr loc-list)))
     ((string-equal s "nameENC")
      (concat group-enc
	      (if pmwiki-slash-format "/" ".") page-enc
	      (if anchor-enc
		  (concat "#" anchor-enc) "")))
     ((string-equal s "nameENCNA")
      (concat group-enc
	      (if pmwiki-slash-format "/" ".") page-enc))
     ((string-equal s "URINA")
      (concat (car loc-list)
	      (cond
	       ((string-match "^https?://[^/]+$" (car loc-list))
		(if pmwiki-prefer-slashed
		    (progn
		      (unless pmwiki-freeze-slash-format
			(setq pmwiki-slash-format t))
		      "/")
		  (unless pmwiki-freeze-slash-format
		    (setq pmwiki-slash-format nil))
		  "/?n="))
	       ((string-match "/$" (car loc-list))
		(if (not (or pmwiki-slash-format pmwiki-prefer-slashed))
		    "?n="
		  (unless pmwiki-freeze-slash-format
		    (setq pmwiki-slash-format t))
		  ""))
	       (pmwiki-slash-format "/")
	       (t "?n=")) group-enc
	      (if pmwiki-slash-format "/" ".") page-enc))
     ((string-equal s "URI")
      (concat (pmwiki-loc 'URINA loc-list)
	      (if anchor-enc
		  (concat "#" anchor-enc) "")))
     ((string-equal s "site")
      (and
       (car loc-list)
       ;;return nil if base is not an absolute address,
       ;;but a local address like /wiki
       (string-match pmwiki-site-pattern (car loc-list))
       (match-string 1 (car loc-list))))
     (t (error (concat "Invalid argument `P' of `pmwiki-loc': "
		       (print P)))))))

(defun pmwiki-merge-uri-base (base old-base)
  "Merge wiki-engine bases: when new base address is local,
add site from OLD-BASE."
  (if (string-match pmwiki-HTTP-pattern base) base
    (if (string-match (concat pmwiki-HTTP-pattern "//[^/]+") old-base)
	(concat (match-string 0 old-base) base)
      base)))

(defun pmwiki-merge-loc (loc1 &optional loc2)
  "Merge two location lists: if LOC1 doesn't specify something, use LOC2.
When LOC2 is not given, use `pmwiki-location-list'."
  (unless loc2 (setq loc2 pmwiki-location-list))
  (if (not loc2) loc1
    `( ,(or (car loc1) (car loc2))
       ,(or (cadr loc1) (cadr loc2))
       ,(or (caddr loc1) (caddr loc2))
       . ,(cdddr loc1))))

 
(defun pmwiki-toggle-minor-edit ()
  "Toggle minor edit."
  (interactive)
  (setq pmwiki-minor-edit (not pmwiki-minor-edit))
  (force-mode-line-update)
  )

(defcustom pmwiki-minor-edit-threshold 10
  "*After that many commands (e.g. keypresses) switch minor edit off.
Counting is started after first buffer modification."
  :group 'pmwiki-group :type 'integer)

(defvar pmwiki-minor-edit-count nil
  "See `pmwiki-minor-edit-counter'.")
(make-variable-buffer-local 'pmwiki-minor-edit-count)

(defvar pmwiki-minor-edit-counting nil
  "See `pmwiki-minor-edit-start-counter'.")
(make-variable-buffer-local 'pmwiki-minor-edit-counting)

(defun pmwiki-minor-edit-counter ()
  "Count commands to turn off minor edit after `pmwiki-minor-edit-threshold'
of them. Count only when `pmwiki-minor-edit-counting' is non-nil.
See `pmwiki-minor-edit-start-counter'. This is a `post-command-hook'."
  (when (and pmwiki-minor-edit-counting
	     (equal pmwiki-minor-edit-sel-type 'auto))
    (unless pmwiki-minor-edit-count (setq pmwiki-minor-edit-count 0))
    (incf pmwiki-minor-edit-count)
    (when (< pmwiki-minor-edit-threshold pmwiki-minor-edit-count)
      (setq pmwiki-minor-edit-count 0)
      (setq pmwiki-minor-edit nil)
      (setq pmwiki-minor-edit-counting nil)
      (force-mode-line-update))))

(defun pmwiki-minor-edit-start-counter ()
  "Set `pmwiki-minor-edit-counting' to t, to start `pmwiki-minor-edit-counter'.
This is a `first-change-hook'."
  (if (equal major-mode 'pmwiki-mode)
      (when (equal pmwiki-minor-edit-sel-type 'auto)
	(setq pmwiki-minor-edit-counting t))
    (when (and (boundp 'mumamo-main-major-mode)
	       (equal mumamo-main-major-mode 'pmwiki-mode))
      (let* ((locvars (assoc (current-buffer) pmwiki-page-local-vars))
	     (mined (assoc 'pmwiki-minor-edit-counting locvars)))
	(when (equal pmwiki-minor-edit-sel-type 'auto)
	  (setcdr mined t))))))


(defun pmwiki-create-mode-line-string ()
  "Used to create the text that goes into the mode line."
  `(,(propertize
     "%09b"
     'help-echo "mouse-1: previous buffer, mouse-3: next buffer"
     'face 'bold
     'local-map
       '(keymap
	(header-line keymap
		     (mouse-3 . mode-line-bury-buffer)
		     (down-mouse-3 . ignore)
		     (mouse-1 . mode-line-unbury-buffer)
		     (down-mouse-1 . ignore))
	(mode-line keymap
		   (mouse-3 . mode-line-bury-buffer)
		   (mouse-1 . mode-line-unbury-buffer)
		   (down-mouse-1 . ignore))))
    " "
    ,@(if (not (equal pmwiki-minor-edit-sel-type 'always-ask))
	  (list
	   (propertize "MinEd: "
		       ;;FIXME: key shortcut hardcoded
		       'help-echo "Saving as minor edit? (C-c C-e) [toggle]"
		       'local-map
		       '(keymap
			 (header-line keymap
				      (mouse-1 . pmwiki-toggle-minor-edit)
				      (down-mouse-1 . ignore))
			 (mode-line keymap
				    (mouse-1 . pmwiki-toggle-minor-edit)
				    (down-mouse-1 . ignore))))
	   '(:eval (if pmwiki-minor-edit
		      (propertize "ON " 'face 'bold) "OFF"))
	   " "))
    ,(propertize
      (if pmwiki-location-list
	  (format "[%s]" (pmwiki-loc 'site))
	"[?]")
      'face 'italic 'mouse-face 'bold-italic
    'help-echo pmwiki-page-uri)
    " "
    ))

(defun pmwiki-show-uri ()
  "Show the URI for the wiki page being edited in the current buffer."
  (interactive)
  (message (pmwiki-loc 'URI)))

(defcustom pmwiki-sort-buffers t
  "*If nil, store buffers so that first opened comes first in OpenedPages.
Otherwise, sort buffers by their locations (this gives better hierarchy).
See `pmwiki-buffers'."
  :group 'pmwiki-group :type 'boolean)

(defvar pmwiki-buffers nil
  "Association list mapping locations to buffers
which have them as `pmwiki-location-list'.")
(defvar pmwiki-past-locations nil
  "Alist mapping locations to previously visited buffers
which have them as `pmwiki-location-list'.")
(defvar pmwiki-future-locations nil
  "Alist mapping locations to buffers skipped with `pmwiki-backward'
which have them as `pmwiki-location-list'.")


(defcustom pmwiki-reopen-pages nil
  "*If non-nil, reopen pages when following them with a different anchor."
  :group 'pmwiki-group :type 'boolean)

(defvar pmwiki-original nil
  "Original contents of a page (as when loaded last time).")
(make-variable-buffer-local 'pmwiki-original)

(defcustom pmwiki-original-buffer-first t
  "*When non-nil, buffer with original contents is the buffer A
and the pmwiki-mode buffer is the buffer B in emacs-diff.
When nil, roles are reversed."
  :group 'pmwiki-group :type 'boolean)

(defun pmwiki-compare-original ()
  "Compare current PmWiki-buffer with original contents."
  (when pmwiki-original
    (if pmwiki-original-buffer-first
	(ediff-buffers pmwiki-original (current-buffer))
      (ediff-buffers (current-buffer) pmwiki-original))))

(defun pmwiki-get-loc-buffer (loc)
  "Get a buffer from `pmwiki-buffers' list."
   (let ((buf (if pmwiki-reopen-pages
		  (assoc loc pmwiki-buffers)
		(assoc-if (lambda (old-loc)
			    (pmwiki-equal-loc old-loc loc))
			  pmwiki-buffers))))
     (if (and buf (buffer-live-p (cdr buf))) (cdr buf)
       (when (and buf (not (buffer-live-p (cdr buf))))
	 (setq pmwiki-buffers (remove buf pmwiki-buffers)))
       nil)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Architecture:
;;
;; Loading uses method GET and has four entry points now: editing a
;; new page or reloading, silently getting the source (for
;; comparison), getting the html to collect links (site-map), getting
;; the html with search results. Saving uses method POST and has two
;; entry points now: saving a page and uploading a file. The diagram
;; points generally correspond to functions, but the <<double>> points
;; come in two versions: default, for emacs 22 (url package) and
;; alternative, for emacs 21 (http package). <<http-loop>>
;; is the callback of the network process. <cont> is the continuation
;; of the action that called <get-source>.
;;
;;
;; <edit>  <get-source>  <sitemap> <search>  <save> <upload>
;;       \        \         /        /        /     /
;;         -----<<http-action>>--------------------
;;                     |
;;              -<<http-loop>>-----------------
;;            /                 \               \
;;     <decode-source>       <get-pagelist>  <report-saved>
;;        /      \             /        \
;;  <edit-cont> <cont>  <show-sitemap> <show-search>
;;
;;

;;FIXME: upload not implemented yet

(defun pmwiki-source-action (who)
  (cond
   ((equal (pmwiki-action-kind who) 'edit) "edit")
   ((equal (pmwiki-action-kind who) 'read) "source")
   (t (error (concat "`pmwiki-source-action' "
		     (print who) " - not a get source kind of action")))))

;; ----------------------------------------------------------------------
;;
;; `pmwiki-edit' - main function used to load a PmWiki-page into a buffer
;;
;;;###autoload
(defun pmwiki-edit (loc &optional buf)
  "Download the wiki page specified by location list LOC
into buffer BUF or a new buffer, or if (equal BUF 'find) and buffer with
location LOC exists, switch to that buffer.
Return a cons of: nil or buffer which lives untill page is loaded,
buffer into which page is loaded."
  (unless (or (not buf) (equal buf 'find) (stringp buf) (bufferp buf))
    (error (concat "`pmwiki-edit': wrong type of BUF="
		   (print buf))))
  (unless buf (setq buf (generate-new-buffer
			 (pmwiki-loc 'nameNA loc))))
  (when pmwiki-arrived-from-ee
      (setq pmwiki-from-ee-parent (current-buffer)))
  (if (not (equal buf 'find))
      (pmwiki-edit-start loc buf 'edit)
    (setq buf (pmwiki-get-loc-buffer loc))
    (if (not buf)
	(pmwiki-edit-start loc (generate-new-buffer
				(pmwiki-loc 'nameNA loc)) 'edit)
      (switch-to-buffer buf)
      (setq pmwiki-location-list loc)
      (goto-char (point-min))
      (pmwiki-showpage (cdddr loc))
      (cons nil buf))))

;;FIXME: it would be desirable to have 'POST "authform" here
;;       when we can guess password
(defun pmwiki-edit-start (loc buf who)
  (let ((still-running (make-symbol "still-running")))
    (set still-running t)
    (funcall pmwiki-http-action-function 'GET loc buf who
	     `(("author" . ,pmwiki-author)
	       ("action". ,(pmwiki-source-action who)))
	     still-running nil nil nil nil
	     (when (equal who 'edit) 'pmwiki-edit-passwd-fallback))
    (cons still-running buf)))

(defcustom pmwiki-always-edit nil
  "If non-nil, assume edit on edit vs browse."
  :group 'pmwiki-group :type 'boolean)

(defun pmwiki-edit-passwd-fallback (loc buf still-running passwd-kind
					&optional action-args)
  "Fallback to fill in password from `pmwiki-edit-start'.
ACTION-ARGS are ignored!"
  (if (or
       pmwiki-always-edit (equal passwd-kind 'passwd-guessed)
       (y-or-n-p
	(concat "Do you want to edit page "
		(pmwiki-loc 'nameNA loc)
		" (y), or only browse it (n)? ")))
      (funcall pmwiki-http-action-function 'POST loc buf 'edit
	       `(("author" . ,pmwiki-author)
		 ("action". "edit")
		 ("authform" . "1"))
	       still-running)
    (funcall pmwiki-http-action-function 'GET loc buf 'browse
	     `(("author" . ,pmwiki-author)
	       ("action". "source"))
	     still-running)))

(defun pmwiki-get-source (loc cont &optional buf with-timestamp)
  "Download the wiki page source specified by location list LOC
into buffer BUF or a new buffer, don't switch into `pmwiki-mode'.
Call CONT with current buffer and that buffer as args."
  (unless (or (not buf) (stringp buf) (bufferp buf))
    (error (concat "`pmwiki-get-source': wrong type of BUF="
		   (print buf))))
  (let ((still-running (make-symbol "still-running"))
	(who (if with-timestamp 'get-edit-source 'get-source)))
    (set still-running t)
    (funcall pmwiki-http-action-function 'GET loc buf who
	   `(
	     ("author" . ,pmwiki-author)
	     ("action" . ,(pmwiki-source-action who))) still-running
	     nil nil nil
	   (list cont (current-buffer))
	   (when with-timestamp 'pmwiki-get-source-passwd-fallback))
    still-running))

(defun pmwiki-get-source-passwd-fallback (loc buf still-running passwd-kind
					      action-args)
  (funcall pmwiki-http-action-function 'POST loc buf 'get-edit-source
	   `(("author" . ,pmwiki-author)
	     ("action". "edit")
	     ("authform" . "1"))
	   still-running
	   nil nil nil
	   action-args))


(defun pmwiki-map-site (&optional arg)
  "Access the \"SiteMap\" menu, with prefix: rescan the site map."
  (interactive "P")
  (if (or arg (>= 3 (length
		     (tmm-get-keybind [menu-bar PmWiki SiteMap]))))
      (call-interactively 'pmwiki-sitemap)
    (setq pmwiki-current-buffer (current-buffer))
    (when pmwiki-ee (pmwiki-ee-menubar-sitemap))
    nil))


(defun pmwiki-sitemap (listpage)
  "Ask the server for pagelist and scan the results into hierarchical menu.
LISTPAGE should default to `pmwiki-default-sitemap-page' (FIXME)."
  (interactive "sPage with pagelist (default `Site.SideBar'): ")
  ;;FIXME: how to change interactive prompt? can't customize default
;;   (interactive (concat "sPage with pagelist on " (pmwiki-loc 'site)
;; 		       " (default `" pmwiki-default-pagelist-page "'): "))
  (message "Creating page list...")
  (setq pmwiki-current-buffer (current-buffer))
  (let ((site (pmwiki-loc 'site))
	(base (pmwiki-loc 'base))
	(still-running (make-symbol "still-running")))
    (set still-running t)
    (funcall pmwiki-http-action-function 'GET
	     (pmwiki-merge-loc
	      (pmwiki-link-to-loc
	       (or (and (not (string= listpage "")) listpage)
		   "Site.SideBar"))) nil 'sitemap nil
		   still-running nil nil
		   nil `(pmwiki-sitemap-cont
			 ,(pmwiki-sitemap-defentry site)
			 nil nil nil ,base ,(current-buffer)))
    still-running))

(defun pmwiki-search (search-term)
  "Ask the server for pagelist and scan the results into hierarchical menu.
LISTPAGE defaults to `pmwiki-default-pagelist-page'."
  (interactive "sSearch for (default: go to last search results): ")
;;   (interactive (concat "sSearch " (pmwiki-loc 'site)
;; 		       " for: "))
  (message "Creating search page list...")
  (if (or (not search-term) (string= search-term ""))
      (when pmwiki-ee
	(setq pmwiki-current-buffer (current-buffer))
	(pmwiki-ee-menubar-search)
	nil)
    (let ((site (pmwiki-loc 'site))
	  (base (pmwiki-loc 'base))
	  (still-running (make-symbol "still-running")))
      (set still-running t)
      (setq pmwiki-current-buffer (current-buffer))
      (setq pmwiki-last-search-term search-term)
      (funcall pmwiki-http-action-function 'GET
	       pmwiki-location-list
	       nil 'search
	       `(("action". "search")
		 ("q" . ,search-term)) still-running nil nil nil
		 `(pmwiki-search-cont
		   ,(pmwiki-search-defentry site)
		   ,search-term nil nil ,base ,(current-buffer)))
      still-running)))

(defcustom pmwiki-no-summary nil
  "If non-nil, don't ask for summary and send empty summary."
  :group 'pmwiki-group :type 'boolean)

(defun pmwiki-location-consistency-check ()
  "Check if `pmwiki-location-list' agrees with buffer name."
  (when (and (boundp 'pmwiki-location-list) pmwiki-location-list)
    (let ((nam (buffer-name)))
      (when (string-match "^\\([^./]*\\)[./]\\([^<]*\\)\\($\\|<\\d+>$\\)" nam)
	(unless (and (string= (cadr pmwiki-location-list) (match-string 1 nam))
		     (string= (caddr pmwiki-location-list) (match-string 2 nam)))
      (error "Location inconsistent with buffer name"))))))

(defun pmwiki-save (&optional toggle-summary contents)
  "Uploads current buffer to the wiki.
With TOGGLE-SUMMARY a string, uses it as a summary.
Otherwise with TOGGLE-SUMMARY, inverses the meaning of `pmwiki-no-summary'.
With CONTENTS, ignores summary and saves CONTENTS instead of buffer contents."
  (interactive "P")
  (pmwiki-location-consistency-check)
  (setq pmwiki-redirect-count pmwiki-max-redirections)
  (when (equal pmwiki-minor-edit-sel-type 'always-ask)
    (setq pmwiki-minor-edit (y-or-n-p "Is this a minor edit? ")))
  (run-hooks 'pmwiki-save-before-hooks)
  (let* ((summary (or
		   (when (stringp toggle-summary) toggle-summary)
		   (when (or
			     contents
			     (if toggle-summary
			       (not pmwiki-no-summary)
			     pmwiki-no-summary)) "")
		      (read-string "Summary of changes: ")))
	 (text (or contents
		   (buffer-substring-no-properties (point-min) (point-max))))
	 (text (if pmwiki-encode (funcall pmwiki-encode text) text))
	 (still-running (make-symbol "still-running")))
    (set still-running t)
    ;;XXX: because of emacs-http on Emacs 21, `pmwiki-http-action-function'
    ;;     is called last (`pmwiki-http-action-alternative' doesn't return?)
    (setq pmwiki-minor-edit t)
    (setq pmwiki-minor-edit-counting nil)
    (setq pmwiki-minor-edit-count nil)
    (set-buffer-modified-p nil)
    (funcall
     pmwiki-http-action-function 'POST pmwiki-location-list
     `(timestamp . ,(current-buffer)) 'save
     `(("action" . "edit")
       ("postedit" . "1")
       ("csum" . ,summary)
       ("author" . ,pmwiki-author)
       ("diffclass" . ,(if pmwiki-minor-edit "minor" ""))
       ("basetime" . ,pmwiki-timestamp)
       ("text" . ,text)) still-running
       nil nil nil (current-buffer))
    still-running))

(defvar pmwiki-http-action-function 'pmwiki-http-action-default
  "Specifies the function used to interact with server. Function arguments:
 (request loc buf who headers still-running
  &optional passwd-auth passwd-kind visited-locs action-args)
It should load non-blockingly contents into a new or existing buffer,
then call (`pmwiki-action-cont' who) in that buffer.
See `pmwiki-http-action-default'.")


(defun pmwiki-action-kind (action-kind)
  (cond
   ((equal 'browse action-kind) 'read)
   ((equal 'edit action-kind) 'edit)
   ((equal 'save action-kind) 'edit)
   ((equal 'get-source action-kind) 'read)
   ((equal 'get-edit-source action-kind) 'edit)
   (t action-kind)))

(defun pmwiki-parse-failure (who)
  "Find in-html indications of failure."
  (goto-char (point-min))
  (or
   (and
    (re-search-forward
     "<title>\\(403 Forbidden\\)</title>"
     (point-max) t)
    (match-string 1))
   (and
    (not (equal (pmwiki-action-kind who) 'read))
    (goto-char (point-min))
    (re-search-forward "class='wikimessage'[^>]*>\\([^<]+\\)<"
		       (point-max) t)
    (match-string 1))
   (and
    (goto-char (point-min))
    (re-search-forward "<p class='editconflict'>" (point-max) t)
    "Editing conflict. Resolve by calling <M-x pmwiki-merge-current>")))



(defun pmwiki-http-action-default
  (request loc buf who headers still-running
	   &optional passwd-auth passwd-kind visited-locs action-args
	   passwd-fallback)
  "Access the wiki page specified by location list LOC.
Use additional HEADERS. Works together with `pmwiki-http-loop-default'."
  (when (not (or (stringp buf) (bufferp buf)
			  (equal 'discard buf)
			  (and (consp buf) (equal (car buf) 'timestamp))))
    (error "`pmwiki-http-action-default': wrong buffer argument."))
  (when (and (equal who 'edit) (or (bufferp buf) (stringp buf)))
	     (pmwiki-push-buffer loc buf))
  (when pmwiki-debug-level (setq pmwiki-debug-redirection-stack nil))
  (when (not passwd-kind)
    (setq passwd-kind
	  (if passwd-auth 'passwd-asked 'passwd-guessed)))
  (unless passwd-auth
    (setq passwd-auth (pmwiki-process-passwords
		       (pmwiki-action-kind who) loc)))
  (when (and passwd-auth (not (car passwd-auth)))
    (setq passwd-auth nil))
  (if (and passwd-fallback passwd-auth)
      (funcall passwd-fallback loc buf still-running passwd-kind action-args)
  (let* ((request-data
	  (mapcar
	   (lambda (arg)
	     (concat
	      (car arg) "="
	      (pmwiki-encode-url-arg (cdr arg))
	      "&")) headers))
	 (request-data (apply 'concat request-data))
	 (passwd-prefix
	  (if passwd-auth
	      (concat "authpw=" (car passwd-auth) "&"
		      (if (cdr passwd-auth)
			  (concat "authid=" (cdr passwd-auth) "&")
			"")) ""))
	 (args (list request loc buf still-running visited-locs
		     who passwd-auth passwd-kind headers action-args
		     passwd-fallback)))
    (if (equal request 'GET)
	(let* ((url (pmwiki-loc 'URINA loc))
	       (url (concat url
			   (if (string-match "\\?" url) "&" "?")
			   passwd-prefix
			   request-data))
	       (url-request-method "GET")
;; 	       (url-http-response-version
;; 		(if (boundp 'url-http-response-version)
;; 		    url-http-response-version
;; 		  "1.0"))
	       ;;TODO: make `url-http-parse-headers' accept this as dynvar
	       ;;(url-http-no-redirect t)
	       proc-buf)
	  (setq
	   proc-buf
	   (url-retrieve url 'pmwiki-http-loop-default (cons url args)))
	  (with-current-buffer proc-buf
	    (setq url-http-no-redirect t)))
      (let* ((url (pmwiki-loc 'base loc))
	     (url-request-method "POST")
;; 	     (url-http-response-version
;; 	      (if (boundp 'url-http-response-version)
;; 		  url-http-response-version
;; 		"1.0"))
	     (url-request-data
	      (concat
	       "n=" (pmwiki-loc 'nameENCNA loc) "&"
	       passwd-prefix request-data))
	     (url-request-extra-headers
	      '(("Content-Type" .
		 "application/x-www-form-urlencoded")))
	     ;;TODO: make `url-http-parse-headers' accept this as dynvar
	     ;;(url-http-no-redirect t)
	     proc-buf)
	  (setq
	   proc-buf
	   (url-retrieve url 'pmwiki-http-loop-default (cons url args)))
	  (with-current-buffer proc-buf
	    (setq url-http-no-redirect t)))
      ))))

;; This updates `pmwiki-original' a little bit late, but better than
;; letting updated version through in case of error during saving.
(defun pmwiki-update-timestamp (timestamp &optional raw-text)
  "Update `pmwiki-timestamp' and dump buffer contents to `pmwiki-original'."
  (setq pmwiki-timestamp timestamp)
  (when pmwiki-original			; checks edit vs get-source
    (let ((buf-text
	   (or raw-text
	       (buffer-substring-no-properties (point-min) (point-max)))))
    (with-current-buffer pmwiki-original
      (delete-region (point-min) (point-max))
      (insert buf-text)))))

(defun pmwiki-http-loop-fulfill-load ()
  "Relies VERY much on caller context."
  (when (and raw-text (or (bufferp buf) (stringp buf)))
    (with-current-buffer buf
      (delete-region (point-min) (point-max))
      (insert raw-text)))
  (when (and timestamp (or (bufferp buf) (stringp buf)))
    (with-current-buffer buf
      (pmwiki-update-timestamp timestamp)))
  (when (and timestamp (and (consp buf) (equal (car buf) 'timestamp)))
    (with-current-buffer (cdr buf)
      (pmwiki-update-timestamp timestamp raw-text))))


(defun pmwiki-http-loop (http-error redirected raw-text timestamp url
				    request loc
				    buf still-running
				    visited-locs who old-passwd-auth
				    passwd-kind headers action-args
				    passwd-fallback)
  "If STILL-RUNNING is nil, we just entered the loop: create a symbol
to mark that we are still operating.
HEADERS do not contain authentication nor page name."
  (when (and pmwiki-debug-level (<= 2 pmwiki-debug-level))
    (let ((page-text (buffer-substring-no-properties (point-min) (point-max))))
      (with-current-buffer (get-buffer-create
			    (concat "*PMWIKI-DEBUG: " url "*"))
	(insert page-text))))
  (if (not redirected)
      (let* ((authid
	      (progn
		(goto-char (point-min))
		(re-search-forward
		 (regexp-quote"<input type='text' name='authid")
		 (point-max) t)))
	     (authpw
	      (progn
		(goto-char (point-min))
		(re-search-forward
		 (regexp-quote"<input type='password' name='authpw'")
		 (point-max) t)))
	     (failed (pmwiki-parse-failure who))
	     (cur-buf (current-buffer)))
	(kill-buffer cur-buf)
	(if (or authpw authid)
	    (if (and old-passwd-auth (equal passwd-kind 'passwd-asked))
		(progn
		  (unless (equal buf 'discard)
		    (with-current-buffer buf (set-buffer-modified-p t)))
		  ;;FIXME: bug somewhere
		  (error "Wrong password (or user id)"))
	      (if passwd-fallback
		  (funcall passwd-fallback loc buf still-running
			   'passwd-asked action-args)
		(when authid
		  (setq authid
			(read-string "User Authentication. Name: ")))
		(when authpw
		  (setq authpw
			(read-passwd "Action Protected. Password: ")))
		(push (cons (cons (pmwiki-action-kind who) loc)
			    (cons authpw authid))
		      pmwiki-session-passwords)
		(funcall pmwiki-http-action-function
			 request loc buf who headers still-running
			 (cons authpw authid) 'passwd-asked
			 visited-locs action-args)))
	  (unless (or http-error (and (not raw-text) failed))
	    (pmwiki-http-loop-fulfill-load))
	  (funcall (pmwiki-action-cont who) loc buf
		   still-running who nil
		   (and (or http-error (and (not raw-text) failed))
			(concat
			 (cond
			  ((stringp http-error) http-error)
			  ((stringp (caddr http-error)) (caddr http-error))
			  ((numberp (caddr http-error))
			   (number-to-string (caddr http-error)))
			  ((and http-error
			       (caddr http-error)
			       (symbolp (caddr http-error)))
			   (symbol-name (caddr http-error)))
			  (http-error "UNKNOWN ERROR")
			  (t ""))
			 (and http-error failed ", ")
			 failed))
		   action-args)))
      (let* ((new-loc
	      (pmwiki-merge-loc (pmwiki-link-to-loc redirected t)
				loc))
	     (new-visited-locs (cons loc visited-locs))
	     (failed (pmwiki-parse-failure who))
	     (cur-buf (current-buffer)))
	     ;;FIXME: do we need to check for errors here?
	     ;;       :error status and `pmwiki-parse-failure'
	(when (and pmwiki-debug-level (<= 2 pmwiki-debug-level))
	  (push (cons (cons (pmwiki-equal-loc loc new-loc) loc) new-loc)
		pmwiki-debug-redirection-stack))
	(kill-buffer cur-buf)
	(if (find-if
	     (lambda (arg) (pmwiki-strict-equal-url arg new-loc))
	     new-visited-locs)
	    (error (concat "Probably looping redirection while reading "
			   redirected))
	  (if (not pmwiki-max-redirections)
	      (error "Page redirected, set `pmwiki-max-redirections'")
	    (when (and pmwiki-redirect-count
		       (>= 0 pmwiki-redirect-count))
	      (error
	       "`pmwiki-mode' exceeded redirection count"))
	    (when (not pmwiki-redirect-count)
	      (setq pmwiki-redirect-count pmwiki-max-redirections))
	    (setq pmwiki-redirect-count (1- pmwiki-redirect-count))
	    (funcall pmwiki-http-action-function
		     request new-loc buf who headers still-running
		     old-passwd-auth passwd-kind
		     new-visited-locs action-args))))))

(defvar pmwiki-html2text-replace-list
  '(("&#036;" . "$") ("&#36;" . "$")
    ("&gt;" . ">") ("&lt;" . "<")
    ("&amp;" . "&"))
  "Modified version of `html2text-replace-list'.")

;; fixed version of `html2text-replace-string':
;;  `length' instead of `string-width'
(defun pmwiki-html2text-replace-string (from-string to-string min max)
  "Replace FROM-STRING with TO-STRING in region from MIN to MAX."
  (goto-char min)
  (let ((delta (- (length to-string) (length from-string))))
    (while (search-forward from-string max t)
      (replace-match to-string)
      (setq max (+ max delta)))
    max))

(defun pmwiki-html2text-substitute (min max)
  "See the variable `html2text-replace-list' for documentation."
  (interactive)
  (dolist (e pmwiki-html2text-replace-list)
    (goto-char min)
    (let ((old-string (car e))
	  (new-string (cdr e)))
      (setq max (pmwiki-html2text-replace-string
			old-string new-string min max))))
  max)

(defun pmwiki-parse-pagesource (&optional no-text)
  "Parse the html returned by GET method with action=edit."
  (goto-char (point-min))
  (let (basetime text min max)
    (and
     ;;(re-search-forward "<form action='[^']+' method='post'>" (point-max) t)
     (re-search-forward "<!--PageText-->" (point-max) t)
     (re-search-forward "id='wikiedit'" (point-max) t)
     (re-search-forward
      "type='hidden' name='basetime' value='\\([^']+\\)'" (point-max) t)
     (setq basetime (match-string 1))
     (or
      (and no-text (cons basetime nil))
      (and
       (re-search-forward
	"<textarea \\(name\\|id\\)='text'" (point-max) t)
       (re-search-forward ">\\([^<]*\\)<" (point-max) t)
       (setq min (match-beginning 1))
       (setq max (match-end 1))
       (setq max (pmwiki-html2text-substitute min max))
       (setq text (buffer-substring-no-properties min max))
       (cons basetime text))))))

(defun pmwiki-http-loop-parse-pagesource (who buf)
  "Variables TEXT and TIMESTAMP should be dynamically bound around the call."
  (when (and (not (equal buf 'discard))
	     ;;FIXME: should be smarter about when to parse-pagesource?
	     (or (equal (pmwiki-action-kind who) 'edit)
		 (equal (pmwiki-action-kind who) 'get-edit-source)))
    (let ((aux (pmwiki-parse-pagesource
		(not (or (bufferp buf) (stringp buf))))))
      (when aux
	(setq timestamp (car aux))
	(setq text (cdr aux))))))

(defun pmwiki-member (elt list)
  "Like `member' but doesn't care about trailing nil."
  (let ((pos list))
    (while (and (consp pos) (not (equal elt (car pos)))
      (setq pos (cdr pos))))
    (when (and (consp pos) (equal elt (car pos))) pos)))

;; FIXME: a workaround for older versions of url package
(defun pmwiki-http-loop-default (&rest cbargs)
  "Call: (pmwiki-http-loop-default STATUS URL REQUEST LOC BUF VISITED-LOCS WHO OLD-PASSWD PASSWD-KIND HEADERS ACTION-ARGS)
HEADERS does not contain authentication nor page name."
  (let* ((status (if (listp (car cbargs)) (car cbargs)
		  (subseq cbargs 0 -12)))
	 ;;FIXME: issue with emacs 22.0.51
	 (url
	  (if (or (not (listp (car cbargs))) (> (length cbargs) 12))
	      (nth (- (length cbargs) 12) cbargs)
	    (nth (- (length (car cbargs)) 1) (car cbargs))))
	 (request (nth (- (length cbargs) 11) cbargs))
	 (loc (nth (- (length cbargs) 10) cbargs))
	 (buf (nth (- (length cbargs) 9) cbargs))
	 (still-running (nth (- (length cbargs) 8) cbargs))
	 (visited-locs (nth (- (length cbargs) 7) cbargs))
	 (who (nth (- (length cbargs) 6) cbargs))
	 (old-passwd-auth (nth (- (length cbargs) 5) cbargs))
	 (passwd-kind (nth (- (length cbargs) 4) cbargs))
	 (headers (nth (- (length cbargs) 3) cbargs))
	 (action-args (nth (- (length cbargs) 2) cbargs))
	 (passwd-fallback (nth (- (length cbargs) 1) cbargs))
	 start end text timestamp)
      (goto-char (point-min))
      ;;FIXME: should be smarter about when to parse-pagesource?
      (if (or (equal (pmwiki-action-kind who) 'edit)
	      (equal (pmwiki-action-kind who) 'get-edit-source))
	  (pmwiki-http-loop-parse-pagesource who buf)
	(when (or (bufferp buf) (stringp buf))
	  (if (re-search-forward "^$")
					; delete headers
	      (setq start (1+ (match-end 0)))
	    (setq start (point-min)))
	  (if (string= (buffer-substring-no-properties
			(- (point-max) 2) (point-max)) "\r\n")
	      (setq end (- (point-max) 2))
	  (setq end (point-max)))
	  (setq text (buffer-substring-no-properties start end))))
    (pmwiki-http-loop (and (pmwiki-member :error status)
			   (print (cadr (pmwiki-member :error status))))
		      (and (pmwiki-member :redirect status)
			   (cadr (pmwiki-member :redirect status)))
		      text timestamp url request loc buf still-running
		      visited-locs who
		      old-passwd-auth passwd-kind headers action-args
		      passwd-fallback
		      )))


(defun pmwiki-http-action-alternative
  (request loc buf who headers still-running
	   &optional passwd-auth passwd-kind visited-locs action-args
	   passwd-fallback)
  "Access the wiki page specified by location list LOC.
Use additional HEADERS. Works together with `pmwiki-http-loop-default'."
  (when (and buf (not (or (stringp buf) (bufferp buf)
			  (equal 'discard buf)
			  (and (consp buf) (equal (car buf) 'timestamp)))))
    (error "`pmwiki-http-action-alternative': wrong buffer argument."))
  (unless buf (setq buf (generate-new-buffer
			 (pmwiki-loc 'nameNA loc))))
  (when (and (equal who 'edit) (not (equal buf 'discard)))
	     (pmwiki-push-buffer loc buf))
  (when pmwiki-debug-level (setq pmwiki-debug-redirection-stack nil))
  (when (not passwd-kind)
    (setq passwd-kind
	  (if passwd-auth 'passwd-asked 'passwd-guessed)))
  (unless passwd-auth
    (setq passwd-auth (pmwiki-process-passwords
		       (pmwiki-action-kind who) loc)))
  (when (and passwd-auth (not (car passwd-auth)))
    (setq passwd-auth nil))
  (if (and passwd-fallback passwd-auth)
      (funcall passwd-fallback loc buf still-running passwd-kind action-args)
  (let* ((request-data
	   (if passwd-auth
	       (cons (cons "authpw" (car passwd-auth))
		     (if (cdr passwd-auth)
			 (cons (cons "authid" (cdr passwd-auth))
			       headers) headers))
	     headers))
	 (args (list request loc buf still-running visited-locs
		     who passwd-auth
		     passwd-kind headers action-args passwd-fallback))
	 proc)
    (if (equal request 'GET)
	(let* ((request-data
	  (mapcar
	   (lambda (arg)
	     (concat
	      (car arg) "="
	      (pmwiki-encode-url-arg (cdr arg))
	      "&")) headers))
	 (request-data (apply 'concat request-data))
	 (url (pmwiki-loc 'URINA loc))
	       (url (concat url
			   (if (string-match "\\?" url) "&" "?")
			   request-data))
	       (url-request-method "GET"))
	  (setq pmwiki-http-action-alternative-args  (cons url args))
	  (setq proc
		(http-get url '(("Connection" "close"))
		    'pmwiki-http-loop-alternative))
	  (process-buffer proc))
      (let* ((url (pmwiki-loc 'base loc))
	     (url (if (string-match
		       (concat pmwiki-HTTP-pattern "//[^/]*$") url)
		      (concat url "/") url))
	     (request-data
	      (cons
	       ;;no encoding here: `http-post' does it
	       (cons "n" (pmwiki-loc 'nameNA loc)) request-data)))
	(setq pmwiki-http-action-alternative-args  (cons url args))
	(setq proc
	      (http-post url request-data pmwiki-default-encoding nil
		   'pmwiki-http-loop-alternative
		   nil (<= 1 pmwiki-debug-level)))
	(process-buffer proc))
      ))))


;; FIXME: a workaround for older versions of url package
(defun pmwiki-http-loop-alternative (proc message)
  "Before (back-)calling set `pmwiki-http-action-args' STATUS URL REQUEST LOC BUF VISITED-LOCS WHO OLD-PASSWD PASSWD-KIND HEADERS ACTION-ARGS)
HEADERS does not contain authentication nor page name."
  (let* ((cbargs pmwiki-http-action-alternative-args)
	 (url (nth (- (length cbargs) 12) cbargs))
	 (request (nth (- (length cbargs) 11) cbargs))
	 (loc (nth (- (length cbargs) 10) cbargs))
	 (buf (nth (- (length cbargs) 9) cbargs))
	 (still-running (nth (- (length cbargs) 8) cbargs))
	 (visited-locs (nth (- (length cbargs) 7) cbargs))
	 (who (nth (- (length cbargs) 6) cbargs))
	 (old-passwd-auth (nth (- (length cbargs) 5) cbargs))
	 (passwd-kind (nth (- (length cbargs) 4) cbargs))
	 (headers (nth (- (length cbargs) 3) cbargs))
	 (action-args (nth (- (length cbargs) 2) cbargs))
	 (passwd-fallback (nth (- (length cbargs) 1) cbargs))
	 text timestamp)
    (switch-to-buffer (process-buffer proc) t)
    (if (equal (pmwiki-action-kind who) 'edit)
	(pmwiki-http-loop-parse-pagesource who buf)
      (when (or (bufferp buf) (stringp buf))
	(setq text (buffer-string))))
    (pmwiki-http-loop nil (pmwiki-alt-parse-redirect-url)
		      text timestamp
		      url request loc buf still-running visited-locs who
		      old-passwd-auth passwd-kind headers action-args
		      passwd-fallback)))


(defun pmwiki-action-cont (who)
  "Return what to do after processing a http request for WHO."
  (cond
   ((equal who 'browse) 'pmwiki-decode-source)
   ((equal who 'edit) 'pmwiki-decode-source)
   ((equal who 'get-source) 'pmwiki-decode-source)
   ((equal who 'get-edit-source) 'pmwiki-decode-source)
   ((equal who 'sitemap) 'pmwiki-get-pagelist)
   ((equal who 'search) 'pmwiki-get-pagelist)
   ((equal who 'save) 'pmwiki-report-save)
   ((equal who 'upload) 'pmwiki-report-save)
))

(defun pmwiki-report-save (loc buf still-running who redirected
			       failed action-args)
  "Report the results of saving a page or uploading a file."
  ;;FIXME: report failed here, or only when page not redirected?
  (when failed
    (with-current-buffer action-args (set-buffer-modified-p t))
    (set still-running nil)
    (error (concat
	    (if (equal who 'save)
		(concat "Page " (pmwiki-loc 'nameNA loc)
			" couldn't be saved, server said: ")
	      (concat "File couldn't be uploaded on "
		      (pmwiki-loc 'site loc) ", server said: "))
	    failed)))
  (set still-running nil)
  (message (concat "Page " (pmwiki-loc 'nameNA loc) " saved on " url ".")))

  
(defun pmwiki-decode-source (loc buf still-running who redirected
				 failed action-args)
  (when failed
    (when (buffer-live-p buf)
      (with-current-buffer buf (set-buffer-modified-p t)))
    (set still-running nil)
    (error (concat "Page " (pmwiki-loc 'nameNA loc)
			" couldn't be loaded, server said: "
			failed)))
  (with-current-buffer buf
      (when pmwiki-decode (funcall pmwiki-decode)))
  (cond
   ((equal who 'edit)
    (pmwiki-edit-cont loc buf still-running nil))
   ((equal who 'browse)
    (pmwiki-edit-cont loc buf still-running t))
   ((or (equal who 'get-source) (equal who 'get-edit-source))
    (apply (car action-args) loc buf still-running (cdr action-args)))
   (t
    (set still-running nil))))

(defun pmwiki-edit-cont (loc buf still-running read-only)
  (let ((orig (get-buffer-create (pmwiki-orig-name buf)))
	(pos (with-current-buffer buf
	       (cons (point-min) (point-max)))))
    (with-current-buffer orig
      (delete-region (point-min) (point-max))
      (insert-buffer-substring buf (car pos) (cdr pos)))
    (switch-to-buffer buf)
    ;; backup buffer-local variable to restore when it's safe
    (push (cons buf
		(list (cons 'pmwiki-timestamp pmwiki-timestamp)
		      (cons 'pmwiki-location-list loc)
		      (cons 'pmwiki-original orig)
		      (cons 'pmwiki-minor-edit t)
		      (cons 'pmwiki-minor-edit-count nil)
		      (cons 'pmwiki-minor-edit-counting nil)
		      (cons 'pmwiki-parent-ee nil)
		      (cons 'pmwiki-page-toc nil)
		      (cons 'pmwiki-slash-format pmwiki-slash-format)
		      (cons 'url-http-no-redirect t)
		      )) pmwiki-page-local-vars)
    (pmwiki-mode))
  (font-lock-mode 1)
  (goto-char (point-min))
  (pmwiki-showpage (cdddr loc))
  (case pmwiki-running-multimode
    ('mmm-mode (mmm-mode 1))
    ('mumamo-mode
       (mumamo-mode 1)))
  (set-buffer-modified-p nil)
  (when read-only (toggle-read-only 1))
  (set still-running nil))


(defun pmwiki-get-pagelist
 (loc buf still-running who redirected failed action-args)
 (when failed
   (set still-running nil)
   (error
    (if (equal who 'sitemap)
	(concat "Could not read links from " (pmwiki-loc 'nameNA loc)
		", server said: " failed)
      (concat "Could not read pagelist on " (pmwiki-loc 'site loc)
		", server said: " failed))))
 (with-current-buffer buf (pmwiki-pagelist-cont still-running action-args)))

(defun pmwiki-pagelist-cont (still-running cbargs)
  "Parse the buffer and build a hierarchy of pages linked from there.
Buffer should contain html source of PmWiki page. Argument is a list:
 (CONT DEFENTRY SEARCH-TERM BEG-REGEXP END-REGEXP BASE CONT-ARGS)"
  (let* ((last-path nil)
	 (cont (nth (- (length cbargs) 7) cbargs))
	 (defentry (nth (- (length cbargs) 6) cbargs))
	 (search-term (nth (- (length cbargs) 5) cbargs))
	 (beg-regexp (nth (- (length cbargs) 4) cbargs))
	 (end-regexp (nth (- (length cbargs) 3) cbargs))
	 (base (nth (- (length cbargs) 2) cbargs))
	 (cont-args (nth (- (length cbargs) 1) cbargs))
	 (menu-stack (list defentry))
	 (group-mem nil) (last-group "") endpoint)
    (when (and pmwiki-debug-level (<= 3 pmwiki-debug-level))
      (let ((page-text (buffer-substring-no-properties
			(point-min) (point-max))))
	(with-current-buffer (get-buffer-create
			      (concat "*DEBUG-PAGELIST: "
				      base " "
				      (or search-term "") "*"))
	  (insert page-text))))
    (goto-char (point-min))
    (setq endpoint
	  (or (re-search-forward (or  end-regexp "<!--PageFooterFmt-->")
				 (point-max) t)
	      (point-max)))
    (goto-char (point-min))
    (unless (re-search-forward (or  beg-regexp "<!--PageText-->")
		       (point-max) t)
      (goto-char (point-min)))
    (while (re-search-forward pmwiki-pages-entry-regexp (point-max) t)
      (let* ((group (match-string-no-properties 1))
	     (page (match-string-no-properties 2))
	     (loc `(,base ,group ,page .
			 ,(if search-term (cons 'search search-term))))
	     (fullpath (pmwiki-page-fullpath group page))
	     (path fullpath)
	     (refname (car (last fullpath)))
	     (leafref (vector refname `(pmwiki-edit
					(quote ,loc) (quote find)) t)))
	  (unless (and (string= group last-group)
		       (member page group-mem))
	    (while (and path last-path (cdr path) (cdr last-path)
			(string= (car path) (car last-path)))
	      (pop path) (pop last-path))
	    (while (and last-path (cdr last-path))
	      (pop last-path)
	      (when (and (= 2 (length (car menu-stack)))
		       (not (consp (caar menu-stack))))
		(aset (caar menu-stack) 0
		      (concat (cadar menu-stack)
			      (aref (caar menu-stack) 0)))
		(setcar menu-stack (caar menu-stack)))
	      (setcar (cadr menu-stack)
		      (if (listp (car menu-stack))
			  (nreverse (car menu-stack)) (car menu-stack)))
	      (pop menu-stack))
	    (while (and path (cdr path))
	      (let ((current (pop path)))
		(setcar menu-stack (cons (list current) (car menu-stack)))
		(setq menu-stack (cons (list current) menu-stack))))
	    (setcar menu-stack (cons leafref (car menu-stack)))
	    (setq last-path fullpath)
	    (if (string= group last-group)
		(push page group-mem)
	      (setq group-mem (list page)))
	    (setq last-group group))))
      (while (cdr menu-stack)
	(when (and (= 2 (length (car menu-stack)))
		   (not (consp (caar menu-stack))))
	  (aset (caar menu-stack) 0
		(concat (cadar menu-stack)
			(aref (caar menu-stack) 0)))
	  (setcar menu-stack (caar menu-stack)))
	(setcar (cadr menu-stack)
		(if (listp (car menu-stack))
		    (nreverse (car menu-stack)) (car menu-stack)))
	(pop menu-stack))
      (kill-buffer (current-buffer))
      (funcall cont base (nreverse (car menu-stack))
	       still-running cont-args)))


(defun pmwiki-search-defentry (search-term)
  (list
   (vector (concat "search for...(currently " search-term ")")
	   'pmwiki-search t)
   (concat "results for " search-term)))

(defun pmwiki-orig-name (buf)
  "Return name of buffer with original contents of BUF."
  (concat "*"
	  (or (when (stringp buf) buf) (buffer-name buf))
	  " ORIG*"))


(defun pmwiki-push-buffer (loc buf)
  "Push (LOC . BUF) on `pmwiki-buffers'. If `pmwiki-sort-buffers' is non-nil,
place in accordingly."
  (unless (and pmwiki-past-locations
       (equal loc (car pmwiki-past-locations)))
      (push loc pmwiki-past-locations))
  (if (or (not pmwiki-sort-buffers)
	  (not pmwiki-buffers)
	  (pmwiki-less-loc loc (caar pmwiki-buffers)))
      (push (cons loc buf) pmwiki-buffers)
    (let ((buffers pmwiki-buffers))
      (while (and (cdr buffers)
		  (cadr buffers)
		  (pmwiki-less-loc (caadr buffers) loc))
	(pop buffers))
      (setcdr buffers (cons (cons loc buf) (cdr buffers)))))
  pmwiki-buffers)

(defvar pmwiki-parent-ee nil
  "Ee-menu from which current buffer was selected.")
(make-variable-buffer-local 'pmwiki-parent-ee)

(defun pmwiki-showpage (anchor)
  "Go to [[#anchor]], or (search . regexp), or go to a marker.
This function manages `pmwiki-parent-ee' contents. Returns nil."
  (when pmwiki-arrived-from-ee
    (let ((buf (current-buffer)))
      (if pmwiki-keep-ee-window
	  (switch-to-buffer pmwiki-arrived-from-ee t)
	(when (< 1 (length (window-list nil 'no-minibuf)))
	  (delete-window)))
      (if (< 1 (length (window-list nil 'no-minibuf)))
	  (select-window
	   (or (get-buffer-window pmwiki-from-ee-parent)
	       (next-window nil 'no-minibuf)))
	(when pmwiki-keep-ee-window (split-window)))
      (switch-to-buffer buf t))
    (setq pmwiki-parent-ee pmwiki-arrived-from-ee)
    (setq pmwiki-from-ee-parent nil)
    (setq pmwiki-arrived-from-ee nil))
  (when anchor
    (cond
     ((number-or-marker-p anchor)
      (goto-char anchor))
     ((stringp anchor)
      (or
       (re-search-forward
	(concat "\\[\\[##?" (regexp-quote (pmwiki-loc 'anchor loc))
		"\\]\\]") (point-max) t)
       (re-search-backward
	(concat "\\[\\[##?" (regexp-quote (pmwiki-loc 'anchor loc))
		"\\]\\]"))))
     ((and (consp anchor) (equal 'search (car anchor)))
      (or (re-search-forward (cdr anchor) (point-max) t)
	  (re-search-backward (cdr anchor))))
     (t (error (concat
		"`pmwiki-showpage': wrong anchor type: "
		(print anchor))))))
  (recenter))


(defun pmwiki-sitemap-cont (base menu still-running buf)
  (if (assoc base pmwiki-site-maps-alist)
      (setcdr (assoc base pmwiki-site-maps-alist) menu)
    (push (cons base menu) pmwiki-site-maps-alist))
  (with-current-buffer buf
    (easy-menu-change '("PmWiki") "SiteMap" menu)
    (setq pmwiki-current-buffer buf)
    (when pmwiki-ee (pmwiki-ee-menubar-sitemap))
    (set still-running nil)
    (message "Creating page list...done")))

(defun pmwiki-search-cont (base pages-menu still-running buf)
  (with-current-buffer buf
    (easy-menu-change '("PmWiki") "Search"
		      ;;FIXME:
		      ;;(cons ["search for..." pmwiki-search t]
		      pages-menu)
    ;;)
    (setq pmwiki-current-buffer buf)
    (when pmwiki-ee (pmwiki-ee-menubar-search))
    (set still-running nil)
    (message "Creating search results...done")))


(defun pmwiki-merge-current ()
  "Merge buffer version with curret server version of a page."
  (interactive)
  (pmwiki-get-source
   pmwiki-location-list 'pmwiki-merge-current-cont
   (get-buffer-create
    (concat (pmwiki-loc 'nameNA) "<Wiki>")) t))

(defvar pmwiki-merge-from-buffer nil
  "Stores pmwiki-mode buffer for which the merge is called.")
(make-variable-buffer-local 'pmwiki-merge-from-buffer)

(defvar pmwiki-timestamp nil
  "Timestamp of last page update from / to wiki server.")
(make-variable-buffer-local 'pmwiki-timestamp)



(defun pmwiki-merge-current-cont (loc server-buf still-running cur-buf)
  "Merge original, current buffer, and current server page versions."
  (let ((new-buf (get-buffer-create
		  (concat (pmwiki-loc 'nameNA loc) "<Emacs>"))))
    (with-current-buffer new-buf
      (delete-region (point-min) (point-max))
      (insert (with-current-buffer cur-buf
		(buffer-substring-no-properties
		 (point-min) (point-max))))
      (setq pmwiki-merge-from-buffer cur-buf))
    (ediff-merge-buffers-with-ancestor
	   new-buf server-buf
	   (with-current-buffer cur-buf pmwiki-original)
	   '(pmwiki-merge-current-startup))
    (set still-running nil)))

(defun pmwiki-merge-current-startup ()
  "Set up session-local things for `pmwiki-merge-current'."
  (set (make-local-variable 'ediff-quit-hook)
       '(pmwiki-merge-current-quit)))

(defun pmwiki-merge-current-quit ()
  "Copy the merged contents and kill auxiliary buffers."
  (let* ((new-buf ediff-buffer-A)
	 (server-buf ediff-buffer-B)
	 (cur-buf (with-current-buffer new-buf
		    pmwiki-merge-from-buffer))
	 (merge-buf ediff-buffer-C)
	 (merge-text (with-current-buffer merge-buf (buffer-string))))
    (ediff-cleanup-mess)    
    (with-current-buffer cur-buf
      (delete-region (point-min) (point-max))
      (insert merge-text)
      (setq pmwiki-timestamp
	    (with-current-buffer server-buf pmwiki-timestamp))
      (setq buffer-modified-p t))
    (kill-buffer new-buf)
    (kill-buffer server-buf)
    (kill-buffer merge-buf)
    (with-current-buffer
	(with-current-buffer cur-buf pmwiki-original)
      (toggle-read-only -1))
    (switch-to-buffer cur-buf)
    (delete-other-windows)))

(defvar pmwiki-merge-format-alternative '("" A "" B "")
  "Alternative `ediff-combination-pattern', see `pmwiki-merge-toggle-format'.")

(defun pmwiki-merge-toggle-format ()
  "Toggle between standard format and a minimalistic one
which places variants together in merge buffer,
see `pmwiki-merge-format-alternative'."
  (interactive)
  (let ((pat ediff-combination-pattern))
    (setq ediff-combination-pattern pmwiki-merge-format-alternative)
    (setq pmwiki-merge-format-alternative pat)))

(defun pmwiki-merge-uri-args (uri old-uri)
  "Merge GET-type parameters (and site if one of addresses is local).
 URI has priority over OLD-URI."
  (let ((base-m (pmwiki-merge-uri-base uri old-uri)))
  (string-match "^\\([^?]*?\\)\\(?:$\\|\\?\\(.+?\\)$\\)" base-m)
  (let* ((base (match-string 1 base-m))
	 (args1 (or (match-string 2 base-m) ""))
	 (args1 (split-string args1 "&"))
	 (args1 (mapcar (lambda (arg) (split-string arg "=")) args1)))
    (string-match "^[^?]*$\\|\\?\\(.+?\\)$" old-uri)
    (let* ((args2 (or (match-string 1 old-uri) ""))
	   (args2 (split-string args2 "&"))
	   (args2 (mapcar (lambda (arg) (split-string arg "=")) args2))
	   )
      (mapc (lambda (arg)
	      (when (not (assoc (car arg) args1))
		(setq args1 (cons arg args1)))) args2)
      (setq args1
	    (delete-if (lambda (arg)
			 (and arg (> 1 (length (car arg))))) args1))
      (if args1
	(concat base "?"
		(mapconcat (lambda (arg)
			     (concat (car arg) "=" (cadr arg))) args1 "&"))
	base)))))

(defun pmwiki-uri-no-args (uri)
  "Discard GET-type parameters."
  (string-match "^\\([^?]+\\)\\(?:\\?\\(.+?\\)\\|\\)$" uri)
  (match-string 1 uri))

(defun pmwiki-make-pattern (pat)
  (concat "^"
	(replace-regexp-in-string
	 "\\\\\\*" ".*"
	 (regexp-quote pat))
	"$"))

(defun pmwiki-process-passwords (action-kind loc)
  "Return '(password . author) for a given LOC."
  (let* ((site (car loc))
	 (group (cadr loc))
	 (page (caddr loc))
	 (rules pmwiki-passwords)
	 (session pmwiki-session-passwords) exit passwd-auth)
    (while (and rules (not exit))
      (if (equal action-kind (caaar rules))
	  (let* ((rule (pop rules))
		 (pattern (cdar rule))
		 (site-re (pmwiki-make-pattern (car pattern)))
		 (group-re (pmwiki-make-pattern (cadr pattern)))
		 (page-re (pmwiki-make-pattern (caddr pattern))))
	    (setq exit
		  (and (string-match site-re site)
		       (string-match group-re group)
		       (string-match page-re page))
		  passwd-auth (and exit (cdr rule))))
	(pop rules)))
    (setq exit nil)
    (or passwd-auth
	(while (and session (not exit))
	  (let* ((rule (pop session))
		 (old-loc (cdar rule)))
	    (when (equal action-kind (caar rule))
	      (setq exit (pmwiki-equal-loc old-loc loc)
		  passwd-auth (and exit (cdr rule))))))
	passwd-auth
	(progn (setq session pmwiki-session-passwords) nil)
	(while (and session (not exit))
	  (let* ((rule (pop session))
		 (old-loc (cdar rule)))
	    (when (equal action-kind (caar rule))
	      (setq exit (pmwiki-equal-loc old-loc loc t)
		    passwd-auth (and exit (cdr rule))))))
	passwd-auth
	(progn (setq session pmwiki-session-passwords) nil)
	(while (and session (not exit))
	  (let* ((rule (pop session))
		 (old-loc (cdar rule)))
	    (when (equal action-kind (caar rule))
	      (setq exit (pmwiki-equal-loc old-loc loc t t)
		    passwd-auth (and exit (cdr rule))))))
	passwd-auth
	)))


(defcustom pmwiki-verify-by-redirect t
  "When non-nil, uses redirection as indication that saving succeeded.
To use it, should NOT have $EnableRedirect = 0 in your config.php."
  :group 'pmwiki-group :type 'boolean)

(defvar pmwiki-debug-redirection-stack nil
  "Stack with redirection locations (debug level >= 2).")

(defcustom pmwiki-one-wiki-per-site t
  "If non-nil, assume that there is at most one wiki-engine on each site."
  :group 'pmwiki-group :type 'boolean)


;;FIXME: should be clarified if this is enough
(defun pmwiki-strict-equal-url (loc new-loc)
  "Compare wikiengine addresses."
  (and loc new-loc
       (string= (car loc) (car new-loc))))

(defun pmwiki-equal-loc (loc new-loc &optional no-page no-group)
  "Compare locations, when NEW-LOC can be url-encoded."
  (and loc new-loc
       (if pmwiki-one-wiki-per-site
	   (or (not (pmwiki-loc 'site loc))
	       (not (pmwiki-loc 'site new-loc))
	       (string-match "^/" (car loc))
	       (string-match "^/" (car new-loc))
	       (string= (pmwiki-loc 'site loc) (pmwiki-loc 'site new-loc)))
	 (string=
	  (or (and (string-match "\\(.*\\)/$" (car loc))
		   (match-string 1 (car loc))) (car loc))
	  (or (and (string-match "\\(.*\\)/$" (car new-loc))
		   (match-string 1 (car new-loc))) (car new-loc))))
       (or no-group
	   (string= (cadr loc) (cadr new-loc))
	   (string=
	    (pmwiki-http-url-encode (cadr loc) 'iso-8859-1)
	    (cadr new-loc))
	   (string=
	    (pmwiki-http-url-encode (cadr loc) 'utf-8)
	    (cadr new-loc)))
       (or no-page
	   (string= (caddr loc) (caddr new-loc))
	   (string=
	    (pmwiki-http-url-encode (caddr loc) 'iso-8859-1)
	    (caddr new-loc))
	   (string=
	    (pmwiki-http-url-encode (caddr loc) 'utf-8)
	    (caddr new-loc)))))

;;(pmwiki-less-loc (caadr pmwiki-buffers) (caar pmwiki-buffers))

(defun pmwiki-less-loc (loc new-loc &optional no-page no-group)
  "Compare locations, when NEW-LOC can be url-encoded."
  (and new-loc
       (or
	(not loc)
	(if pmwiki-one-wiki-per-site
	    (or (not (pmwiki-loc 'site loc))
		(and (string-match "^/" (car loc))
		     (not (string-match "^/" (car new-loc))))
		(and
		 (pmwiki-loc 'site new-loc)
		 (string< (pmwiki-loc 'site loc) (pmwiki-loc 'site new-loc))))
	  (string<
	   (or (and (string-match "\\(.*\\)/$" (car loc))
		    (match-string 1 (car loc))) (car loc))
	   (or (and (string-match "\\(.*\\)/$" (car new-loc))
		    (match-string 1 (car new-loc))) (car new-loc))))
	(and (not no-group)
	     (pmwiki-equal-loc loc new-loc t t)
	     (string< (cadr loc) (cadr new-loc)))
	(and (not no-page)
	     (pmwiki-equal-loc loc new-loc t)
	     (string< (caddr loc) (caddr new-loc))))))


(defun pmwiki-alt-parse-redirect-url ()
  "Find in-html indications of redirection."
  (goto-char (point-min))
  (and
   (re-search-forward
    "<title>\\(?:Redirect\\|301 Moved Permanently\\)</title>"
    (point-max) t)
   (goto-char (point-min))
   (re-search-forward
    "\\(?:URL=\\|href=\"\\)\\(.*?\\)\\(?:'\\|\"\\)"
    (point-max) t)
   (match-string 1)))


(defun pmwiki-next ()
  "Goto the next [[PmWiki link]]."
  (interactive)
  (let ((case-fold-search nil))
    (re-search-forward pmwiki-link-pattern
     nil t)))

(defun pmwiki-prev ()
  "Goto the previous [[PmWiki link]]."
  (interactive)
  (let ((case-fold-search nil))
    (re-search-backward pmwiki-link-pattern
     nil t)))

(defun pmwiki-follow ()
  "Goto (open) the page/anchhor pointed to by the PmWiki-link at point."
  (interactive)
  (let ((loc (pmwiki-loc-at-point)))
    ;;FIXME: commented-out code can be removed
    ;;(if (or (car loc) (cadr loc) (caddr loc))
	(pmwiki-edit (pmwiki-merge-loc loc) 'find)
      ;;(pmwiki-showpage (cdddr loc)))
    ))

(defun pmwiki-loc-at-point ()
  "Return location list for PmWiki link at point of the current buffer.

If no link is found at the current point, nil is returned.
See `pmwiki-location-list'."
  (interactive)
  (let ((case-fold-search nil)
	(found-full-link (thing-at-point-looking-at pmwiki-link-pattern)))
    (if found-full-link
	(let ((maybe-link (match-string-no-properties 1)))
	  ;;(message (concat "maybe-link: " maybe-link))
	  (pmwiki-link-to-loc maybe-link))
      nil))) ; not looking at [[ ... ]]


(defun pmwiki-buffer-loc-list (&optional buf)
  "Return location list for buffer BUF."
  (if buf
      (save-excursion
	(set-buffer buf)
	pmwiki-location-list)
    pmwiki-location-list))


(defun pmwiki-buffer-uri (&optional buf)
  "Return URI of page in buffer BUF, or if BUF is not given, in current buffer."
  (interactive "b")
  (pmwiki-loc 'URI (pmwiki-buffer-loc-list buf)))

(defvar pmwiki-browse-window-opened nil
  "If non-nil, do not open new browser window, it has been already opened.")

(defun pmwiki-browse (&optional buf)
  "Open the buffer BUF in a browser. If BUF is not given,
the current buffer is used."
  (interactive)
  (browse-url (pmwiki-buffer-uri buf) (not pmwiki-browse-window-opened))
  (setq pmwiki-browse-window-opened t))

(defun pmwiki-open (name)
  "Open a page specified by NAME from the current wiki engine, or
open page specified by a URI, or `pmwiki-main-homepage-uri', or other page
from the same site (depending on how much information is in NAME and whether
the function is called from `pmwiki-mode')."
  (interactive "sName or URI: ")
  (setq pmwiki-redirect-count pmwiki-max-redirections)
  (let (running (loc (pmwiki-merge-loc (pmwiki-link-to-loc name))))
    (if (car loc)
	;; additional merge to allow default wikipage on site
	(setq running
	      (pmwiki-edit (pmwiki-merge-loc loc '(nil "Main" "HomePage"))
			   'find))
      (setq running (pmwiki-edit (pmwiki-merge-loc
				  loc (pmwiki-link-to-loc
				       pmwiki-main-homepage-uri)) 'find)))
    running))

(defun mywiki-open (name)
  "Open page NAME from main wiki (or a page specified by an URI).
Ex: 'Main.WikiSandbox' will open the page
   http://.../Main/WikiSandbox
Note when NAME is an URI, the page doesn't have to belong to the main wiki."
  (interactive "sName (default Main.HomePage): ")
  (setq pmwiki-redirect-count pmwiki-max-redirections)
  (pmwiki-edit (pmwiki-merge-loc
		(pmwiki-link-to-loc name)
		(pmwiki-link-to-loc pmwiki-main-homepage-uri)) 'find))

(defun pmwiki-reload ()
  "Reload the current page from the wiki engine."
  (interactive)
  (setq pmwiki-redirect-count pmwiki-max-redirections)
  (unless pmwiki-location-list
    (error "pmwiki-reload: `pmwiki-location-list' is empty!"))
  (pmwiki-edit `(,(car pmwiki-location-list)
		   ,(cadr pmwiki-location-list)
		   ,(caddr pmwiki-location-list) .
		   ,(point)) (current-buffer)))



(defun pmwiki-save-to-loc (loc)
  "Uploads current buffer to a PAGE-URI (allows you to store the buffer
under a new name, or in a different wiki)."
  (let ((old-name (pmwiki-loc 'nameNA)))
    (set 'pmwiki-location-list loc)
    (rename-buffer (pmwiki-loc 'nameNA))
    (pmwiki-save (concat "Renaming from " old-name))))


(defun pmwiki-save-as (name)
  "Uploads current buffer to a specific page on a wiki. This also
changes `pmwiki-page-uri', so future saves also go to this page.
The argument NAME can be either a name (= <group>.<page>) or an URI.
An URI must begin with 'http'."
  (interactive "sUpload page as NAME or URI (ex: Main.WikiSandbox): ")
  (pmwiki-save-to-loc (pmwiki-merge-loc (pmwiki-link-to-loc name))))	

(defun pmwiki-delete ()
  "Delete current page from the current wiki engine, specified by NAME which
can be empty (current buffer), a page name or a URI."
  (interactive)
  (pmwiki-save nil "delete")
  (set-buffer-modified-p t))

(defun pmwiki-rename (new-name)
  "Save current buffer under a new name and delete the original page."
  (interactive "sNew page name: ")
  (pmwiki-delete)
  (pmwiki-save-as new-name))

;;
;; Functions useful for configuration.
;;
(defun pmwiki-delayed-hook-longlines-mode-on ()
  "Hook that activates `longlines-mode' when Emacs has been idle for 1 s."
  (require 'longlines)
  (run-with-idle-timer
   1 nil
   (lambda (buf)
     (save-excursion
       (set-buffer buf)
       (message (concat "Enabling longlines-mode for " (buffer-name)))
       (longlines-mode-on)))
   (current-buffer)))

(defun pmwiki-delayed-hook-longlines-mode-showing-hard-newlines ()
  "Hook that activates `longlines-mode' when Emacs has been idle for 1 s,
and in addition runs it `longlines-show-hard-newlines'."
  (require 'longlines)
  (run-with-idle-timer
   1 nil
   (lambda (buf)
     (save-excursion
       (set-buffer buf)
       (message (concat "Enabling longlines-mode for " (buffer-name)))
       (longlines-mode-on)
       (longlines-show-hard-newlines)))
   (current-buffer)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                         multi-mode support

(defvar pmwiki-running-multimode nil
  "Whether `mmm-mode' or `mumamo-mode' is installed.")
(when
 (require 'mmm-mode nil t)
 
 (setq pmwiki-running-multimode 'mmm-mode)
 (setq mmm-global-mode 'maybe)

  (defun pmwiki-multi-source (lang mode name &optional insertchar)
  "Add submode for source code.
Add submode MODE (function toggling the mode) for language LANG
 (string with the SourceBlock name of language) as NAME (any symbol).
INSERTCHAR is the character to insert the source markup with
 [C-c % INSERTCHAR] sequence."
    (interactive)
    (mmm-add-classes
     (if insertchar
	 `((,name
	    :submode ,mode
	    :face mmm-code-submode-face
	    :front ,(concat "(:source lang=" lang ".*?:)")
	    :back "(:sourcend:)"
	    :insert ((,insertchar ocaml-source .
				  (nil @ "(:source lang=" ,lang ":)" \n @
					 _ @ \n "(:sourcend:)" @)))))
       `((,name
	  :submode ,mode
	  :face mmm-code-submode-face
	  :front ,(concat "(:source lang=" lang ".*?:)")
	  :back "(:sourcend:)"))))
    (mmm-add-mode-ext-class 'pmwiki-mode nil name))
;;"

;; set auctex-mode to work within pmwiki-mode for jsMath
  (mmm-add-classes
   '((pmwiki-jsmath-latex
      :submode latex-mode
      :face mmm-declaration-submode-face
      :front "\\({\\)$$?"
      :back "$?$\\(}\\)"
      :front-match 1
      :back-match 1
      :insert ((?$ inline-math . (nil @ "{" @ "$" _ "$" @ "}" @ ))
;;"
	       (?[ math . (nil @ "{" @ "$$" _ "$$" @ "}" @ ))))))
?]

  (mmm-add-mode-ext-class 'pmwiki-mode nil 'pmwiki-jsmath-latex)

;;FIXME: for some reason, testing for `mmm-font-lock-mode'
;;        doesn't work for me
   (defun mmm-fontify-region (start stop &optional loudly)
     "Fontify from START to STOP keeping track of submodes correctly."
     (when loudly
       (message "Fontifying %s with submode regions..." (buffer-name)))
     ;; Necessary to catch changes in font-lock cache state and position.
     (mmm-save-changed-local-variables
      mmm-current-overlay mmm-current-submode)
     ;; For some reason `font-lock-fontify-block' binds this to nil, thus
     ;; preventing `mmm-beginning-of-syntax' from doing The Right Thing.
     ;; I don't know why it does this, but let's undo it here.
     (let ((font-lock-beginning-of-syntax-function 'mmm-beginning-of-syntax))
       (mapc #'(lambda (elt)
		 (when (and (consp elt) (consp (cdr elt))
			     (consp (cadr elt))
			    (number-or-marker-p (caadr elt))
			    (number-or-marker-p (cdadr elt)))
		   (mmm-fontify-region-list (car elt) (cdr elt))))
	     (mmm-regions-alist start stop)))
     ;; With jit-lock, this causes blips in the mode line and menus.
     ;; Shouldn't be necessary here, since it's in post-command-hook too.
     ;;(mmm-update-submode-region)
     (when loudly (message nil)))
)

(when
 (require 'mumamo nil t)
 
 (setq mumamo-survive nil) ;;I don't have mlinks-mode

 (setq pmwiki-running-multimode 'mumamo-mode)

 ;;FIXME: workaround for bug in mumamo
 (setq mlinks-mode nil)

 (defcustom pmwiki-mumamo-sourceblocks
   '(("ocaml" . tuareg-mode)
     ("lisp" . lisp-mode))
   "Language modes for sourceblock recipe markup."
   :type '(alist :key-type string :value-type function)
   :group 'pmwiki-group)

;;FIXME: set-variable
(setq mumamo-major-modes
      (append
       (mapcar
	(lambda (mod) (list (cdr mod) (cdr mod)))
	pmwiki-mumamo-sourceblocks)
       mumamo-major-modes))

;;FIXME: wrong type declared for mumamo-chunk-family-by-mode
 ;;(set-variable 'mumamo-chunk-family-by-mode
 (setq mumamo-chunk-family-by-mode
	       (cons '(pmwiki-mode "PmWiki Family")
		     mumamo-chunk-family-by-mode))
 
 (defun pmwiki-mumamo-search-bw-exc-start-latex (pos min)
   (goto-char pos)
   (let ((found (re-search-backward "{$$?" min t)))
     (when found
       (cons (1- (match-end 0)) 'latex-mode))))
 
 (defun pmwiki-mumamo-search-bw-exc-end-latex (pos min)
   (goto-char pos)
   (let ((found (re-search-backward "$$?}" min t)))
     (when found
       (1+ (match-beginning 0)))))

 (defun pmwiki-mumamo-search-fw-exc-start-latex (pos max)
   (goto-char pos)
   (let ((found (re-search-forward "{$$?" max t)))
     (when found
       (1- (match-end 0)))))
 
 (defun pmwiki-mumamo-search-fw-exc-end-latex (pos max)
   (goto-char pos)
   (let ((found (re-search-forward "$$?}" max t)))
     (when found
       (1+ (match-beginning 0)))))

 (defun pmwiki-mumamo-chunk-latex (pos min max)
  "Use AuXTeX for embedded formulas."
  (mumamo-chunk pos min max
		'pmwiki-mumamo-search-bw-exc-start-latex
		'pmwiki-mumamo-search-bw-exc-end-latex
		'pmwiki-mumamo-search-fw-exc-start-latex
		'pmwiki-mumamo-search-fw-exc-end-latex))

 (defun pmwiki-mumamo-search-bw-exc-start-source (pos min)
   (goto-char pos)
   (let ((found (re-search-backward "(:source lang=" min t)))
     (when found
       (goto-char (match-end 0))
       (looking-at "\\w*")
       (let* ((lang
	       (buffer-substring-no-properties
		(match-beginning 0) (match-end 0)))
	      (lang-mode (assoc lang pmwiki-mumamo-sourceblocks)))
	 (when (search-forward ":)" nil t)
	   (goto-char (match-end 0))
	   (cons (match-end 0) (cdr lang-mode)))))))

 (defun pmwiki-mumamo-search-bw-exc-end-source (pos min)
   (goto-char pos)
   (search-backward "(:sourcend:)" min t))

 (defun pmwiki-mumamo-search-fw-exc-start-source (pos max)
   (goto-char pos)
   (let ((found (re-search-forward "(:source lang=" max t)))
     (when found
       (goto-char (match-end 0))
       (looking-at "\\w*")
       (let* ((lang
	      (buffer-substring-no-properties
	       (match-beginning 0) (match-end 0))))
	 (when (search-forward ":)" nil t)
	   (goto-char (match-end 0))
	   (match-end 0))))))

 (defun pmwiki-mumamo-search-fw-exc-end-source (pos max)
   (goto-char pos)
   (search-forward "(:sourcend:)" max t))
 
 (defun pmwiki-mumamo-chunk-source (pos min max)
  "Use language modes for embedded sourceblocks."
  (mumamo-chunk pos min max
		'pmwiki-mumamo-search-bw-exc-start-source
		'pmwiki-mumamo-search-bw-exc-end-source
		'pmwiki-mumamo-search-fw-exc-start-source
		'pmwiki-mumamo-search-fw-exc-end-source))


 (defun pmwiki-mumamo-search-bw-exc-start-beamer (pos min)
   (goto-char pos)
   (let ((found (re-search-backward "(:beamer " min t)))
     (when found
       (goto-char (match-end 0))
       (when (search-forward ":)" nil t)
	 (goto-char (match-end 0))
	 (cons (match-end 0) 'latex-mode)))))

 (defun pmwiki-mumamo-search-bw-exc-end-beamer (pos min)
   (goto-char pos)
   (search-backward "(:endbeamer:)" min t))

 (defun pmwiki-mumamo-search-fw-exc-start-beamer (pos max)
   (goto-char pos)
   (let ((found (re-search-forward "(:beamer " max t)))
     (when found
       (goto-char (match-end 0))
       (when (search-forward ":)" nil t)
	 (goto-char (match-end 0))
	 (match-end 0)))))

 (defun pmwiki-mumamo-search-fw-exc-end-beamer (pos max)
   (goto-char pos)
   (search-forward "(:endbeamer:)" max t))
 
 (defun pmwiki-mumamo-chunk-beamer (pos min max)
  "Use latex mode for embedded beamer."
  (mumamo-chunk pos min max
		'pmwiki-mumamo-search-bw-exc-start-beamer
		'pmwiki-mumamo-search-bw-exc-end-beamer
		'pmwiki-mumamo-search-fw-exc-start-beamer
		'pmwiki-mumamo-search-fw-exc-end-beamer))

 (defun pmwiki-mumamo-search-bw-exc-start-tikz (pos min)
   (goto-char pos)
   (let ((found (re-search-backward "(:tikz " min t)))
     (when found
       (goto-char (match-end 0))
       (when (search-forward ":)" nil t)
	 (goto-char (match-end 0))
	 (cons (match-end 0) 'latex-mode)))))
 
 (defun pmwiki-mumamo-search-bw-exc-end-tikz (pos min)
   (goto-char pos)
   (search-backward "(:endtikz:)" min t))

 (defun pmwiki-mumamo-search-fw-exc-start-tikz (pos max)
   (goto-char pos)
   (let ((found (re-search-forward "(:tikz " max t)))
     (when found
       (goto-char (match-end 0))
       (when (search-forward ":)" nil t)
	 (goto-char (match-end 0))
	 (match-end 0)))))

 (defun pmwiki-mumamo-search-fw-exc-end-tikz (pos max)
   (goto-char pos)
   (search-forward "(:endtikz:)" max t))
 
 (defun pmwiki-mumamo-chunk-tikz (pos min max)
  "Use latex mode for embedded tikz."
  (mumamo-chunk pos min max
		'pmwiki-mumamo-search-bw-exc-start-tikz
		'pmwiki-mumamo-search-bw-exc-end-tikz
		'pmwiki-mumamo-search-fw-exc-start-tikz
		'pmwiki-mumamo-search-fw-exc-end-tikz))

(setq mumamo-chunk-family-list
      (cons '("PmWiki Family" pmwiki-mode
	      (pmwiki-mumamo-chunk-source
	      pmwiki-mumamo-chunk-latex
	      pmwiki-mumamo-chunk-beamer
	      pmwiki-mumamo-chunk-tikz))
	    mumamo-chunk-family-list))

 ;;TODO: support for INSERTCHAR [C-c % INSERTCHAR]
  (defun pmwiki-multi-source (lang mode &optional name insertchar)
  "Add submode for source code.
Add submode MODE (function toggling the mode) for language LANG
 (string with the SourceBlock name of language).
NAME and INSERTCHAR are currently ignored."
    (interactive)
    (push (cons lang mode) pmwiki-mumamo-sourceblocks)
    (push (list mode mode) mumamo-major-modes))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;             latex-preview additional functionality

(defun pmwiki-search-bw-start-tikz (pos min)
  (goto-char pos)
   (let ((found (re-search-backward "(:tikz scale=" min t)))
     (when found
       (goto-char (match-end 0))
       (looking-at "[.[:digit:]]*")
       (let ((scale
	      (buffer-substring-no-properties
	       (match-beginning 0) (match-end 0))))
	 (when (search-forward ":)" nil t)
	   (goto-char (match-end 0))
	   (cons (match-end 0) scale))))))

(defun pmwiki-search-fw-end-tikz (pos max)
  (goto-char pos)
  (search-forward "(:endtikz:)" max t)
  (match-beginning 0))

(defun pmwiki-preview-tikz ()
  "Run preview on pmwiki tikz block at point."
  (interactive)
  (let* ((tikz (pmwiki-search-bw-start-tikz (point) (point-min)))
	 (begin (car tikz))
	 (scale (cdr tikz))
	 (end (pmwiki-search-fw-end-tikz (point) (point-max))))
    ;;(setq mark-active t)
    ;;(push-mark)
    ;;(set-mark end)
    ;;(goto-char begin)
    (TeX-region-create (TeX-region-file TeX-default-extension)
		       (concat
			"\\begin{figure}
\\begin{tikzpicture}[thick,scale=" scale "]
    " (buffer-substring-no-properties begin end) "
\\end{tikzpicture}
\\end{figure}")
		     (if buffer-file-name
			 (file-name-nondirectory buffer-file-name)
		       "<none>")
		     (save-restriction
		       (widen)
		       (let ((inhibit-point-motion-hooks t)
			     (inhibit-field-text-motion t)
			     ) ;;FIXME
			 (+ (count-lines (point-min) begin)
			    (save-excursion
			      (goto-char begin)
			      (if (bolp) 0 -1))))))
  (preview-generate-preview t (TeX-region-file nil t)
			    (preview-do-replacements
			     (TeX-command-expand
			      (preview-string-expand preview-LaTeX-command)
			      'TeX-region-file)
			     preview-LaTeX-command-replacements))))

(defcustom pmwiki-view-ps-command "kpdf"
  "Command used by `pmwiki-view-tikz'."
  :group 'pmwiki-group :type 'string)

(defun pmwiki-view-tikz ()
  "View pmwiki tikz block at point by external program,
see `pmwiki-view-ps-command'."
  (interactive)
  (save-excursion
    (let* ((tikz (pmwiki-search-bw-start-tikz (point) (point-min)))
	   (begin (car tikz))
	   (scale (cdr tikz))
	   (end (pmwiki-search-fw-end-tikz (point) (point-max)))
	   (old-TeX-master TeX-master))
      (set 'TeX-master (concat pmwiki-TeX-master-directory
			   "preamble_tikz.tex"))
      (TeX-region-create (TeX-region-file TeX-default-extension)
			 (concat
			  "\\begin{center}
\\begin{tikzpicture}[thick,scale=" scale "]
    " (buffer-substring-no-properties begin end) "
\\end{tikzpicture}
\\end{center}")
			 (if buffer-file-name
			     (file-name-nondirectory buffer-file-name)
			   "<none>")
			 (save-restriction
			   (widen)
			   (let ((inhibit-point-motion-hooks t)
				 (inhibit-field-text-motion t)
				 ) ;;FIXME
			     (+ (count-lines (point-min) begin)
				(save-excursion
				  (goto-char begin)
				  (if (bolp) 0 -1))))))
      (setq TeX-master old-TeX-master)))
  (shell-command
   (concat
    "latex _region_.tex; dvips _region_.dvi; "
    pmwiki-view-ps-command " _region_.ps &")))


(defun pmwiki-search-bw-start-beamer (pos min)
  (goto-char pos)
   (let ((found (re-search-backward "(:beamer scale=" min t)))
     (when found
       (goto-char (match-end 0))
       (looking-at "[.[:digit:]]*")
       (let ((scale
	      (buffer-substring-no-properties
	       (match-beginning 0) (match-end 0))))
	 (when (search-forward ":)" nil t)
	   (goto-char (match-end 0))
	   (cons (match-end 0) scale))))))

(defun pmwiki-search-fw-end-beamer (pos max)
  (goto-char pos)
  (search-forward "(:endbeamer:)" max t)
  (match-beginning 0))

(defun pmwiki-view-beamer ()
  "View pmwiki beamer block at point by external program,
see `pmwiki-view-ps-command'."
  (interactive)
  (save-excursion
    (let* ((beamer (pmwiki-search-bw-start-beamer (point) (point-min)))
	   (begin (car beamer))
	   (scale (cdr beamer))
	   (end (pmwiki-search-fw-end-beamer (point) (point-max)))
	   (old-TeX-master TeX-master))
      (set 'TeX-master (concat pmwiki-TeX-master-directory
			   "preamble_beamer.tex"))
      (TeX-region-create (TeX-region-file TeX-default-extension)
			 (concat
			  "\\begin{center}
\\begin{tikzpicture}[thick,scale=" scale "]
    " (buffer-substring-no-properties begin end) "
\\end{tikzpicture}
\\end{center}")
			 (if buffer-file-name
			     (file-name-nondirectory buffer-file-name)
			   "<none>")
			 (save-restriction
			   (widen)
			   (let ((inhibit-point-motion-hooks t)
				 (inhibit-field-text-motion t)
				 ) ;;FIXME
			     (+ (count-lines (point-min) begin)
				(save-excursion
				  (goto-char begin)
				  (if (bolp) 0 -1))))))
      (setq TeX-master old-TeX-master)))
  (shell-command
   (concat
    "latex _region_.tex; dvips _region_.dvi; "
    pmwiki-view-ps-command " _region_.ps &")))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                            Menu support
  
(defvar pmwiki-mode-map (make-sparse-keymap)
  "Keymap for Pmwiki Mode.")

(define-key pmwiki-mode-map (kbd "C-c C-p") 'pmwiki-prev)
(define-key pmwiki-mode-map (kbd "C-c C-n") 'pmwiki-next)
(define-key pmwiki-mode-map (kbd "C-c C-f") 'pmwiki-follow)
(define-key pmwiki-mode-map (kbd "C-c C-g") 'pmwiki-follow)
(define-key pmwiki-mode-map (kbd "C-c C-o") 'pmwiki-open)
(define-key pmwiki-mode-map (kbd "C-c C-c") 'pmwiki-save)
(define-key pmwiki-mode-map (kbd "C-c C-w") 'pmwiki-save-as)
(define-key pmwiki-mode-map (kbd "C-c C-b") 'pmwiki-browse)
(define-key pmwiki-mode-map (kbd "C-c C-m") 'pmwiki-map-site)
(define-key pmwiki-mode-map (kbd "C-c C-s") 'pmwiki-search)
(define-key pmwiki-mode-map (kbd "C-c C-t") 'pmwiki-toc)
(define-key pmwiki-mode-map (kbd "C-c C-r") 'pmwiki-reload)
(define-key pmwiki-mode-map (kbd "C-c C-e") 'pmwiki-toggle-minor-edit)
(define-key pmwiki-mode-map (kbd "C-c M-<left>") 'pmwiki-backward)
(define-key pmwiki-mode-map (kbd "C-c M-<right>") 'pmwiki-forward)
(define-key pmwiki-mode-map (kbd "C-c C-<left>") 'pmwiki-prev-page)
(define-key pmwiki-mode-map (kbd "C-c C-<right>") 'pmwiki-next-page)

(defvar pmwiki-drawer-menu
  '("Choose drawer"
    ["Search" pmwiki-search t]
    ["ToC" pmwiki-toc t]
    ["SiteMap" pmwiki-map-site t]
    ["Regenerate SiteMap" pmwiki-rescan-pages t]
    ["OpenedPages" pmwiki-pages-opened t])
  "Menu for toolbar popup Drawer.")

(defgroup pmwiki-group nil
  "`pmwiki-mode' customization: mode for editing PmWiki wiki pages."
  :group 'Applications :group 'Hypermedia)
(defun pmwiki-customize ()
  "Customize group `pmwiki-group'."
  (interactive)
  (customize-group 'pmwiki-group))

(defun pmwiki-toggle-variable (variable)
  "Toggle VARIABLE by `customize-set-variable'."
  (customize-set-variable variable
			  (not (symbol-value variable))))

(defun pmwiki-options-save ()
  "Save current values of PmWiki Options menu items using Custom."
  (interactive)
  (let ((need-save nil))
    ;; These are set with `customize-set-variable'.
    (dolist (elt '(pmwiki-no-summary
		   pmwiki-always-edit
		   pmwiki-keep-ee-window
		   pmwiki-reopen-pages
		   pmwiki-pagelist-hyphen-subgroups
		   pmwiki-pagelist-join-pages))
      (and (get elt 'customized-value)
	   (customize-mark-to-save elt)
	   (setq need-save t)))
    ;; Save if we changed anything.
    (when need-save
      (custom-save-all))))

(easy-menu-define pmwiki-menu (list pmwiki-mode-map)
  "PmWiki mode map."
  '("PmWiki"
    ["Open" pmwiki-open]
    ["Save" pmwiki-save]
    ["Save As" pmwiki-save-as]
    ["Reload" pmwiki-reload]
    ["Compare" pmwiki-compare-actual
     :help "Compare with current server contents"]
    ["Browse" pmwiki-browse]
    "---"
    ["Backward" pmwiki-backward]
    ["Forward" pmwiki-forward]
    ["Previous Location" pmwiki-prev-page]
    ["Next Location" pmwiki-next-page]
    ["Previous Link" pmwiki-prev]
    ["Next Link" pmwiki-next]
    ["Follow Link" pmwiki-follow]
    "---"
    ("Options" ["customize all..." pmwiki-customize]
     "---"
     ["No Summary" (pmwiki-toggle-variable 'pmwiki-no-summary)
      :style toggle :selected pmwiki-no-summary
      :help "Don't ask for summary and send empty summary"]
     ["Always Edit" (pmwiki-toggle-variable 'pmwiki-always-edit)
      :style toggle :selected pmwiki-always-edit
      :help "Automatically edit on edit vs browse question"]
     ["Keep Ee Window" (pmwiki-toggle-variable 'pmwiki-keep-ee-window)
      :style toggle :selected pmwiki-keep-ee-window
      :help "Leave ee menu window visible after selection"]
     ["Reopen Pages" (pmwiki-toggle-variable 'pmwiki-reopen-pages)
      :style toggle :selected pmwiki-reopen-pages
      :help "Open different anchors of single page in new buffers"]
     ["Cluster Groups"
      (pmwiki-toggle-variable 'pmwiki-pagelist-hyphen-subgroups)
      :style toggle :selected pmwiki-pagelist-hyphen-subgroups
      :help "Like Mammal-canine ==> Mammal- / canine"]
     ["Cluster Pages"
      (pmwiki-toggle-variable 'pmwiki-pagelist-join-pages)
      :style toggle :selected pmwiki-pagelist-join-pages
      :help "Like TextProperties ==> Text / Properties"]
     "---"
     ["Save Options" pmwiki-options-save])
    "---"
    ("Search" ["search for..." pmwiki-search t])
    ("ToC" ["show in buffer" pmwiki-toc t])
    ("SiteMap" ["rescan..." pmwiki-rescan-pages t])
    ;;"---"
    ("OpenedPages" ["opened pages menu" pmwiki-pages-opened t])
    ))
(define-key pmwiki-mode-map [menu-bar pmwiki-menu] 'pmwiki-menu)

(defun pmwiki-backward ()
  "Go back in history of PmWiki pages browsed."
  (interactive)
  (when (and pmwiki-past-locations (cdr pmwiki-past-locations))
    (let* ((actual (pop pmwiki-past-locations))
	   (previus (car pmwiki-past-locations)))
      (push actual pmwiki-future-locations)
      (pmwiki-edit (car pmwiki-past-locations) 'find))))

(defun pmwiki-forward ()
  "Go forward in history of PmWiki pages browsed."
  (interactive)
  (when pmwiki-future-locations
    (push (pop pmwiki-future-locations) pmwiki-past-locations)
    (pmwiki-edit (car pmwiki-past-locations) 'find)))


;; FIXME: Customize this to work with Hg and Cluster
;;        so that it goes one level up
(defun pmwiki-group-homepage ()
  "Go to PmWiki group's homepage."
  (interactive)
  (let ((loc pmwiki-location-list))
    (pmwiki-edit `(,(car loc) ,(cadr loc)
		   ,(replace-regexp-in-string
		     "\\\\0"
		     (cadr loc) pmwiki-default-page-name))
		 'find)))

(defun pmwiki-default-homepage ()
  "Go to default PmWiki page."
  (interactive)
  (mywiki-open ""))

(defun pmwiki-prev-page ()
  "Go to previous page on ee list."
  (interactive)
  (let ((pmw-parent-ee pmwiki-parent-ee))
    (when pmw-parent-ee
      (select-window
       (or (get-buffer-window pmw-parent-ee)
	   (next-window nil 'no-minibuf)))
      (switch-to-buffer pmw-parent-ee)
      (pmwiki-ee-view-prev)
      (ee-menubar-select))))

(defun pmwiki-next-page ()
  "Go to next page on ee list."
  (interactive)
  (let ((pmw-parent-ee pmwiki-parent-ee))
    (when pmw-parent-ee
      (select-window
       (or (get-buffer-window pmw-parent-ee)
	   (next-window nil 'no-minibuf)))
      (switch-to-buffer pmw-parent-ee)
      (pmwiki-ee-view-next)
      (ee-menubar-select))))

(defun pmwiki-goto-parent-ee ()
  "Go to the ee list."
  (interactive)
  (when pmwiki-parent-ee
    (switch-to-buffer-other-window pmwiki-parent-ee)))

(defun pmwiki-attach-file ()
  "Attach (upload) file."
  (interactive)
  (error "Not implemented yet."))

(defun pmwiki-exit ()
  "Close all PmWiki buffers."
  (interactive)
  (mapc
   (lambda (loc-buf)
     (when (buffer-live-p (cdr loc-buf))
       (kill-buffer (cdr loc-buf))))
   pmwiki-buffers)
  (setq pmwiki-buffers nil)
  (setq pmwiki-past-locations nil)
  (setq pmwiki-future-locations nil))

(defcustom pmwiki-spell-function 'ispell-buffer
  "*Function to check spelling by `pmwiki-spell-buffer'."
  :group 'pmwiki-group
  :type 'function :options '(ispell-buffer spell-buffer))

(defun pmwiki-spell-buffer ()
  "Check spelling of page text.
Remove markup and send resulting text to `spell-buffer'
or `ispell-buffer', see variable `pmwiki-spell-function'."
  (interactive)
  (call-interactively pmwiki-spell-function))

(defun pmwiki-set-author ()
  "Customize `pmwiki-author', which determines who is the author of edits."
  (interactive)
  (customize-variable 'pmwiki-author))

(defun pmwiki-drawer ()
  "Choose kind of ee list."
  (interactive)
  (popup-menu pmwiki-drawer-menu))

;;;FIXME: key shortcuts are hardwired now, should show the real bindings!
(defvar pmwiki-tool-bar-map
  (let ((tool-bar-map (make-sparse-keymap)))
    (tool-bar-add-item "open" 'pmwiki-open 'open :help
		       "Open a PmWiki page. (C-c C-o)")
    (tool-bar-add-item-from-menu 'kill-this-buffer "close")
    (tool-bar-add-item "save" 'pmwiki-save 'save :help
		       "Save changes of a PmWiki page. (C-c C-c)")
    (tool-bar-add-item "saveas" 'pmwiki-save-as 'saveas :help
		       "Save PmWiki page with another name. (C-c C-w)")
    (tool-bar-add-item "refresh" 'pmwiki-reload 'reload :help
		       "Reload PmWiki page. (C-c C-r)")
    (tool-bar-add-item "sort-criteria" 'pmwiki-compare-actual 'compare
		       :help
		       "Compare with current server contents. (C-c C-q)")
    (tool-bar-add-item "contact" 'pmwiki-set-author 'set-author :help
		       "Set the author name.")
    (tool-bar-add-item "attach" 'pmwiki-attach-file 'attach :help
		       "Attach (upload) a file.")
    (tool-bar-add-item "delete" 'pmwiki-delete 'delete :help
		       "Delete this PmWiki page.")
    (tool-bar-add-item "exit" 'pmwiki-exit 'exit :help
		       "Close all PmWiki buffers.")

    (tool-bar-add-item "separator" nil 'separator-files)

    (tool-bar-add-item-from-menu 'undo "undo")
    (tool-bar-add-item-from-menu 'clipboard-kill-region "cut")
    (tool-bar-add-item-from-menu 'clipboard-kill-ring-save "copy")
    (tool-bar-add-item-from-menu 'x-clipboard-yank "paste")
    (tool-bar-add-item-from-menu 'nonincremental-search-forward
				 "search")
    (tool-bar-add-item-from-menu 'query-replace
				 "search-replace")
    (tool-bar-add-item "spell" 'pmwiki-spell-buffer 'spell :help
		       "Check spelling of page text.")

    (tool-bar-add-item "separator" nil 'separator-editing)

    (tool-bar-add-item
     "back-arrow" 'pmwiki-backward 'backward :help
     "Go back in history of PmWiki pages browsed. (C-c M-<left>)")
    (tool-bar-add-item
     "fwd-arrow" 'pmwiki-forward 'forward :help
     "Go forward in history of PmWiki pages browsed. (C-c M-<right>)")

    (tool-bar-add-item "prev-node" 'pmwiki-prev 'prev :help
		       "Move point to previous link. (C-c C-p)")
    (tool-bar-add-item "next-node" 'pmwiki-next 'next :help
		       "Move point to next link. (C-c C-n)")
    (tool-bar-add-item "jump-to" 'pmwiki-follow 'follow :help
		       "Follow PmWiki link. (C-c C-f)")
    (tool-bar-add-item "up-node" 'pmwiki-group-homepage 'group-page
		       :help "Go to PmWiki group's homepage.")
    (tool-bar-add-item "home" 'pmwiki-default-homepage 'homepage :help
		       "Go to default PmWiki page.")

    (tool-bar-add-item "left-arrow" 'pmwiki-prev-page 'prev-page :help
		       "Go to previous page on ee list. (C-c C-<left>)")
    (tool-bar-add-item "right-arrow" 'pmwiki-next-page 'next-page :help
		       "Go to next page on ee list. (C-c C-<right>)")
    (tool-bar-add-item "index" 'pmwiki-goto-parent-ee 'ee-index :help
		       "Go to the ee list.")
    (tool-bar-add-item "diropen" 'pmwiki-drawer 'drawer :help
		       "Choose kind of ee list.")
    (tool-bar-add-item "separator" nil 'separator-navigation)

    (tool-bar-add-item-from-menu 'print-buffer "print")
    (tool-bar-add-item "show" 'pmwiki-browse 'browse
		       :help "Open in browser. (C-c C-b)")
    (tool-bar-add-item "preferences" 'pmwiki-preferences 'preferences
		       :help "Edit PmWiki preferences.")
    tool-bar-map)
  "Tool bar of PmWiki mode.")


(defvar pmwiki-site-maps-alist nil
  "Mapping from wikiengine addresses to site maps.")
(defvar pmwiki-page-toc nil
  "Current buffer table of contents.")
(make-variable-buffer-local 'pmwiki-page-toc)

(defcustom pmwiki-always-rescan-toc t
  "*If nil, don't rescan text for headings each time menu is clicked."
  :group 'pmwiki-group :type 'boolean)

(defun pmwiki-build-menu ()
  "Build a menu for buffer, after `pmwiki-location-list' has been set."
  (when (or pmwiki-always-rescan-toc (not pmwiki-page-toc))
    (setq pmwiki-page-toc (pmwiki-create-toc)))
  (easy-menu-change '("PmWiki") "ToC" pmwiki-page-toc)
  (let ((site-map (assoc (pmwiki-loc 'base) pmwiki-site-maps-alist)))
    (if site-map
	(easy-menu-change '("PmWiki") "SiteMap" (cdr site-map))
      (easy-menu-change '("PmWiki") "SiteMap"
			(list
			 (vector (concat "rescan for " (pmwiki-loc 'site)
					 "...")
				 'pmwiki-sitemap t)))))
  (pmwiki-update-opened-pages))

(defun pmwiki-toc ()
  "Refresh Table of Contents menu."
  (interactive)
  (setq pmwiki-page-toc (pmwiki-create-toc))
  (setq pmwiki-current-buffer (current-buffer))
  (easy-menu-change '("PmWiki") "ToC" pmwiki-page-toc)
  (when pmwiki-ee (pmwiki-ee-menubar-toc)))


(defvar pmwiki-arrived-from-ee nil
  "A variable to store the buffer of ee-menubar.")

(defvar pmwiki-from-ee-parent nil
  "A variable to store the buffer of ee-menubar parent.")
      

(defcustom pmwiki-toc-entry-regexp
  "^\\(!+\\)\\s-*\\([^!].*\\)$"
  "Regexp matching table of contents entry (e.g. (sub)chapter title).
First submatch should match a string designating hierarchy depth,
second submatch should match the title."
  :group 'pmwiki-group :type 'regexp)

(defcustom pmwiki-pages-entry-regexp
  (concat "\\(?:<a class='\\(?:wiki\\|self\\)link'"
	  " href='.*?\\(?:\\?n=\\|/\\)\\|"
	  "href='[^?]*\\?n=\\)"
	  "\\(\\w+\\)[./]\\(\\w+\\)'") ;;FIXME: recognize URL-escaped names
  "Regexp matching pagelist page link.
First submatch should match a group, second should match a page title."
  :group 'pmwiki-group :type 'regexp)

(defvar pmwiki-current-buffer nil)


(defun pmwiki-cut-menu-entry (str)
  "Formats the menu entry string."
  (if (< (length str) pmwiki-menu-entry-max-length) str
    (concat (substring str 0 (- pmwiki-menu-entry-max-length 2)) "...")))

(defun pmwiki-flatten (elems)
  "Flatten a list of lists, keep non-list elements, "
  (if (consp elems)
      (if (listp (car elems))
	  ;;FIXME: better to modify `pmwiki-create-toc'
	  ;;       not to generate (nil)
	  (append (remove nil (car elems))
		  (pmwiki-flatten (cdr elems)))
	(cons (car elems) (pmwiki-flatten (cdr elems))))
    elems))

(defun pmwiki-loc-with-anchor (pos &optional loc)
  "Location LOC (or current location) with anchor (cdddr) POS."
  (unless loc (setq loc pmwiki-location-list))
  `(,(car loc) ,(cadr loc) ,(caddr loc) . ,pos))

(defun pmwiki-create-toc ()
  "Parse the buffer and gather (sub)chapter info for table of contents menu."
  (save-excursion
    (let ((last-depth 0) (depth) (diff)
	  (menu-stack (list (list ["Show in buffer" pmwiki-toc t]))))
      (goto-char (point-min))
      (while (re-search-forward pmwiki-toc-entry-regexp (point-max) t)
	(let* ((p (make-marker))
	       (refname
		(pmwiki-cut-menu-entry
		 (pmwiki-render-string-no-properties
		  (match-string-no-properties 2))))
	       (ref
		(list
		 (vector
		  "-->"
		  `(pmwiki-edit
		    (quote ,(pmwiki-loc-with-anchor p))
		    (quote find)) t)
		 refname))
	       (leafref
		(vector
		 refname
		  `(pmwiki-edit
		    (quote ,(pmwiki-loc-with-anchor p))
		    (quote find)) t)
		))
					; heading goes last
	  (set-marker p (point))
	  (setq depth (length (match-string 1)))
	  (setq diff (- last-depth depth))
	  (while (> -1 diff)
	    (setq diff (1+ diff))
	    (setcar menu-stack (cons (list "...") (car menu-stack)))
	    (setq menu-stack (cons (list "...") menu-stack)))
	  (when (= -1 diff)
	    (setq diff (1+ diff))
	    (setcar menu-stack (cons (list nil) (car menu-stack)))
	    (setq menu-stack (cons (list nil) menu-stack))
	    )
	  (while (<= 0 diff)
	    (setq diff (1- diff))
	    (if (< 2 (length (car menu-stack)))
		(setcar (cadr menu-stack) (nreverse (car menu-stack))))
	    (pop menu-stack))
	  (setcar menu-stack (cons leafref (car menu-stack)))
	  (setq menu-stack (cons ref menu-stack))
	  (setq last-depth depth)))
      (while (cdr menu-stack)
	(if (< 2 (length (car menu-stack)))
	    (setcar (cadr menu-stack) (nreverse (car menu-stack))))
	(pop menu-stack))
      ;;FIXME: perhaps better to modify not to generate (nil)
      ;;       before flattening
      (pmwiki-flatten (nreverse (car menu-stack))))))


(defun pmwiki-split-on-regexp (string rexp &optional split-right)
  "Split STRING like with `split-string', but keep separators.
If SPLIT-RIGHT is nil, keep them in right part, else in left part.
If it is a number, move that far to the right."
    (let (
	  (start 0)
	  notfirst
	  (case-fold-search nil)
	  (list nil))
    (while (and (string-match rexp string
			      (if (< start (length string))
				  (1+ start) (1- (length string))))
		(< start (length string)))
      (setq notfirst t)
      (let ((split-point (cond
			  ((integerp split-right)
			   (+ (match-beginning 0) split-right))
			  (split-right (match-end 0))
			  (t (match-beginning 0)))))
	(setq list
	      (cons (substring string start split-point)
		    list))
	(setq start split-point)))
    (if (< start (length string))
	(setq list
	      (cons (substring string start)
		    list)))
    (nreverse list)))

(defun pmwiki-page-fullpath (group page)
  "Split group and page name into list of subgroups and page name words."
  (let ((subgroups (if pmwiki-pagelist-hyphen-subgroups
	      (pmwiki-split-on-regexp group pmwiki-pagelist-hyphen-regexp t)
	    (list group))))
    (append (subseq subgroups 0 -1)
	    (list (concat (car (last subgroups)) "/"))
	    ;; FIXME: "[:upper:][:lower:]" does not work?
	    (if pmwiki-pagelist-join-pages
		(apply
		 'append
		 (mapcar
		  (lambda (w) (pmwiki-split-on-regexp
			       w "[a-z][A-Z]" 1))
		  (pmwiki-split-on-regexp page "[A-Z][a-z]")))
		 ))))

(defun pmwiki-sitemap-defentry (site)
  "Easymenu entry to display at the beginning of SiteMap."
  (list
   (vector (concat "rescan for " site "...")
	   'pmwiki-sitemap t)
   site))


(defun pmwiki-pagelist-with-submenus (build-submenu defentry pagelist)
  "Build a hierarchical menu from an alist with locations as keys.
Function BUILD-SUBMENU should accept values from alist PAGELIST
and return `easy-menu-define' format menus."
  (let* ((last-path nil)
	 (menu-stack (list defentry))
	 (group-mem nil) (last-group "") endpoint
	 cur-entry)

    (while (and pagelist (setq cur-entry (pop pagelist)))
      (let* ((loc (car cur-entry))
	     (group (pmwiki-loc 'group loc))
	     (page (pmwiki-loc 'page loc))
	     (site-path (pmwiki-page-fullpath
			 group (pmwiki-loc 'page loc)))
	     (path (cons (pmwiki-loc 'site loc) site-path))
	     (fullpath path)
	     (refname (car (last site-path)))
	     (leafref
	      (cons refname (funcall build-submenu (cdr cur-entry)))))

	;;FIXME: the rest is the same as in `pmwiki-pagelist-cont'
	;;       (but for two last lines) and should be merged
	  (unless (and (string= group last-group)
		       (member page group-mem))
	    (while (and path last-path (cdr path) (cdr last-path)
			(string= (car path) (car last-path)))
	      (pop path) (pop last-path))
	    (while (and last-path (cdr last-path))
	      (pop last-path)
	      (when (and (= 2 (length (car menu-stack)))
		       (not (consp (caar menu-stack))))
		(aset (caar menu-stack) 0
		      (concat (cadar menu-stack)
			      (aref (caar menu-stack) 0)))
		(setcar menu-stack (caar menu-stack)))
	      (setcar (cadr menu-stack)
		      (if (listp (car menu-stack))
			  (nreverse (car menu-stack)) (car menu-stack)))
	      (pop menu-stack))
	    (while (and path (cdr path))
	      (let ((current (pop path)))
		(setcar menu-stack (cons (list current) (car menu-stack)))
		(setq menu-stack (cons (list current) menu-stack))))
	    (setcar menu-stack (cons leafref (car menu-stack)))
	    (setq last-path fullpath)
	    (if (string= group last-group)
		(push page group-mem)
	      (setq group-mem (list page)))
	    (setq last-group group))))
      (while (cdr menu-stack)
	(when (and (= 2 (length (car menu-stack)))
		   (not (consp (caar menu-stack))))
	  (aset (caar menu-stack) 0
		(concat (cadar menu-stack)
			(aref (caar menu-stack) 0)))
	  (setcar menu-stack (caar menu-stack)))
	(setcar (cadr menu-stack)
		(if (listp (car menu-stack))
		    (nreverse (car menu-stack)) (car menu-stack)))
	(pop menu-stack))
      (nreverse (car menu-stack))))

(defun pmwiki-update-opened-pages ()
  "Update the Opened Pages section in PmWiki menu."
  (setq pmwiki-buffers (remove-if-not
			(lambda (loc-buf) (buffer-live-p (cdr loc-buf)))
			pmwiki-buffers))
  (let ((menu
	 (pmwiki-pagelist-with-submenus
	  (lambda (buf)
	    (with-current-buffer buf
	      (if (> 1 (length pmwiki-page-toc))
		  pmwiki-page-toc
		(list (buffer-name)
		      (vector "-->" `(pmwiki-edit
				      (quote ,pmwiki-location-list)
				      (quote find)) t)))))
	  (list ["opened pages menu" pmwiki-pages-opened t]
		"OpenedPages")
	  pmwiki-buffers)))
    (easy-menu-change '("PmWiki") "OpenedPages" menu)))

(defun pmwiki-pages-opened ()
  "Update Opened Pages section and show it in ee-menu."
  (interactive)
  (setq pmwiki-current-buffer (current-buffer))
  (pmwiki-update-opened-pages)
  (when pmwiki-ee (pmwiki-ee-menubar-opened-pages))
  )

(defvar pmwiki-render-string-no-properties-transforms
  '(
    ("\\(?:\\[\\[##?[A-Za-z0-9_---]*\\]\\]\\)" . "")
    ("\\(?:\\[\\[[^|]*| *\\(.+?\\)\\]\\]\\)" . "\\1")
    ("\\(?:\\[\\[\\(.+?\\) *->[^]]*\\]\\]\\)" . "\\1")
    ("\\(?:\\[\\[ *\\([^]|>]+?\\) *\\]\\]\\)" . "\\1")
    ("@@\\(.+?\\)@@" . "\\1")
    ("''\\(.+?\\)''" . "\\1")
    ("'''\\(.+?\\)'''" . "\\1")
    ("''''\\(.+?\\)''''" . "\\1")
    ("'^\\(.+?\\)^'" . "^\\1")
    ("'_\\(.+?\\)_'" . "_\\1")
    )
  "Regexps to remove markup from text.
See `pmwiki-render-string-no-properties'.")

(defun pmwiki-render-string-no-properties (str)
  "Remove markup from text so that it looks more like when browsing.
Currently only processes bracketed links."
  (interactive)
  (reduce (lambda (accum transf) 
	    (replace-regexp-in-string (car transf) (cdr transf) accum))
	  pmwiki-render-string-no-properties-transforms
	  :initial-value str))

(provide 'pmwiki-mode)
;;; pmwiki-mode.el ends here


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                          menu in buffer: ee

(defvar pmwiki-display-result 'switch-to-buffer-other-window
  "A function to display `ee' buffers. Try the following:
`switch-to-buffer-other-window', `display-buffer', `switch-to-buffer'.")

(defvar pmwiki-ee nil
  "If non-nil, ee is installed.")

(defcustom pmwiki-keep-ee-window nil
  "*If nil, delete menu window after selecting, otherwise keep it."
  :group 'pmwiki-group :type 'boolean)

(when (and (require 'ee-autoloads nil t) (require 'ee-menubar nil t))
(setq pmwiki-ee t)

(defadvice ee-menubar-select (before pmwiki-remember-ee-window)
  "Set `pmwiki-arrived-from-ee' to the ee-menubar (i.e., current) buffer."
  (setq pmwiki-arrived-from-ee (current-buffer)))

(ad-activate 'ee-menubar-select)

;;; FIXME: factorize code for different menus

(defvar pmwiki-ee-data-toc
  '[(meta
     (format-version . "0.0.1")
     (database-version . "0.0.1")
     (view-data-file . "view/menubar.ee")
     (collector . pmwiki-ee-data-collect-toc)
     (fields category name title level command help event binding ())
     (key-fields name category))])

(defvar pmwiki-ee-data-sitemap
  '[(meta
     (format-version . "0.0.1")
     (database-version . "0.0.1")
     (view-data-file . "view/menubar.ee")
     (collector . pmwiki-ee-data-collect-sitemap)
     (fields category name title level command help event binding ())
     (key-fields name category))])

(defvar pmwiki-ee-data-search
  '[(meta
     (format-version . "0.0.1")
     (database-version . "0.0.1")
     (view-data-file . "view/menubar.ee")
     (collector . pmwiki-ee-data-collect-search)
     (fields category name title level command help event binding ())
     (key-fields name category))])

(defvar pmwiki-ee-data-opened-pages
  '[(meta
     (format-version . "0.0.1")
     (database-version . "0.0.1")
     (view-data-file . "view/menubar.ee")
     (collector . pmwiki-ee-data-collect-opened-pages)
     (fields category name title level command help event binding ())
     (key-fields name category))])

;;; Data Extraction

(defun pmwiki-ee-data-collect-menu (data menu)
  (let ((old-data (if ee-data
                      (mapcar (lambda (r)
                                (ee-field 'name r))
                              (ee-data-records-find ee-data '(read . t)))))
        (new-data
         (ee-data-convert-lists-to-vectors
          (ee-menubar-data-collect-items
           (ee-data-field-names data)
           (with-current-buffer pmwiki-current-buffer
	     (tmm-get-keybind menu))
           0))))
    (aset new-data 0 (aref data 0))
    (if old-data
        (ee-data-records-do
         new-data
         (lambda (r ri)
           (if (member (ee-field 'name r) old-data)
               (ee-field-set 'read t r (ee-data-meta-setters-get-set new-data))))))
    new-data))

;;Workaround for a recent bug (???)
(global-unset-key [menu-bar PmWiki Search])
(global-unset-key [menu-bar PmWiki OpenedPages])
(global-unset-key [menu-bar PmWiki ToC])

(defun pmwiki-ee-data-collect-search (data)
  (pmwiki-ee-data-collect-menu data [menu-bar PmWiki Search]))
(defun pmwiki-ee-data-collect-opened-pages (data)
  (pmwiki-ee-data-collect-menu data [menu-bar PmWiki OpenedPages]))
(defun pmwiki-ee-data-collect-toc (data)
  (pmwiki-ee-data-collect-menu data [menu-bar PmWiki ToC]))
(defun pmwiki-ee-data-collect-sitemap (data)
  (pmwiki-ee-data-collect-menu data [menu-bar PmWiki SiteMap]))

(defun pmwiki-ee-menubar-search (&optional arg)
  "Categorized access to Emacs menu-bar."
  (interactive "P")
  (or (featurep 'tmm)
      (require  'tmm))
  ;; TODO: remove next two lines, when submenus will be implemented
  ;; as categories (not records) in the ee-menubar-c-tree-builder,
  ;; so ee-hidden-expansions could be used to retain opened menus
  (let ((bufname (format "*%s Search: %s*" ee-menubar-mode-name
			 pmwiki-last-search-term)))
    (if (get-buffer bufname)
	(funcall pmwiki-display-result bufname)
      (funcall pmwiki-display-result
	       (ee-view-buffer-create-noselect
		bufname
		ee-menubar-mode-name
		ee-menubar-keymap
		pmwiki-ee-data-search)))))

(defun pmwiki-ee-menubar-opened-pages (&optional arg)
  "Categorized access to Emacs menu-bar."
  (interactive "P")
  (or (featurep 'tmm)
      (require  'tmm))
  ;; TODO: remove next two lines, when submenus will be implemented
  ;; as categories (not records) in the ee-menubar-c-tree-builder,
  ;; so ee-hidden-expansions could be used to retain opened menus
  (let ((bufname (format "*%s Opened Pages*" ee-menubar-mode-name)))
    (if (get-buffer bufname)
	(funcall pmwiki-display-result bufname)
      (funcall pmwiki-display-result
	       (ee-view-buffer-create-noselect
		bufname
		ee-menubar-mode-name
		ee-menubar-keymap
		pmwiki-ee-data-opened-pages)))))

(defun pmwiki-ee-menubar-sitemap (&optional arg)
  "Categorized access to Emacs menu-bar."
  (interactive "P")
  (or (featurep 'tmm)
      (require  'tmm))
  ;; TODO: remove next two lines, when submenus will be implemented
  ;; as categories (not records) in the ee-menubar-c-tree-builder,
  ;; so ee-hidden-expansions could be used to retain opened menus
  (let ((bufname (format "*%s SiteMap: %s*" ee-menubar-mode-name
			 (with-current-buffer pmwiki-current-buffer
			   (pmwiki-loc 'site)))))
    (if (get-buffer bufname)
	(funcall pmwiki-display-result bufname)
      (funcall pmwiki-display-result (ee-view-buffer-create-noselect
       bufname
       ee-menubar-mode-name
       ee-menubar-keymap
       pmwiki-ee-data-sitemap)))))

(defun pmwiki-ee-menubar-toc (&optional arg)
  "Categorized access to Emacs menu-bar."
  (interactive "P")
  (or (featurep 'tmm)
      (require  'tmm))
  ;; TODO: remove next two lines, when submenus will be implemented
  ;; as categories (not records) in the ee-menubar-c-tree-builder,
  ;; so ee-hidden-expansions could be used to retain opened menus
  (let ((bufname (format "*%s: %s ToC*" ee-menubar-mode-name
			 (buffer-name pmwiki-current-buffer))))
    (if (get-buffer bufname)
	(funcall pmwiki-display-result bufname)
      (funcall pmwiki-display-result (ee-view-buffer-create-noselect
       bufname
       ee-menubar-mode-name
       ee-menubar-keymap
       pmwiki-ee-data-toc)))))


(defun pmwiki-ee-view-next ()
  (interactive)
  (next-line 1)
  (while (ee-view-on-expansion-line-p)
    (while (and (ee-view-on-expansion-line-p)
		(not (ee-view-expansion-visible-p)))
      (ee-view-expansion-show)
      (next-line 1))
    (while (and (ee-view-on-expansion-line-p)
		(ee-view-expansion-visible-p))
      (next-line 1))))


(defun pmwiki-ee-view-prev ()
  (interactive)
  (previous-line 1)
  (while (and (ee-view-on-expansion-line-p)
	      (ee-view-expansion-visible-p))
    (previous-line 1))
  (when (ee-view-on-expansion-line-p)
    (next-line 1)
    (let ((next-mark (point-marker)))
      (previous-line 1)
      (while (ee-view-on-expansion-line-p)
	(while (and (ee-view-on-expansion-line-p)
		    (not (ee-view-expansion-visible-p)))
	  (ee-view-expansion-show)
	  (next-line 1))
	(goto-char next-mark)
	(previous-line 1)))))


;; end (and (require 'ee-autoloads nil t) (require 'ee-menubar nil t))
)

(unless pmwiki-running-multimode

  (defun pmwiki-multi-source (lang mode name &optional insertchar)
  "Add submode for source code.
Add submode MODE (function toggling the mode) for language LANG
 (string with the SourceBlock name of language) as NAME (any symbol).
INSERTCHAR is the character to insert the source markup with
 [C-c % INSERTCHAR] sequence."
    (interactive)
    (message "`pmwiki-multi-source': mmm-mode is not installed")
    ;FIXME: migration to mumamo?
    ;(sleep-for 2)
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; PATCH on `url-http.el' with toggable redirection

;;TODO: make `url-http-parse-headers' accept this as dynvar
;;FIXME: check if this variable is properly recognized as t inside
;;       `url-http-parse-headers'

(defvar url-http-no-redirect nil
  "Non-nil: force `url-retrieve' not to redirect, just set :redirect in status")
(make-variable-buffer-local 'url-http-no-redirect)

;; Require here so that the definition below is a redefinition
(require 'url-http nil t)

(defun url-http-parse-headers ()
 "Option not to redirect automatically, just report redirection in status."
  ;; The comments after each status code handled are taken from RFC
  ;; 2616 (HTTP/1.1)
 ;;FIXME
  (declare (special url-http-end-of-headers url-http-response-status
		    ;;FIXME: make `url-http-parse-headers' accept this dynvar
		    url-http-response-version ; url-http-no-redirect ; HERE
		    url-http-method url-http-data url-http-process
		    url-callback-function url-callback-arguments))

  (url-http-mark-connection-as-free (url-host url-current-object)
				    (url-port url-current-object)
				    url-http-process)

  (if (or (not (boundp 'url-http-end-of-headers))
	  (not url-http-end-of-headers))
      (error "Trying to parse headers in odd buffer: %s" (buffer-name)))
  (goto-char (point-min))
  (url-http-debug "url-http-parse-headers called in (%s)" (buffer-name))
  (url-http-parse-response)
  (mail-narrow-to-head)
  ;;(narrow-to-region (point-min) url-http-end-of-headers)
  (let ((connection (mail-fetch-field "Connection")))
    ;; In HTTP 1.0, keep the connection only if there is a
    ;; "Connection: keep-alive" header.
    ;; In HTTP 1.1 (and greater), keep the connection unless there is a
    ;; "Connection: close" header
    (cond 
     ((string= url-http-response-version "1.0")
      (unless (and connection
		   (string= (downcase connection) "keep-alive"))
	(delete-process url-http-process)))
     (t
      (when (and connection
		 (string= (downcase connection) "close"))
	(delete-process url-http-process)))))
  (let ((class nil)
	(success nil))
    (setq class (/ url-http-response-status 100))
    (url-http-debug "Parsed HTTP headers: class=%d status=%d" class url-http-response-status)
    (url-http-handle-cookies)

    (case class
      ;; Classes of response codes
      ;;
      ;; 5xx = Server Error
      ;; 4xx = Client Error
      ;; 3xx = Redirection
      ;; 2xx = Successful
      ;; 1xx = Informational
      (1				; Information messages
       ;; 100 = Continue with request
       ;; 101 = Switching protocols
       ;; 102 = Processing (Added by DAV)
       (url-mark-buffer-as-dead (current-buffer))
       (error "HTTP responses in class 1xx not supported (%d)" url-http-response-status))
      (2				; Success
       ;; 200 Ok
       ;; 201 Created
       ;; 202 Accepted
       ;; 203 Non-authoritative information
       ;; 204 No content
       ;; 205 Reset content
       ;; 206 Partial content
       ;; 207 Multi-status (Added by DAV)
       (case url-http-response-status
	 ((204 205)
	  ;; No new data, just stay at the same document
	  (url-mark-buffer-as-dead (current-buffer))
	  (setq success t))
	 (otherwise
	  ;; Generic success for all others.  Store in the cache, and
	  ;; mark it as successful.
	  (widen)
	  (if (and url-automatic-caching (equal url-http-method "GET"))
	      (url-store-in-cache (current-buffer)))
	  (setq success t))))
      (3				; Redirection
       ;; 300 Multiple choices
       ;; 301 Moved permanently
       ;; 302 Found
       ;; 303 See other
       ;; 304 Not modified
       ;; 305 Use proxy
       ;; 307 Temporary redirect
       (let ((redirect-uri (or (mail-fetch-field "Location")
			       (mail-fetch-field "URI"))))
	 (case url-http-response-status
	   (300
	    ;; Quoth the spec (section 10.3.1)
	    ;; -------------------------------
	    ;; The requested resource corresponds to any one of a set of
	    ;; representations, each with its own specific location and
	    ;; agent-driven negotiation information is being provided so
	    ;; that the user can select a preferred representation and
	    ;; redirect its request to that location.
	    ;; [...]
	    ;; If the server has a preferred choice of representation, it
	    ;; SHOULD include the specific URI for that representation in
	    ;; the Location field; user agents MAY use the Location field
	    ;; value for automatic redirection.
	    ;; -------------------------------
	    ;; We do not support agent-driven negotiation, so we just
	    ;; redirect to the preferred URI if one is provided.
	    nil)
	   ((301 302 307)
	    ;; If the 301|302 status code is received in response to a
	    ;; request other than GET or HEAD, the user agent MUST NOT
	    ;; automatically redirect the request unless it can be
	    ;; confirmed by the user, since this might change the
	    ;; conditions under which the request was issued.
	    (if (member url-http-method '("HEAD" "GET"))
		;; Automatic redirection is ok
		nil
	      ;; It is just too big of a pain in the ass to get this
	      ;; prompt all the time.  We will just silently lose our
	      ;; data and convert to a GET method.
	      (url-http-debug "Converting `%s' request to `GET' because of REDIRECT(%d)"
			      url-http-method url-http-response-status)
	      (setq url-http-method "GET"
		    url-http-data nil)))
	   (303
	    ;; The response to the request can be found under a different
	    ;; URI and SHOULD be retrieved using a GET method on that
	    ;; resource.
	    (setq url-http-method "GET"
		  url-http-data nil))
	   (304
	    ;; The 304 response MUST NOT contain a message-body.
	    (url-http-debug "Extracting document from cache... (%s)"
			    (url-cache-create-filename (url-view-url t)))
	    (url-cache-extract (url-cache-create-filename (url-view-url t)))
	    (setq redirect-uri nil
		  success t))
	   (305
	    ;; The requested resource MUST be accessed through the
	    ;; proxy given by the Location field.  The Location field
	    ;; gives the URI of the proxy.  The recipient is expected
	    ;; to repeat this single request via the proxy.  305
	    ;; responses MUST only be generated by origin servers.
	    (error "Redirection thru a proxy server not supported: %s"
		   redirect-uri))
	   (otherwise
	    ;; Treat everything like '300'
	    nil))
	 (when redirect-uri
	   ;; Clean off any whitespace and/or <...> cruft.
	   (if (string-match "\\([^ \t]+\\)[ \t]" redirect-uri)
	       (setq redirect-uri (match-string 1 redirect-uri)))
	   (if (string-match "^<\\(.*\\)>$" redirect-uri)
	       (setq redirect-uri (match-string 1 redirect-uri)))

	   ;; Some stupid sites (like sourceforge) send a
	   ;; non-fully-qualified URL (ie: /), which royally confuses
	   ;; the URL library.
	   (if (not (string-match url-nonrelative-link redirect-uri))
               ;; Be careful to use the real target URL, otherwise we may
               ;; compute the redirection relative to the URL of the proxy.
	       (setq redirect-uri
		     (url-expand-file-name redirect-uri url-http-target-url)))
           (let ((url-request-method url-http-method)
		 (url-request-data url-http-data)
		 (url-request-extra-headers url-http-extra-headers))
	     ;; Remember that the request was redirected.
	     (setf (car url-callback-arguments)
		   (nconc (list :redirect redirect-uri)
			  (car url-callback-arguments)))
              ;; Put in the current buffer a forwarding pointer to the new
              ;; destination buffer.
              ;; FIXME: This is a hack to fix url-retrieve-synchronously
              ;; without changing the API.  Instead url-retrieve should
              ;; either simply not return the "destination" buffer, or it
              ;; should take an optional `dest-buf' argument.
	     (if (bound-and-true-p url-http-no-redirect)	; HERE
		 (setq success t)
              (set (make-local-variable 'url-redirect-buffer)
		   (url-retrieve-internal
		    redirect-uri url-callback-function
		    url-callback-arguments))
	      (url-mark-buffer-as-dead (current-buffer)))))))
      (4				; Client error
       ;; 400 Bad Request
       ;; 401 Unauthorized
       ;; 402 Payment required
       ;; 403 Forbidden
       ;; 404 Not found
       ;; 405 Method not allowed
       ;; 406 Not acceptable
       ;; 407 Proxy authentication required
       ;; 408 Request time-out
       ;; 409 Conflict
       ;; 410 Gone
       ;; 411 Length required
       ;; 412 Precondition failed
       ;; 413 Request entity too large
       ;; 414 Request-URI too large
       ;; 415 Unsupported media type
       ;; 416 Requested range not satisfiable
       ;; 417 Expectation failed
       ;; 422 Unprocessable Entity (Added by DAV)
       ;; 423 Locked
       ;; 424 Failed Dependency
       (case url-http-response-status
	 (401
	  ;; The request requires user authentication.  The response
	  ;; MUST include a WWW-Authenticate header field containing a
	  ;; challenge applicable to the requested resource.  The
	  ;; client MAY repeat the request with a suitable
	  ;; Authorization header field.
	  (url-http-handle-authentication nil))
	 (402
	  ;; This code is reserved for future use
	  (url-mark-buffer-as-dead (current-buffer))
	  (error "Somebody wants you to give them money"))
	 (403
	  ;; The server understood the request, but is refusing to
	  ;; fulfill it.  Authorization will not help and the request
	  ;; SHOULD NOT be repeated.
	  (setq success t))
	 (404
	  ;; Not found
	  (setq success t))
	 (405
	  ;; The method specified in the Request-Line is not allowed
	  ;; for the resource identified by the Request-URI.  The
	  ;; response MUST include an Allow header containing a list of
	  ;; valid methods for the requested resource.
	  (setq success t))
	 (406
	  ;; The resource identified by the request is only capable of
	  ;; generating response entities which have content
	  ;; characteristics nota cceptable according to the accept
	  ;; headers sent in the request.
	  (setq success t))
	 (407
	  ;; This code is similar to 401 (Unauthorized), but indicates
	  ;; that the client must first authenticate itself with the
	  ;; proxy.  The proxy MUST return a Proxy-Authenticate header
	  ;; field containing a challenge applicable to the proxy for
	  ;; the requested resource.
	  (url-http-handle-authentication t))
	 (408
	  ;; The client did not produce a request within the time that
	  ;; the server was prepared to wait.  The client MAY repeat
	  ;; the request without modifications at any later time.
	  (setq success t))
	 (409
	  ;; The request could not be completed due to a conflict with
	  ;; the current state of the resource.  This code is only
	  ;; allowed in situations where it is expected that the user
	  ;; mioght be able to resolve the conflict and resubmit the
	  ;; request.  The response body SHOULD include enough
	  ;; information for the user to recognize the source of the
	  ;; conflict.
	  (setq success t))
	 (410
	  ;; The requested resource is no longer available at the
	  ;; server and no forwarding address is known.
	  (setq success t))
	 (411
	  ;; The server refuses to accept the request without a defined
	  ;; Content-Length.  The client MAY repeat the request if it
	  ;; adds a valid Content-Length header field containing the
	  ;; length of the message-body in the request message.
	  ;;
	  ;; NOTE - this will never happen because
	  ;; `url-http-create-request' automatically calculates the
	  ;; content-length.
	  (setq success t))
	 (412
	  ;; The precondition given in one or more of the
	  ;; request-header fields evaluated to false when it was
	  ;; tested on the server.
	  (setq success t))
	 ((413 414)
	  ;; The server is refusing to process a request because the
	  ;; request entity|URI is larger than the server is willing or
	  ;; able to process.
	  (setq success t))
	 (415
	  ;; The server is refusing to service the request because the
	  ;; entity of the request is in a format not supported by the
	  ;; requested resource for the requested method.
	  (setq success t))
	 (416
	  ;; A server SHOULD return a response with this status code if
	  ;; a request included a Range request-header field, and none
	  ;; of the range-specifier values in this field overlap the
	  ;; current extent of the selected resource, and the request
	  ;; did not include an If-Range request-header field.
	  (setq success t))
	 (417
	  ;; The expectation given in an Expect request-header field
	  ;; could not be met by this server, or, if the server is a
	  ;; proxy, the server has unambiguous evidence that the
	  ;; request could not be met by the next-hop server.
	  (setq success t))
	 (otherwise
	  ;; The request could not be understood by the server due to
	  ;; malformed syntax.  The client SHOULD NOT repeat the
	  ;; request without modifications.
	  (setq success t)))
       ;; Tell the callback that an error occurred, and what the
       ;; status code was.
       (when success
	 (setf (car url-callback-arguments)
	       (nconc (list :error (list 'error 'http url-http-response-status))
		      (car url-callback-arguments)))))
      (5
       ;; 500 Internal server error
       ;; 501 Not implemented
       ;; 502 Bad gateway
       ;; 503 Service unavailable
       ;; 504 Gateway time-out
       ;; 505 HTTP version not supported
       ;; 507 Insufficient storage
       (setq success t)
       (case url-http-response-status
	 (501
	  ;; The server does not support the functionality required to
	  ;; fulfill the request.
	  nil)
	 (502
	  ;; The server, while acting as a gateway or proxy, received
	  ;; an invalid response from the upstream server it accessed
	  ;; in attempting to fulfill the request.
	  nil)
	 (503
	  ;; The server is currently unable to handle the request due
	  ;; to a temporary overloading or maintenance of the server.
	  ;; The implication is that this is a temporary condition
	  ;; which will be alleviated after some delay.  If known, the
	  ;; length of the delay MAY be indicated in a Retry-After
	  ;; header.  If no Retry-After is given, the client SHOULD
	  ;; handle the response as it would for a 500 response.
	  nil)
	 (504
	  ;; The server, while acting as a gateway or proxy, did not
	  ;; receive a timely response from the upstream server
	  ;; specified by the URI (e.g. HTTP, FTP, LDAP) or some other
	  ;; auxiliary server (e.g. DNS) it needed to access in
	  ;; attempting to complete the request.
	  nil)
	 (505
	  ;; The server does not support, or refuses to support, the
	  ;; HTTP protocol version that was used in the request
	  ;; message.
	  nil)
	 (507				; DAV
	  ;; The method could not be performed on the resource
	  ;; because the server is unable to store the representation
	  ;; needed to successfully complete the request.  This
	  ;; condition is considered to be temporary.  If the request
	  ;; which received this status code was the result of a user
	  ;; action, the request MUST NOT be repeated until it is
	  ;; requested by a separate user action.
	  nil))
       ;; Tell the callback that an error occurred, and what the
       ;; status code was.
       (when success
	 (setf (car url-callback-arguments)
	       (nconc (list :error (list 'error 'http url-http-response-status))
		      (car url-callback-arguments)))))
      (otherwise
       (error "Unknown class of HTTP response code: %d (%d)"
	      class url-http-response-status)))
    (if (not success)
	(url-mark-buffer-as-dead (current-buffer)))
    (url-http-debug "Finished parsing HTTP headers: %S" success)
    (widen)
    success))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Bug fix: workaround to get ee menus working (looks reasonable)

(defun tmm-get-keybind (keyseq)
  "Return the current binding of KEYSEQ, merging prefix definitions.
If KEYSEQ is a prefix key that has local and global bindings,
we merge them into a single keymap which shows the proper order of the menu.
However, for the menu bar itself, the value does not take account
of `menu-bar-final-items'."
  (let (allbind bind minorbind localbind globalbind)
    (setq bind (key-binding keyseq))
    ;; If KEYSEQ is a prefix key, then BIND is either nil
    ;; or a symbol defined as a keymap (which satisfies keymapp).
    (if (keymapp bind)
	(setq bind nil))
    ;; If we have a non-keymap definition, return that.
    (or bind
	(progn
	  ;; Otherwise, it is a prefix, so make a list of the subcommands.
	  ;; Make a list of all the bindings in all the keymaps.
	  (setq minorbind (mapcar 'cdr (minor-mode-key-binding keyseq)))
	  (setq localbind (local-key-binding keyseq))
	  (setq globalbind (cdr (global-key-binding keyseq)))

	  ;; If items have been redefined/undefined locally, remove them from
	  ;; the global list.
	  (when globalbind
	    (dolist (minor minorbind)
	      (dolist (item (cdr minor))
		(setq globalbind (assq-delete-all (car item) globalbind))))
	    (dolist (item (cdr localbind))
	      (setq globalbind (assq-delete-all (car item) globalbind))))
	    
	  (setq globalbind (cons 'keymap globalbind))
	  (setq allbind (cons globalbind (cons localbind minorbind)))

	  ;; Merge all the elements of ALLBIND into one keymap.
	  (mapc (lambda (in)
		  (if (and (symbolp in) (keymapp in))
		      (setq in (symbol-function in)))
		  (and in (keymapp in)
		       (if (keymapp bind)
			   (setq bind (nconc bind (copy-sequence (cdr in))))
			 (setq bind (copy-sequence in)))))
		  allbind)
	  ;; Return that keymap.
	  bind))))
