(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bibtex-comma-after-last-field t)
 '(bibtex-maintain-sorted-entries 'crossref)
 '(c-basic-offset 4)
 '(c-default-style '((java-mode . "java") (awk-mode . "awk") (other . "k&r")))
 '(c-offsets-alist '((inline-open . 0) (innamespace . +)))
 '(c-tab-always-indent nil)
 '(custom-safe-themes
   '("115d42fa02a5ce6a759e38b27304e833d57a48422c2408d5455f14450eb96554" default))
 '(ediff-autostore-merges t)
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(flyspell-issue-welcome-flag nil)
 '(js-indent-level 2)
 '(org-confirm-shell-link-function nil)
 '(org-export-allow-bind-keywords t)
 '(org-export-backends '(ascii html latex md))
 '(org-html-validation-link "")
 '(org-link-frame-setup
   '((vm . vm-visit-folder-other-frame)
     (vm-imap . vm-visit-imap-folder-other-frame)
     (gnus . org-gnus-no-new-news)
     (file . find-file)
     (wl . wl-other-frame)))
 '(org-link-shell-confirm-function nil)
 '(org-tab-follows-link t)
 '(org-table-number-regexp
   "^\\([<>]?[-+^.,0-9]*[0-9][-+^.,0-9eEdDx()%:]*\\|[<>]?[-+]?0[xX][[:xdigit:].]+\\|[<>]?[-+]?[0-9]+#[0-9a-zA-Z.,]+\\|nan\\|[-+u]?inf\\)$")
 '(org-time-clocksum-format
   '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))
 '(package-selected-packages
   '(org auto-package-update bnf-mode latex latex-mode html-mode lsp-java projectile haskell-mode coffee-mode basic-mode csv-mode auctex lsp-ui lsp-mode magit scala-mode qml-mode python-mode protobuf-mode php-mode lua-mode groovy-mode csharp-mode cmake-mode bison-mode arduino-mode apache-mode yaml-mode pandoc-mode nginx-mode markdown-mode dockerfile-mode dired-copy-paste dired+ yasnippet ws-butler smooth-scrolling smex rainbow-delimiters iedit goto-last-change diminish bm ag leuven-theme grandshell-theme quelpa-use-package))
 '(safe-local-variable-values
   '((magit-commit-arguments "--author" "John SJ Anderson <john@working.works>")
     (magit-commit-arguments "--author=John SJ Anderson <john@working.works>"))))

;; -----------------------------------------------------------------------------
;; --- Start emacs server
;; -----------------------------------------------------------------------------

(server-start)

;; -----------------------------------------------------------------------------
;; MELPA Package Management
;; -----------------------------------------------------------------------------

