(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(c-basic-offset 4)
 '(c-default-style (quote ((java-mode . "java") (awk-mode . "awk") (other . "k&r"))))
 '(c-offsets-alist (quote ((inline-open . 0) (innamespace . 0))))
 '(c-tab-always-indent nil)
 '(column-number-mode t)
 '(compilation-always-kill t)
 '(cperl-extra-newline-before-brace nil)
 '(cperl-extra-newline-before-brace-multiline nil)
 '(dired-dwim-target t)
 '(dired-use-ls-dired t)
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
 '(ede-project-placeholder-cache-file "~/.emacs.d/projects.ede")
 '(ede-simple-save-directory "~/.emacs.d/ede-simple")
 '(fill-column 79)
 '(flymake-no-changes-timeout 5)
 '(flyspell-issue-welcome-flag nil)
 '(flyspell-large-region nil)
 '(font-latex-fontify-sectioning 1.0)
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(git-commit-fill-column 100000)
 '(grep-command "grep -nH ")
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(ispell-highlight-face (quote flyspell-incorrect))
 '(magit-item-highlight-face nil)
 '(magit-save-some-buffers (quote dontask))
 '(magit-stage-all-confirm nil)
 '(magit-status-buffer-switch-function (quote switch-to-buffer))
 '(magit-status-verbose-untracked nil)
 '(magit-unstage-all-confirm nil)
 '(make-backup-files nil)
 '(org-link-frame-setup (quote ((vm . vm-visit-folder-other-frame) (vm-imap . vm-visit-imap-folder-other-frame) (gnus . org-gnus-no-new-news) (file . find-file) (wl . wl-other-frame))))
 '(org-tab-follows-link t)
 '(rebox-style-loop (quote (370 243)))
 '(reftex-default-bibliography (quote ("~/Dropbox/0-Work/library.bib")))
 '(safe-local-variable-values (quote ((rebox-min-fill-column . 100) (rebox-min-fill-column . 110) (rebox-min-fill-column . 120))))
 '(scroll-bar-mode (quote right))
 '(semanticdb-default-save-directory "~/.emacs.d/semanticdb")
 '(size-indication-mode t)
 '(srecode-map-save-file "~/.emacs.d/srecode/srecode-map")
 '(tramp-auto-save-directory "/tmp/")
 '(vc-handled-backends (quote (svn)))
 '(wl-init-file "~/.emacs.d/wl-init.el")
 '(wl-message-scroll-amount 6))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 117 :width normal :foundry "Misc" :family "Fixed"))))
 '(bm-face ((t (:background "#604000"))))
 '(bm-fringe-face ((t (:background "DarkOrange1"))))
 '(bold ((t (:bold t))))
 '(bold-italic ((t (:italic t :bold t))))
 '(cperl-array-face ((t (:foreground "#5555ff" :weight bold))))
 '(cperl-hash-face ((t (:foreground "orange" :slant italic :weight bold))))
 '(cursor ((t (:background "palegoldenrod"))))
 '(diff-added ((t (:inherit diff-changed :foreground "#33ff33"))))
 '(diff-changed-face ((t nil)) t)
 '(diff-file-header ((t (:background "grey20" :weight bold))))
 '(diff-file-header-face ((t (:background "grey60" :weight bold))) t)
 '(diff-header ((t (:background "grey10"))))
 '(diff-removed ((t (:inherit diff-changed :foreground "#ff3333"))))
 '(diff-removed-face ((t (:inherit diff-changed :background "#553333"))) t)
 '(diredp-dir-priv ((t (:foreground "#7474FFFFFFFF"))))
 '(diredp-exec-priv ((t nil)))
 '(diredp-no-priv ((t nil)))
 '(diredp-read-priv ((t nil)))
 '(diredp-write-priv ((t nil)))
 '(ecb-default-highlight-face ((t (:background "RoyalBlue4"))))
 '(font-latex-sectioning-5-face ((((class color) (background dark)) (:foreground "#00c000"))))
 '(font-latex-slide-title-face ((t (:inherit (variable-pitch font-lock-type-face) :weight bold))))
 '(font-latex-warning-face ((((class color) (background dark)) (:foreground "#c00000"))))
 '(font-lock-builtin-face ((t (:foreground "LightSteelBlue"))))
 '(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face))))
 '(font-lock-comment-face ((t (:foreground "chocolate1"))))
 '(font-lock-constant-face ((t (:foreground "Aquamarine"))))
 '(font-lock-doc-face ((t (:inherit font-lock-string-face))))
 '(font-lock-function-name-face ((t (:foreground "LightSkyBlue"))))
 '(font-lock-keyword-face ((t (:foreground "Cyan1"))))
 '(font-lock-preprocessor-face ((t (:foreground "Orchid"))))
 '(font-lock-string-face ((t (:foreground "LightSalmon"))))
 '(font-lock-type-face ((t (:foreground "PaleGreen"))))
 '(font-lock-variable-name-face ((t (:foreground "LightGoldenrod"))))
 '(font-lock-warning-face ((((class color) (min-colors 88) (background dark)) (:foreground "Red" :weight bold))))
 '(fringe ((t (:background "gray10"))))
 '(highlight ((t (:background "#222277"))))
 '(hl-line ((t (:background "#112233"))))
 '(isearch ((t (:foreground "brown4" :background "palevioletred2"))))
 '(lazy-highlight ((t (:background "paleturquoise4"))))
 '(link ((t (:underline t :foreground "cyan1"))))
 '(link-visited ((t (:underline t :foreground "violet"))))
 '(minibuffer-prompt ((t (:foreground "cyan"))))
 '(mode-line ((t (:foreground "white" :background "gray10"))))
 '(mode-line-buffer-id ((t (:foreground "white" :background "gray10"))))
 '(mode-line-inactive ((t (:foreground "white" :background "gray10"))))
 '(mode-line-mousable ((t (:foreground "white" :background "gray10"))))
 '(mode-line-mousable-minor-mode ((t (:foreground "white" :background "gray10"))))
 '(modeline ((t (:foreground "white" :background "gray10"))))
 '(modeline-mousable ((t (:foreground "white" :background "gray10"))))
 '(modeline-mousable-minor-mode ((t (:foreground "white" :background "gray10"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "white"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "sandy brown"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "indian red"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "medium aquamarine"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "saddle brown"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "dark khaki"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "cadet blue"))))
 '(region ((t (:background "blue3"))))
 '(secondary-selection ((t (:background "SkyBlue4"))))
 '(semantic-complete-inline-face ((t (:underline "yellow"))))
 '(semantic-decoration-on-fileless-includes ((t (:background "#009000"))))
 '(semantic-decoration-on-private-members-face ((t (:background "#200000"))))
 '(semantic-decoration-on-protected-members-face ((t (:background "#000020"))))
 '(semantic-decoration-on-unknown-includes ((t (:background "#900000"))))
 '(semantic-decoration-on-unparsed-includes ((t (:background "#555500"))))
 '(semantic-highlight-edits-face ((t (:background "gray20"))))
 '(semantic-highlight-func-current-tag-face ((t (:background "gray20"))))
 '(semantic-regtest-reference-button-face ((t (:forground "ForestGreen" :bold t))))
 '(semantic-regtest-test-button-face ((t (:forground "blue" :bold t))))
 '(semantic-tag-boundary-face ((((class color) (background dark)) (:overline "#0000a0"))))
 '(semantic-unmatched-syntax-face ((t (:background "#300000"))))
 '(senator-momentary-highlight-face ((t (:background "gray30"))))
 '(show-paren-match-face ((t (:foreground "#0090FF" :background "black"))) t)
 '(show-paren-mismatch-face ((t (:foreground "white" :background "purple"))) t)
 '(trailing-whitespace ((t (:background "red1")))))

;; ---------------------------------
;; --- ELPA package repositories ---
;; ---------------------------------

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; --------------------------
;; --- Start emacs server ---
;; --------------------------

(server-start)

;; -----------------------------------
;; --- Load some custom extensions ---
;; -----------------------------------

(add-to-list 'load-path "~/.emacs.d/")

;; --- autoload lilypond major mode ---

(add-to-list 'load-path "~/.emacs.d/lilypond-2.12.1/")
(autoload 'LilyPond-mode "lilypond-mode" "LilyPond Editing Mode" t)

(add-to-list 'auto-mode-alist '("\\.ly$" . LilyPond-mode))
(add-to-list 'auto-mode-alist '("\\.ily$" . LilyPond-mode))
(add-to-list 'auto-mode-alist '("\\.lytex$" . latex-mode))
(add-hook 'LilyPond-mode-hook (lambda () (turn-on-font-lock)))

;; --- set up hunspell for flyspell-mode ---

(setq ispell-program-name "/usr/bin/hunspell")

(setq ispell-local-dictionary-alist
      '(("en_US" ; Yankee English
         "[A-Za-z]" "[^A-Za-z]" "[']" t ("-d" "en_US") nil utf-8)
        ("en_GB" ; British English
         "[A-Za-z]" "[^A-Za-z]" "[']" t ("-d" "en_GB") nil utf-8)
        ("de_DE"
         "[a-zäöüßA-ZÄÖÜ]" "[^a-zäöüßA-ZÄÖÜ]" "['-]" t ("-d" "de_DE") nil utf-8)
        )
      )

;; --- pmwiki mode ---

(setq pmwiki-main-wiki-base-uri
      "http://taekwondo-wiki.de/")
(setq pmwiki-main-homepage-uri
      (concat pmwiki-main-wiki-base-uri "Main/HomePage"))

;; --- simple generic-mode for structures wiki notes ---

(require 'generic-x)

(defface my-title-text-face
  '((t (:foreground "Cyan1" :weight bold)))
  "My custom face for wiki note titles")

(define-generic-mode 'notes-mode
  '("#")                            ; comments start with '#'
  '()                               ; keywords
  '(("^\\(Titel\\)=\\(.*\\)" (1 'font-lock-type-face) (2 'my-title-text-face))
    ("^\\(.*\\)=\\(.*\\)" (1 'font-lock-type-face) (2 'font-lock-variable-name-face))
    )
  '("\\.txw$")                        ;; files for which to activate this mode
  ()                                 ;; other functions to call
  "A mode for structured wiki-like notes"
)

;; --- autoload dokuwiki editing mode ---

(global-unset-key [(control v)])

(autoload 'dokuwiki-mode "dokuwiki" "DokuWiki Mode" t)
(autoload 'dokuwiki-get-page "dokuwiki" "DokuWiki Mode" t)

(global-set-key [(control v)(control d)] 'dokuwiki-get-page)

(setq dokuwiki-username "Timo"
      dokuwiki-password "test"
      dokuwiki-base-url "idlebox.net/dw")

;; --- org-mode customizations ---

(add-hook 'org-mode-hook (lambda ()
                           (local-unset-key [(meta shift up)])
                           (local-unset-key [(meta shift down)])
                           (local-set-key [(control shift up)] 'org-shiftmetaup)
                           (local-set-key [(control shift down)] 'org-shiftmetadown)
                           ))

(setq org-default-notes-file "~/Dropbox/0-Work/TODO.org")
(define-key global-map "\C-cc" 'org-capture)

;; -- load Dired+ when dired is loaded

(add-hook 'dired-load-hook
          (lambda ()
            (require 'dired+)
            (require 'dired-copy-paste)
            )
          )

(defun my-dired-mouse-find-file (event)
  "In dired, visit the file or directory name you click on."
  (interactive "e")
  (let (window pos file)
    (save-excursion
      (setq window (posn-window (event-end event))
	    pos (posn-point (event-end event)))
      (if (not (windowp window))
	  (error "No file chosen"))
      (set-buffer (window-buffer window))
      (goto-char pos)
      (setq file (dired-get-file-for-visit)))
    (if (file-directory-p file)
	(or (and (cdr dired-subdir-alist)
		 (dired-goto-subdir file))
	    (progn
	      (select-window window)
	      (dired file)))
      (select-window window)
      (find-file (file-name-sans-versions file t)))))

(defun set-my-dired-keys-hook ()
  "My favorite dired keys."
  ; for some reason mouse-2 = left click (mouse-1)
  (define-key dired-mode-map [mouse-2] 'my-dired-mouse-find-file)
  (define-key dired-mode-map [M-mouse-2] 'diredp-mouse-find-file-other-frame)
  ; backspace
  (define-key dired-mode-map [backspace] 'dired-up-directory)
)

(add-hook 'dired-mode-hook 'set-my-dired-keys-hook)

;; -------------------------------
;; --- Automatic Mode Triggers ---
;; -------------------------------

; cperl-mode is preferred to perl-mode
(defalias 'perl-mode 'cperl-mode)

; special web site scripts
(add-to-list 'auto-mode-alist '("\\.htt\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.blog\\'" . html-mode))

; perl XS extensions recognition
(add-to-list 'auto-mode-alist '("\\.xs\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.pc\\'" . c++-mode))

; some more c++ files
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.tcc\\'" . c++-mode))

; doxygen mode
(defun my-dox-mode ()
  "Add some latex macro keys"
  (interactive)
  (c++-mode)
  (visual-line-mode 1)
  (flyspell-mode)
  (set-variable 'fill-column 100000)
)
(add-to-list 'auto-mode-alist '("\\.dox\\'" . my-dox-mode))

; customize markdown mode
; doxygen mode
(defun my-markdown-mode ()
  "Customize markdown mode"
  (interactive)
  (visual-line-mode 1)
  (flyspell-mode)
  (set-variable 'fill-column 100000)
)
(add-hook 'markdown-mode-hook 'my-markdown-mode)

;; -----------------------------
;; --- General Customization ---
;; -----------------------------

; turn on paren matching
(show-paren-mode t)
(setq show-paren-style 'mixed)

; disable toolbar
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

; make all "yes or no" prompts show "y or n" instead
(fset 'yes-or-no-p 'y-or-n-p)

; hook for cperl-mode to automatically set my favorite style
(add-hook 'cperl-mode-hook (lambda () (cperl-set-style "C++")))

; "filename [mode]" in title bar
(setq frame-title-format '("%f [mode: %m] @ " (getenv "HOSTNAME")))

; kills all them buffers except scratch.
(defun nuke-all-buffers ()
  "kill all buffers, leaving *scratch* only"
  (interactive)
  (mapcar (lambda (x) (kill-buffer x)) (buffer-list))
  (delete-other-windows))

(global-set-key (kbd "C-x K") 'nuke-all-buffers)

;; --------------------------------
;; --- Some custom key bindings ---
;; --------------------------------

(global-set-key "\M-g" 'goto-line)

(global-set-key [C-x C-b] 'buffer-menu)
(global-set-key [M-S-up] 'buffer-menu)

(global-set-key [M-S-left] 'previous-buffer)
(global-set-key [M-S-right] 'next-buffer)

; window handling
(global-set-key "\M-`" 'delete-other-windows)
(global-set-key "\M-2" 'new-frame)
(global-set-key "\M-3" 'delete-frame)

; set keys f9-f12 to insert German umlauts and sz
(global-set-key (kbd "<f9>") (lambda() (interactive) (insert ?\ä)))
(global-set-key (kbd "<S-f9>") (lambda() (interactive) (insert ?\Ä)))
(global-set-key (kbd "<f10>") (lambda() (interactive) (insert ?\ö)))
(global-set-key (kbd "<S-f10>") (lambda() (interactive) (insert ?\Ö)))
(global-set-key (kbd "<f11>") (lambda() (interactive) (insert ?\ü)))
(global-set-key (kbd "<S-f11>") (lambda() (interactive) (insert ?\Ü)))
(global-set-key (kbd "<f12>") (lambda() (interactive) (insert ?\ß)))

; more insertion macros associated with f9-f12
(global-set-key (kbd "<M-f9>") (lambda() (interactive)
  (insert " *  Copyright (C) 2013 Timo Bingmann <tb@panthema.net>")))

; magit status

(global-set-key (kbd "<C-f12>") 'magit-status)

; svn integration

(autoload 'svn-status "dsvn" "Run `svn status'." t)
(autoload 'svn-update "dsvn" "Run `svn update'." t)

(global-set-key (kbd "<C-f11>") 'svn-status)

; go to last edit point

(global-set-key [(ctrl meta l)] 'goto-last-change);

; bind Backspace and Delete keys with M- and C- to special kill functions

(defun dove-backward-kill-word (&optional arg)
  "Backward kill word, but do not insert it into kill-ring"
  (interactive "P")
  (let (( end (point) )
        ( beg (progn (backward-word arg) (point)))
        )
    (delete-region beg end)
    )
  )

(defun dove-forward-kill-word (&optional arg)
  "Backward kill word, but do not insert it into kill-ring"
  (interactive "P")
  (let (( beg (point) )
        ( end (progn (forward-word arg) (point)))
        )
    (delete-region beg end)
    )
  )

(global-set-key [(meta backspace)] 'backward-kill-word)
(global-set-key [(control backspace)] 'dove-backward-kill-word)
(global-set-key [(meta delete)] 'kill-word)
(global-set-key [(control delete)] 'dove-forward-kill-word)

; special bindings for latex quickies

(defun my-latex-key-bindings ()
  "Add some latex macro keys"
  (interactive)
  (turn-on-reftex)
  (visual-line-mode 1)
  (local-set-key "\C-\M-z" (lambda () (interactive) (insert "\\mathbb{Z}")))
  (local-set-key "\C-\M-n" (lambda () (interactive) (insert "\\mathbb{N}")))
  (local-set-key (kbd "C-M-S-n") (lambda () (interactive) (insert "\\!{}_1\\mathbb{N}_")))
  (local-set-key "\C-\M-q" (lambda () (interactive) (insert "\\mathbb{Q}")))
  (local-set-key "\C-\M-f" (lambda () (interactive) (insert "\\mathbb{F}")))
  (local-set-key "\C-\M-r" (lambda () (interactive) (insert "\\mathbb{R}")))
  (local-set-key "\C-\M-c" (lambda () (interactive) (insert "\\mathbb{C}")))
  (local-set-key "\C-b" (lambda () (interactive) (insert "\\mathbb{")))
  (local-set-key "\C-f" (lambda () (interactive) (insert "\\mathfrak{")))
  (local-set-key "\C-\M-o" (lambda () (interactive) (insert "\\operatorname{")))
  (local-set-key [M-S-down] (lambda () (interactive) (reftex-toc)))
  (local-set-key "\C-\M-r" (lambda () (interactive) (reftex-reference)))
)

(add-hook 'tex-mode-hook 'my-latex-key-bindings)
(add-hook 'latex-mode-hook 'my-latex-key-bindings)
(add-hook 'TeX-mode-hook 'my-latex-key-bindings)
(add-hook 'LaTeX-mode-hook 'my-latex-key-bindings)

(require 'flymake)

(defun flymake-get-tex-args (file-name)
  (list "pdflatex" (list "-file-line-error" "-interaction=nonstopmode" "-shell-escape" file-name)))

; doxymacs: automatically activate font-lock overlay mode for C/C++ files

(defun my-doxymacs-font-lock-hook ()
  (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
      (doxymacs-font-lock)))
(add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)

;; bm line bookmark mode

(global-set-key (kbd "<M-f2>") 'bm-toggle)
(global-set-key (kbd "<f2>")   'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)

;; ---------------------------
;; --- CEDET Configuration ---
;; ---------------------------

(setq cedet-root-path (file-name-as-directory "~/.emacs.d/cedet-bzr/"))

(load-file (concat cedet-root-path "cedet-devel-load.el"))
(add-to-list 'load-path (concat cedet-root-path "contrib"))

;; select which submodes we want to activate
(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-decoration-mode)
;(add-to-list 'semantic-default-submodes 'global-semantic-highlight-edits-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-show-parser-state-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-show-unmatched-syntax-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-breadcrumbs-mode)

;; add knowledge of qt to emacs
(setq qt4-base-dir "/usr/include/qt4")
(semantic-add-system-include qt4-base-dir 'c++-mode)
(semantic-add-system-include (concat qt4-base-dir "/Qt") 'c++-mode)
(semantic-add-system-include (concat qt4-base-dir "/QtGui") 'c++-mode)
(semantic-add-system-include (concat qt4-base-dir "/QtCore") 'c++-mode)
(semantic-add-system-include (concat qt4-base-dir "/QtTest") 'c++-mode)
(semantic-add-system-include (concat qt4-base-dir "/QtNetwork") 'c++-mode)
(semantic-add-system-include (concat qt4-base-dir "/QtSvg") 'c++-mode)
(add-to-list 'auto-mode-alist (cons qt4-base-dir 'c++-mode))

(defvar semantic-lex-c-preprocessor-symbol-file '())
(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt4-base-dir "/Qt/qconfig.h"))
(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt4-base-dir "/Qt/qconfig-large.h"))
(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt4-base-dir "/Qt/qglobal.h"))

;; Activate semantic
(setq semanticdb-default-save-directory "~/.emacs.d/semanticdb")
(semantic-mode 1)

; load semantic databases
(require 'semantic/ia)
(require 'semantic/bovine/gcc) ; or depending on you compiler

;; if you want to enable support for gnu global
(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)

(when (cedet-ectag-version-check t)
  (semantic-load-enable-primary-ectags-support))

;; enable ctags for some languages:
;;  Unix Shell, Perl, Pascal, Tcl, Fortran, Asm
(when (cedet-ectag-version-check)
  (semantic-load-enable-primary-exuberent-ctags-support))

(setq-mode-local c-mode semanticdb-find-default-throttle
                 '(project unloaded system recursive))

;; load contrib library
(require 'eassist)

;; customisation of modes
(defun my-cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol)
  ;;
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)
  ;;
  ;;(local-set-key "\C-ct" 'eassist-switch-h-cpp)
  ;;(local-set-key "\C-xt" 'eassist-switch-h-cpp)
  (local-set-key "\C-ce" 'eassist-list-methods)
  ;;
  (local-set-key "\C-cr" 'semantic-symref)
  ;;
  (local-set-key "\C-c<" 'semantic-ia-fast-jump)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-ia-show-summary)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  (local-set-key "\C-c\C-r" 'semantic-symref-rename-local-variable)

  (local-set-key "\C-cb" 'ecb-activate)

  (gtags-mode t)
  (local-set-key "\C-cf" 'gtags-find-tag)

  (qt-cedet-setup)
  )
(add-hook 'c-mode-common-hook 'my-cedet-hook)
(add-hook 'lisp-mode-hook 'my-cedet-hook)
(add-hook 'scheme-mode-hook 'my-cedet-hook)
(add-hook 'emacs-lisp-mode-hook 'my-cedet-hook)
(add-hook 'erlang-mode-hook 'my-cedet-hook)

;; SRecode
(global-srecode-minor-mode 1)

;; EDE
(global-ede-mode 1)
(ede-enable-generic-projects)

;; ECB
(add-to-list 'load-path (expand-file-name "~/.emacs.d/ecb-alexott/"))
(require 'ecb)
;(require 'ecb-autoloads)

;; CMake Projects
(ede-cpp-root-project "stxxl"
                      :file "~/Dropbox/stxxl/CMakeLists.txt"
                      :include-path '("/include/")
                      )

(ede-cpp-root-project "parallel-string-sorting"
                      :file "~/Dropbox/parallel-string-sorting/CMakeLists.txt"
                      )

(ede-cpp-root-project "bispanning"
                      :file "~/Dropbox/bispanning/CMakeLists.txt"
                      )

(ede-cpp-root-project "panthema"
                      :file "~/DropboxA/Web/panthema.net/panthema/src/CMakeLists.txt"
                      )

(defun qt-cedet-setup ()
  "Set up c-mode and related modes. Includes support for Qt code (signal, slots and alikes)."

  ;; qt keywords and stuff ...
  ;; set up indenting correctly for new qt kewords
  (setq c-protection-key (concat "\\<\\(public\\|public slot\\|protected"
                                 "\\|protected slot\\|private\\|private slot"
                                 "\\)\\>")
        c-C++-access-key (concat "\\<\\(signals\\|public\\|protected\\|private"
                                 "\\|public slots\\|protected slots\\|private slots"
                                 "\\)\\>[ \t]*:"))

  ;; modify the colour of slots to match public, private, etc ...
  (font-lock-add-keywords 'c++-mode '(("\\<\\(slots\\|signals\\)\\>" . font-lock-type-face)))
  ;; make new font for rest of qt keywords
  (make-face 'qt-keywords-face)
  (set-face-foreground 'qt-keywords-face "MediumPurple")
  ;; qt keywords
  (font-lock-add-keywords 'c++-mode '(("\\<Q_[A-Z]*\\>" . 'qt-keywords-face)))
  (font-lock-add-keywords 'c++-mode '(("\\<SIGNAL\\|SLOT\\>" . 'qt-keywords-face)))
  ;(font-lock-add-keywords 'c++-mode '(("\\<Q[A-Z][A-Za-z]*\\>" . 'qt-keywords-face)))
  ;(font-lock-add-keywords 'c++-mode '(("\\<Q[A-Z_]+\\>" . 'qt-keywords-face)))
  ;(font-lock-add-keywords 'c++-mode
  ;                        '(("\\<q\\(Debug\\|Wait\\|Printable\\|Max\\|Min\\|Bound\\)\\>" . 'font-lock-builtin-face)))

  ;(setq c-macro-names-with-semicolon '("Q_OBJECT" "Q_PROPERTY" "Q_DECLARE" "Q_ENUMS"))
  ;(c-make-macro-with-semi-re)
  )

;; --------------------------------
;; --- Recompile Same Directory ---
;; --------------------------------

(global-set-key [f5] 'compile-again)

(setq compilation-last-buffer nil)

(defun compile-again (pfx)
  """Run the same compile as the last time.
If there was no last time, or there is a prefix argument, this acts like
M-x compile.
"""
 (interactive "p")
 (if (and (eq pfx 1)
	  compilation-last-buffer)
     (progn
       (set-buffer compilation-last-buffer)
       (revert-buffer t t))
   (call-interactively 'compile)))

;; --------------------------------
;; --- Wanderlust E-Mail Client ---
;; --------------------------------

(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)