(require 'package)

(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;(package-refresh-contents)
;(package-autoremove)

;; Install `use-package`.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Always automatically install packages.
(setq use-package-always-ensure t
      use-package-expand-minimally t
      use-package-compute-statistics t)

;; Emacs Lisp packages built directly from source.
(use-package quelpa
  :init
  (setq quelpa-update-melpa-p nil)
  )

;; quelpa handler for use-package.
(use-package quelpa-use-package)

;; -----------------------------------------------------------------------------
;; --- change default font
;; -----------------------------------------------------------------------------

;(set-face-font 'default "-misc-fixed-medium-r-normal--15-*-*-*-c-90-iso8859-1")

;(set-face-font 'default "-*-FiraCode-medium-r-*-*-16-*-*-*-*-*-*-*")

(set-face-font 'default "-*-Terminus-medium-r-*-*-18-*-*-*-*-*-*-*")
;(set-face-font 'default "-*-Helvetica-medium-r-normal-*-14-*-*-*-m-*-fontset-Helvetica")

;(set-frame-font "-zevv-peep-medium-r-normal--16-*-*-*-c-*-*")

;(create-fontset-from-fontset-spec "-misc-fixed-medium-r-normal--15-*-*-*-c-90-fontset-Fixed")
;(create-fontset-from-fontset-spec "-*-Droid Sans Mono-medium-r-normal-*-14-*-*-*-m-*-fontset-Droid")
;(create-fontset-from-fontset-spec "-*-Terminus-medium-r-normal-*-16-*-*-*-m-*-fontset-Terminus")
;(create-fontset-from-fontset-spec "-zevv-peep-medium-r-normal--16-*-*-*-c-*-fontset-Zevv")

(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)

(global-set-key (kbd "<mouse-6>") (lambda (event) (interactive "e")))
(global-set-key (kbd "<mouse-7>") (lambda (event) (interactive "e")))

;; -----------------------------------------------------------------------------
;; --- Load theme and override faces via customize
;; -----------------------------------------------------------------------------

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-fold-unfolded-face ((t (:background "#151823"))))
 '(diredp-omit-file-name ((t (:inherit diredp-ignored-file-name :strike-through nil))))
 '(font-lock-function-name-face ((t (:foreground "turquoise"))))
 '(font-lock-keyword-face ((t (:foreground "SteelBlue1"))))
 '(font-lock-type-face ((t (:foreground "SeaGreen1"))))
 '(markdown-header-face-1 ((t (:inherit org-level-1))))
 '(markdown-header-face-2 ((t (:inherit org-level-2))))
 '(markdown-header-face-3 ((t (:inherit org-level-3))))
 '(markdown-header-face-4 ((t (:inherit org-level-4))))
 '(org-checkbox ((t (:inherit bold :background "DarkGoldenrod4"))))
 '(org-date ((t (:inherit nil :foreground "#d5b3f6"))))
 '(org-level-1 ((t (:foreground "navajo white" :box (:line-width 6 :color "black")))))
 '(org-todo ((t (:inherit nil :foreground "#f25a5a"))))
 '(underline ((t (:underline "dark gray")))))

(use-package grandshell-theme)
(use-package leuven-theme
  :defer t)

(load-theme 'grandshell t)
;(load-theme 'green-phosphor t)
(load-theme 'mytheme t)

(defun my-presentation-font ()
  "Set the default font to be BIG (for presentations)."
  (interactive)
  (set-face-font 'default "-*-terminus-medium-r-*-*-28-*-*-*-*-*-*-*"))

(defun my-presentation-light-font ()
  "Set the default font to be BIG (for presentations) and switch to light theme."
  (interactive)
  (set-face-font 'default "-*-terminus-medium-r-*-*-28-*-*-*-*-*-*-*")
  (disable-theme 'mytheme)
  (disable-theme 'grandshell)
  (load-theme 'leuven t))

;; -----------------------------------------------------------------------------
;; --- General Customization
;; -----------------------------------------------------------------------------

(add-to-list 'load-path "~/.emacs.d/lisp")

;; Put all temporary files into /tmp.
(defconst emacs-tmp-dir (format "%s/%s%s/" temporary-file-directory "emacs" (user-uid)))
(setq backup-directory-alist `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix emacs-tmp-dir)
(setq image-dired-dir (format "%s/image-dired" emacs-tmp-dir))

;; Disable welcome startup screen.
(setq inhibit-startup-screen t)

;; Change fill column.
(setq fill-column 80)

;; Enable truncate lines mode.
(setq truncate-lines t)

;; Use spaces instead of tabs.
(setq indent-tabs-mode nil)

;; Disable blinking cursor.
(setq blink-cursor-mode nil)

;; Show column and line numbers in mode bar.
(setq column-number-mode t)

;; Enable file size indication mode.
(setq size-indication-mode t)

;; Disable annoying backup files.
(setq make-backup-files nil)

;; Disable auto-save which is annoying for remote files.
(setq auto-save-default nil
      auto-save-interval 3000
      auto-save-timeout 60)

;; Turn on paren matching.
(show-paren-mode t)
(setq show-paren-style 'mixed)

;; Disable toolbar, menubar, and scrollbars.
(tool-bar-mode -1)
;(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Make all "yes or no" prompts show "y or n" instead.
(fset 'yes-or-no-p 'y-or-n-p)

;; "filename [mode]" in title bar
(setq frame-title-format '("%f [mode: %m]"))

;; Change whitespace which makes searching much better in texts with newlines.
(setq search-whitespace-regexp "[ \t\r\n]+"
      replace-lax-whitespace t
      replace-regexp-lax-whitespace t)

;; Change default grep command.
(setq grep-command "grep -nH "
      grep-find-ignored-directories '(".svn" ".git" ".hg" ".bzr" "extlib" "b" "build"))

;; Increase undo limit.
(setq undo-limit 8000000
      undo-outer-limit 120000000
      undo-strong-limit 120000000)

;; cperl-mode is preferred to perl-mode
(defalias 'perl-mode 'cperl-mode)

;; Reduce latency with Tramp mode.
(setq tramp-auto-save-directory emacs-tmp-dir)
(setq tramp-persistency-file-name (format "%s/tramp" emacs-tmp-dir))
(setq tramp-use-ssh-controlmaster-options nil)
(setq remote-file-name-inhibit-cache nil)
;(setq tramp-verbose 6)

;; Disable built-in version control when using Tramp.
(setq vc-ignore-dir-regexp
      (format "\\(%s\\)\\|\\(%s\\)"
              vc-ignore-dir-regexp
              tramp-file-name-regexp))

;; -----------------------------------------------------------------------------
;; --- Smooth Scrolling
;; -----------------------------------------------------------------------------

;; Scroll line by line
(setq redisplay-dont-pause t)
;; number of lines at the top and bottom of a window.
(setq scroll-margin 2)
;; Controls if scroll commands move point to keep its screen position unchanged.
(setq scroll-preserve-screen-position nil)

 ;; four line at a time
(setq mouse-wheel-scroll-amount '(4 ((shift) . 4)))
 ;; accelerate scrolling
(setq mouse-wheel-progressive-speed 't)
 ;; scroll window under mouse
(setq mouse-wheel-follow-mouse 't)
;; keyboard scroll four line at a time
(setq scroll-step 4)
;; number of lines at the top and bottom of a window.
(setq smooth-scroll-margin 3)
(setq smooth-scroll-strict-margins 't)

;; -----------------------------------------------------------------------------
;; --- Some custom key bindings
;; -----------------------------------------------------------------------------

;; Open files from current text.
(global-set-key (kbd "C-x f") 'find-file-at-point)

;; Goto line.
(global-set-key "\M-g" 'goto-line)

;; window handling
(global-set-key "\M-`" 'delete-other-windows)
(global-set-key "\M-2" 'make-frame)
(global-set-key "\M-3" 'delete-frame)

;; loading the buffer list
(global-set-key [C-x C-b] 'buffer-menu)
(global-set-key [M-S-up] 'ibuffer)

;; fast nagivation in buffer stack
(global-set-key [M-S-left] 'previous-buffer)
(global-set-key [M-S-right] 'next-buffer)

;; quick comment and uncommenting
(global-set-key (kbd "C-c SPC") 'comment-or-uncomment-region)

;; kills all them buffers except scratch.
(defun nuke-all-buffers ()
  "kill all buffers, leaving *scratch* only"
  (interactive)
  (mapcar (lambda (x) (kill-buffer x)) (buffer-list))
  (delete-other-windows))

(global-set-key (kbd "C-x K") 'nuke-all-buffers)

;; F3 -> find other file: switch between .cpp/.hpp files
(global-set-key [f3] 'ff-find-other-file)

;; F4 -> launch a terminal (just about anywhere)
(defun my-terminal (&optional arg)
  "Launch terminal in current directory."
  (interactive)
  (if
      ;; if buffer is under tramp
      (file-remote-p default-directory)
      (shell)
    (start-process "terminal" nil "/usr/bin/urxvt")
    )
)
(global-set-key [f4] 'my-terminal)

;; set keys f9-f12 to insert German umlauts and sz
(global-set-key (kbd "<f9>") (lambda() (interactive) (insert ?\ä)))
(global-set-key (kbd "<S-f9>") (lambda() (interactive) (insert ?\Ä)))
(global-set-key (kbd "<f10>") (lambda() (interactive) (insert ?\ö)))
(global-set-key (kbd "<S-f10>") (lambda() (interactive) (insert ?\Ö)))
(global-set-key (kbd "<f11>") (lambda() (interactive) (insert ?\ü)))
(global-set-key (kbd "<S-f11>") (lambda() (interactive) (insert ?\Ü)))
(global-set-key (kbd "<f12>") (lambda() (interactive) (insert ?\ß)))

;; bind Backspace and Delete keys with M- and C- to special kill functions
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

;; -----------------------------------------------------------------------------
;; --- Window Movement Shortcuts
;; -----------------------------------------------------------------------------

(require 'windmove)
(windmove-default-keybindings)

(global-set-key [M-left] 'windmove-left)          ; move to left windnow
(global-set-key [M-right] 'windmove-right)        ; move to right window
(global-set-key [M-up] 'windmove-up)              ; move to upper window
(global-set-key [M-down] 'windmove-down)          ; move to downer window

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; -----------------------------------------------------------------------------
;; --- set up hunspell for flyspell-mode ---
;; -----------------------------------------------------------------------------

(setq ispell-program-name "/usr/bin/hunspell")

(setq ispell-local-dictionary "en_US")
(setq ispell-local-dictionary-alist
      '((nil     ; default
         "[A-Za-z]" "[^A-Za-z]" "[']" t ("-d" "en_US") nil utf-8)
        ("en_US" ; Yankee English
         "[A-Za-z]" "[^A-Za-z]" "[']" t ("-d" "en_US") nil utf-8)
        ("en_GB" ; British English
         "[A-Za-z]" "[^A-Za-z]" "[']" t ("-d" "en_GB") nil utf-8)
        ("de_DE"
         "[a-zäöüßA-ZÄÖÜ]" "[^a-zäöüßA-ZÄÖÜ]" "['-]" t ("-d" "de_DE") nil utf-8)
        )
      )

;; -----------------------------------------------------------------------------
;; --- Compile CMake Projects
;; -----------------------------------------------------------------------------

(require 'compile)
(setq compilation-disable-input nil
      compilation-last-buffer nil
      compilation-scroll-output t
      compilation-always-kill t
      mode-compile-always-save-buffer-p t)

(defun my-compile (pfx)
  "Saves all unsaved buffers, and runs 'compile' with optional ede project customization."
  (interactive "p")
  ;; save buffers
  (save-some-buffers t)
  ;; if a compilation buffer already exists: switch and recompile
  (if (buffer-live-p compilation-last-buffer)
      (recompile)
    ;; else figure out whether the current directory has an ede-project
    (let* ((fname (or (buffer-file-name (current-buffer)) default-directory))
           (current-dir (file-name-directory fname))
           (proj (ede-current-project current-dir)))
      (if proj
          (project-compile-project proj)
        (call-interactively 'compile)))
    ))

(global-set-key [f5] 'my-compile)

;; -----------------------------------------------------------------------------
;; --- Increment and Decrement Numbers at Point
;; -----------------------------------------------------------------------------
;; from http://www.emacswiki.org/emacs/IncrementNumber

(defun increment-number-decimal (&optional arg)
  "Increment the number forward from point by 'arg'."
  (interactive "p*")
  (save-excursion
    (save-match-data
      (let (inc-by field-width answer)
        (setq inc-by (if arg arg 1))
        (skip-chars-backward "0123456789")
        (when (re-search-forward "[0-9]+" nil t)
          (setq field-width (- (match-end 0) (match-beginning 0)))
          (setq answer (+ (string-to-number (match-string 0) 10) inc-by))
          (when (< answer 0)
            (setq answer (+ (expt 10 field-width) answer)))
          (replace-match (format (concat "%0" (int-to-string field-width) "d")
                                 answer)))))))

(defun decrement-number-decimal (&optional arg)
  (interactive "p*")
  (increment-number-decimal (if arg (- arg) -1)))

(defun increment-number-hexadecimal (&optional arg)
  "Increment the number forward from point by 'arg'."
  (interactive "p*")
  (save-excursion
    (save-match-data
      (let (inc-by field-width answer hex-format)
        (setq inc-by (if arg arg 1))
        (skip-chars-backward "0123456789abcdefABCDEF")
        (when (re-search-forward "[0-9a-fA-F]+" nil t)
          (setq field-width (- (match-end 0) (match-beginning 0)))
          (setq answer (+ (string-to-number (match-string 0) 16) inc-by))
          (when (< answer 0)
            (setq answer (+ (expt 16 field-width) answer)))
          (if (equal (match-string 0) (upcase (match-string 0)))
              (setq hex-format "X")
            (setq hex-format "x"))
          (replace-match (format (concat "%0" (int-to-string field-width)
                                         hex-format)
                                 answer)))))))

(defun decrement-number-hexadecimal (&optional arg)
  (interactive "p*")
  (increment-number-hexadecimal (if arg (- arg) -1)))

;; -----------------------------------------------------------------------------
;; --- CamelCase to snake_case and back
;; -----------------------------------------------------------------------------

(defun split-name (s)
  (split-string
   (let ((case-fold-search nil))
     (downcase
      (replace-regexp-in-string "\\([a-z]\\)\\([A-Z]\\)" "\\1 \\2" s)))
   "[^A-Za-z0-9]+"))

(defun camelcase  (s) (mapconcat 'capitalize (split-name s) ""))
(defun underscore (s) (mapconcat 'downcase   (split-name s) "_"))

(defun camelscore (s)
  (cond ((string-match-p "-" s)         (colonize s))
        ((string-match-p "_" s)         (dasherize s))
        (t                              (underscore s))))

(defun camelscore-word-at-point ()
  (interactive)
  (let* ((case-fold-search nil)
         (beg (and (skip-chars-backward "[:alnum:]_") (point)))
         (end (and (skip-chars-forward  "[:alnum:]_") (point)))
         (txt (buffer-substring beg end))
         (cml (camelscore txt)) )
    (if cml (progn (delete-region beg end) (insert cml))) ))

;; -----------------------------------------------------------------------------
;; --- General Emacs Behaviour Extensions
;; -----------------------------------------------------------------------------

;; A front-end for ag ("the silver searcher"), the C ack replacement.
(defun my-ag-grep ()
  "Launch ag or grep in current directory."
  (interactive)
  (if
      ;; if buffer is under tramp
      (file-remote-p default-directory)
      ;; call rgrep for remote buffers
      (call-interactively 'rgrep)
    ;; call ag for local buffers
    (call-interactively 'ag)
    )
  )
(use-package ag
  :init
  (setq ag-highlight-search t
	ag-reuse-buffers t
	ag-reuse-window t
	ag-ignore-list '("build" "b" "bo" "extlib" "doxygen-html"))
  :bind (("C-c C-s" . my-ag-grep)))

;; Visible bookmarks mode.
(use-package bm
  :bind (("<f2>" . bm-next)
	 ("<S-f2>" . bm-previous)
	 ("<M-f2>" . bm-toggle))
  )

;; Diminished modes are minor modes with no modeline display.
(use-package diminish)

;; Move point through buffer-undo-list positions.
(use-package goto-last-change
  :bind (("C-M-l" . goto-last-change)))

;; HippieExpand looks at the word before point and tries to expand it in various ways.
(use-package hippie-exp
  :bind (("M-/" . hippie-expand))
  :config
  (setq hippie-expand-try-functions-list
	'(try-expand-dabbrev
	  try-expand-dabbrev-all-buffers
	  try-expand-dabbrev-from-kill
	  try-complete-file-name-partially
	  try-complete-file-name
	  try-expand-all-abbrevs
	  try-expand-list
	  try-expand-line)))

;; Nicer file search.
(use-package ido
  :init
  (setq ido-everywhere t
	ido-enable-flex-matching t
	ido-virtual-buffers t
	ido-use-faces t
	ido-show-dot-for-dired t
	ido-default-file-method 'selected-window
	ido-default-buffer-method 'selected-window
	ido-auto-merge-delay-time 0.5
	ido-auto-merge-work-directories-length -1)
  :config
  (ido-mode)
  )

;; Edit multiple regions in the same way simultaneously.
(use-package iedit
  :bind (("C-\\" . iedit-mode)))

;; Highlight brackets according to their depth.
(use-package rainbow-delimiters)

;; M-x interface with Ido-style fuzzy matching.
(use-package smex
  :bind (("M-x" . smex))
  :init
  (setq smex-save-file "~/.emacs.d/smex-items")
  :config
  (smex-initialize)
  )

;; Make emacs scroll smoothly.
(use-package smooth-scrolling)

;; Unobtrusively remove trailing whitespace.
(use-package ws-butler
  :diminish
  :config
  (ws-butler-global-mode 1)
  )

;; Yet another snippet extension for Emacs.
(use-package yasnippet
  :init
  (setq yas-snippet-dirs '("~/.emacs.d/snippets/"))
  :config
  (yas-reload-all)
  (yas-global-mode 1)
  )

;; -----------------------------------------------------------------------------
;; --- System Navigation Modes
;; -----------------------------------------------------------------------------

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

(use-package dired
  :ensure nil
  :init
  (setq dired-dwim-target t)
  :bind (:map dired-mode-map
	      ;; backspace
	      ([backspace] . dired-up-directory)
	      ;; for some reason mouse-2 = left click (mouse-1)
	      ([mouse-2] . 'my-dired-mouse-find-file)
	      ([M-mouse-2] . 'diredp-mouse-find-file-other-frame)
	      ))

;; Extensions to Dired.
(use-package dired+
  :quelpa (dired+ :fetcher github :repo "emacsmirror/dired-plus")
  :init
  (setq diredp-hide-details-initially-flag nil
	diredp-image-preview-in-tooltip nil)
  :config
  (diredp-toggle-find-file-reuse-dir 1)
  :bind (:map dired-mode-map
	      ;; for some reason mouse-2 = left click (mouse-1)
	      ([mouse-2] . 'my-dired-mouse-find-file)
	      ([M-mouse-2] . 'diredp-mouse-find-file-other-frame)
	      ))

;; Cut/copy/paste files and directories in dired mode.
(use-package dired-copy-paste
  :quelpa (dired-copy-paste :fetcher github :repo "jsilve24/dired-copy-paste")
  :bind (:map dired-mode-map
	      ("C-w" . dired-copy-paste-do-cut)
	      ("M-w" . dired-copy-paste-do-copy)
	      ("C-y" . dired-copy-paste-do-paste))
  )

;; -----------------------------------------------------------------------------
;; --- Text Modes
;; -----------------------------------------------------------------------------

;; Major mode for editing Apache httpd configuration files.
(use-package apache-mode :defer t)

(use-package latex
  :defer t
  :ensure auctex
  :config
  ;; Makes \C-c\C-c not ask, just do the default action.
  (setq TeX-command-force "LaTeX")
  ;; Determine compile and other execution commands.
  (setq TeX-command-list
	'(("LaTeX" "%`~/.emacs.d/flymake-pdflatex -shell-escape --synctex=1 %(mode)%' %t" TeX-run-TeX nil
	   (latex-mode doctex-mode)
	   :help "Run LaTeX")
	  ("Makeinfo" "makeinfo %(extraopts) %t" TeX-run-compile nil
	   (texinfo-mode)
	   :help "Run Makeinfo with Info output")
	  ("BibTeX" "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX")
	  ("Biber" "biber %s" TeX-run-Biber nil t :help "Run Biber")
	  ("View" "%V" TeX-run-discard-or-function t t :help "Run Viewer")
	  ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files")
	  ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files")
	  ("Other" "" TeX-run-command t t :help "Run an arbitrary command")))

  :bind (:map LaTeX-mode-map
	      ;; Compile -> 'a' for ask, change to anything you want.
	      ("C-c C-a" . (lambda (arg) (interactive "P")
			     (let ((TeX-command-force nil)) (TeX-command-master arg))))
	      ;; Shortcuts for reftex
	      ("C-M-r" . reftex-reference)
	      ("C-M-c" . reftex-citation)
	      ("M-S-<down>" . reftex-toc)
	      )
  )

(defun tb-latex-common-hook ()
  "Add some latex macro keys"
  (interactive)
  (turn-on-reftex)
  (visual-line-mode 1)
  ;; show frames in section list -> very useful for beamer presentations
  (setq reftex-section-levels
        (cons '("begin{frame}" . 3) reftex-section-levels))

  ;; auto folding of tikzpicture and algorithm environments in tex files
  (TeX-fold-mode 0)
  (add-hook 'find-file-hook 'TeX-fold-buffer t)
)

(add-hook 'TeX-mode-hook 'tb-latex-common-hook)
(add-hook 'LaTeX-mode-hook 'tb-latex-common-hook)

;; Major mode for editing comma/char separated values.
(use-package csv-mode
  :defer t)

;; Major mode for editing Docker's Dockerfiles.
(use-package dockerfile-mode
   :defer t)

;; Major mode for Markdown-formatted text.
(use-package markdown-mode
  :mode ("\\.md\\'" . markdown-mode)
  :hook (markdown-mode . (lambda ()
			   (visual-line-mode 1)
			   (flyspell-mode)
			   (set-variable 'fill-column 100000)
			   ))
  )

;; major mode for editing nginx config files.
(use-package nginx-mode
   :defer t)

;; Outline-based notes management and organizer.
(use-package org)

(add-hook 'org-mode-hook
          (lambda ()
            (local-unset-key [(meta shift up)])
            (local-unset-key [(meta shift down)])
            (local-set-key [(control shift up)] 'org-move-subtree-up)
            (local-set-key [(control shift down)] 'org-move-subtree-down)
            (local-set-key [(control shift left)] 'org-promote-subtree)
            (local-set-key [(control shift right)] 'org-demote-subtree)
            (local-set-key [(control return)] 'org-insert-subheading)
            (local-set-key [(meta control return)] 'org-time-stamp)
            (local-set-key [f5] 'org-html-export-to-html)
            (local-set-key [f6] 'org-latex-export-to-pdf)
            ))

;; Minor mode for interacting with Pandoc
(use-package pandoc-mode :defer t)

;; Major mode for editing YAML files.
(use-package yaml-mode)

;; -----------------------------------------------------------------------------
;; --- Programming Modes
;; -----------------------------------------------------------------------------

(use-package arduino-mode :defer t)
(use-package basic-mode :defer t)
(use-package bison-mode :defer t)
(use-package cmake-mode :defer t)
(use-package coffee-mode :defer t)
(use-package csharp-mode :defer t)
(use-package groovy-mode
  :defer t
  :bind (:map groovy-mode-map
	      ("C-c C-s" . my-ag-grep)))
(use-package haskell-mode :defer t)
(use-package lua-mode :defer t)
(use-package php-mode :defer t)
(use-package protobuf-mode :defer t)
(use-package python-mode :defer t)
(use-package qml-mode :defer t)
(use-package scala-mode :defer t)

;; Hook for all c-like programming modes.
(defun tb-c-common-hook ()

  ;; flyspell mode for comments
  (flyspell-prog-mode)

  ;; org-table mode support for comments
  ;(orgtbl-mode)

  ;; Enable language server ui.
  (lsp)

  ;; Enable Projectile.
  (projectile-mode)

  )

(add-hook 'c-mode-common-hook 'tb-c-common-hook)

(use-package cc-mode
  :bind (:map c++-mode-map
	      ("C-c C-s" . my-ag-grep)
	      ("<f3>" . projectile-find-other-file))
  )

;; special web site scripts
(add-to-list 'auto-mode-alist '("\\.htt\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.blog\\'" . html-mode))

;; -----------------------------------------------------------------------------
;; --- Utility Packages
;; -----------------------------------------------------------------------------

;; Magit Git frontend.
(use-package magit
  :init
  (setq magit-diff-arguments '("--ignore-all-space")
	magit-log-arguments '("--graph" "--color" "--decorate" "-n100")
	magit-no-confirm '(stage-all-changes unstage-all-changes amend-published)
	magit-pull-arguments nil
	magit-refs-show-commit-count 'all
	magit-status-buffer-switch-function 'switch-to-buffer
   )
  :bind (("<C-f12>" . magit-status)
	 ("<S-f12>" . magit-blame-addition)
	 ("<M-f12>" . magit-log-buffer-file)))

;; Git-Commit-Mode: flyspell
(add-hook 'git-commit-mode-hook 'turn-on-flyspell)

(use-package lsp-mode
  :init
  (setq lsp-enable-symbol-highlighting t
	lsp-headerline-breadcrumb-enable nil
	lsp-diagnostics-provider :none
   )
  )

(use-package lsp-ui
  )

(use-package lsp-java
  )

(use-package projectile
  )

;; modify ibuffer keymap: mouse click opens a file
(defun my-ibuffer-keys ()
  "Modify keymaps used by `ibuffer'."
  (local-set-key (kbd "<down-mouse-1>") 'ibuffer-visit-buffer)
  )

(add-hook 'ibuffer-hook 'my-ibuffer-keys)

;(package-autoremove)

;; -----------------------------------------------------------------------------
;; --- reftex customizations
;; -----------------------------------------------------------------------------

;; disable query for \ref or \pageref style
(setq reftex-ref-macro-prompt nil)

;; additional label styles
(setq reftex-label-alist
      '(
        ("theorem"   ?t "thm:" "~\\ref{%s}" t   ("theorem"   "th.") -2)
        ("lemma"     ?t "lem:" "~\\ref{%s}" t   ("lemma"     "lem") -2)
        ("algorithm" ?a "alg:" "~\\ref{%s}" t   ("algorithm" "alg") -2)
        ))

;; -----------------------------------------------------------------------------
;; --- Make eshell Usable
;; -----------------------------------------------------------------------------

(define-key comint-mode-map (kbd "<up>") 'comint-previous-input)
(define-key comint-mode-map (kbd "<down>") 'comint-next-input)

;; -----------------------------------------------------------------------------
;; --- The end.
;; -----------------------------------------------------------------------------
