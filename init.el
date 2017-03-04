(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-fold-env-spec-list
   (quote
    (("[tikzpicture]"
      ("tikzpicture"))
     ("[algorithm]"
      ("algorithm"))
     ("[algorithm2e]"
      ("algorithm2e")))))
 '(LaTeX-fold-macro-spec-list nil)
 '(LaTeX-fold-math-spec-list nil)
 '(TeX-command-list
   (quote
    (("LaTeX" "%`~/.emacs.d/flymake-pdflatex -shell-escape --synctex=1 %(mode)%' %t" TeX-run-TeX nil
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
     ("Other" "" TeX-run-command t t :help "Run an arbitrary command"))))
 '(TeX-fold-env-spec-list nil)
 '(TeX-fold-macro-spec-list nil)
 '(TeX-fold-math-spec-list nil)
 '(TeX-save-query nil)
 '(TeX-source-correlate-mode t)
 '(ag-highlight-search t)
 '(ag-ignore-list (quote ("build" "b" "bo" "extlib")))
 '(ag-reuse-buffers t)
 '(ag-reuse-window t)
 '(auth-sources
   (quote
    ("~/.gnus.d/authinfo" "~/.gnus.d/authinfo.gpg" "~/.netrc")))
 '(auto-save-interval 3000)
 '(auto-save-timeout 60)
 '(blink-cursor-mode nil)
 '(c-basic-offset 4)
 '(c-default-style
   (quote
    ((java-mode . "java")
     (awk-mode . "awk")
     (other . "k&r"))))
 '(c-offsets-alist (quote ((inline-open . 0) (innamespace . 0))))
 '(c-tab-always-indent nil)
 '(column-number-mode t)
 '(compilation-always-kill t)
 '(cperl-continued-brace-offset -4)
 '(cperl-continued-statement-offset 4)
 '(cperl-extra-newline-before-brace t)
 '(cperl-extra-newline-before-brace-multiline nil)
 '(cperl-indent-level 4)
 '(cperl-indent-parens-as-block t)
 '(cperl-label-offset -4)
 '(cperl-merge-trailing-else nil)
 '(custom-safe-themes
   (quote
    ("4ba6aa8a2776688ef7fbf3eb2b5addfd86d6e8516a701e69720b705d0fbe7f08" default)))
 '(dired-dwim-target t)
 '(diredp-hide-details-initially-flag nil)
 '(diredp-image-preview-in-tooltip nil)
 '(doc-view-continuous t)
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
 '(ede-project-placeholder-cache-file "~/.emacs.d/projects.ede")
 '(ede-simple-save-directory "~/.emacs.d/ede-simple")
 '(ediff-autostore-merges t)
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(fill-column 80)
 '(flyspell-issue-welcome-flag nil)
 '(font-latex-fontify-sectioning 1.0)
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(gdb-many-windows t)
 '(ggtags-highlight-tag 10000.0)
 '(ggtags-highlight-tag-delay 10000.0)
 '(git-commit-fill-column 1000)
 '(git-commit-summary-max-length 1000)
 '(gnus-init-file "~/.emacs.d/gnus-init.el")
 '(grep-command "grep -nH ")
 '(grep-find-ignored-directories (quote (".svn" ".git" ".hg" ".bzr" "extlib" "b" "build")))
 '(ido-auto-merge-delay-time 0.4)
 '(ido-save-directory-list-file "~/.emacs.d/ido.last")
 '(ido-show-dot-for-dired t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(ispell-highlight-face (quote flyspell-incorrect))
 '(jde-jdk (quote ("1.7.0.51")))
 '(jde-jdk-registry (quote (("1.7.0.51" . "/opt/oracle-jdk-bin-1.7.0.51/"))))
 '(lua-indent-level 4)
 '(magit-diff-arguments (quote ("--ignore-all-space")))
 '(magit-git-global-arguments
   (quote
    ("--no-pager" "--literal-pathspecs" "-c" "core.preloadindex=true" "-c" "user.name=Timo Bingmann" "-c" "user.email=tbgit@panthema.net")))
 '(magit-log-arguments (quote ("--graph" "--color" "--decorate" "-n100")))
 '(magit-no-confirm (quote (stage-all-changes unstage-all-changes)))
 '(magit-pull-arguments nil)
 '(magit-refs-show-commit-count (quote all))
 '(magit-status-buffer-switch-function (quote switch-to-buffer))
 '(make-backup-files nil)
 '(nntp-authinfo-file "~/.emacs.d/authinfo")
 '(org-agenda-files (quote ("~/synca/01-OrgTassen/TODO.org")))
 '(org-clock-mode-line-total (quote today))
 '(org-clock-persist t)
 '(org-confirm-shell-link-function nil)
 '(org-export-allow-bind-keywords t)
 '(org-export-backends (quote (ascii html latex md)))
 '(org-link-frame-setup
   (quote
    ((vm . vm-visit-folder-other-frame)
     (vm-imap . vm-visit-imap-folder-other-frame)
     (gnus . org-gnus-no-new-news)
     (file . find-file)
     (wl . wl-other-frame))))
 '(org-tab-follows-link t)
 '(org-time-clocksum-format
   (quote
    (:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t)))
 '(processing-location "~/.bin-local/processing-java")
 '(processing-sketchbook-dir "~/Dropbox/sketchbook")
 '(reftex-default-bibliography (quote ("~/btsync/0-Work/library.bib")))
 '(reftex-label-alist
   (quote
    (("theorem" 116 "thm:" nil t
      ("theorem" "th.")
      -2)
     ("lemma" 116 "lem:" nil t
      ("lemma" "lem")
      -2)
     ("definition" 100 "def:" nil t
      ("definition" "def")
      -2))) t)
 '(safe-local-variable-values
   (quote
    ((c-tab-always-indent . t)
     (nxml-child-indent . 4)
     (rebox-min-fill-column . 100)
     (rebox-min-fill-column . 110)
     (rebox-min-fill-column . 120))))
 '(scroll-bar-mode (quote right))
 '(size-indication-mode t)
 '(smex-save-file "~/.emacs.d/smex-items")
 '(srecode-map-save-file "~/.emacs.d/srecode/srecode-map")
 '(tramp-default-method "ssh")
 '(tramp-remote-path
   (quote
    ("~/.bin" "~/bin" "/bin" "/usr/bin" "/sbin" "/usr/sbin" "/usr/local/bin" "/usr/local/sbin")))
 '(tramp-remote-process-environment
   (quote
    ("HISTFILE=/dev/null" "HISTSIZE=1" "LC_ALL=C" "TERM=dumb" "EMACS=t" "CDPATH=" "HISTORY=" "MAIL=" "MAILCHECK=" "MAILPATH=" "PAGER=\"\"" "autocorrect=" "correct=")))
 '(undo-limit 8000000)
 '(undo-outer-limit 120000000)
 '(undo-strong-limit 120000000)
 '(vc-handled-backends (quote (svn))))

;; ---------------------------
;; --- change default font ---
;; ---------------------------

;(set-face-font 'default "-misc-fixed-medium-r-normal--15-*-*-*-c-90-iso8859-1")

;(set-frame-font "-*-terminus-medium-r-*-*-16-*-*-*-*-*-*-*")
(set-face-font 'default "-*-terminus-medium-r-*-*-18-*-*-*-*-*-*-*")
;(set-face-font 'default "-*-Helvetica-medium-r-normal-*-14-*-*-*-m-*-fontset-Helvetica")

;(set-frame-font "-zevv-peep-medium-r-normal--16-*-*-*-c-*-*")

(create-fontset-from-fontset-spec "-misc-fixed-medium-r-normal--15-*-*-*-c-90-fontset-Fixed")
(create-fontset-from-fontset-spec "-*-Droid Sans Mono-medium-r-normal-*-14-*-*-*-m-*-fontset-Droid")
(create-fontset-from-fontset-spec "-*-Terminus-medium-r-normal-*-16-*-*-*-m-*-fontset-Terminus")
(create-fontset-from-fontset-spec "-zevv-peep-medium-r-normal--16-*-*-*-c-*-fontset-Zevv")

(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)

(global-set-key (kbd "<mouse-6>") (lambda (event) (interactive "e")))
(global-set-key (kbd "<mouse-7>") (lambda (event) (interactive "e")))

;; ------------------------------
;; --- overlay cedet packages ---
;; ------------------------------

;(setq cedet-root-path (file-name-as-directory "~/.emacs.d/cedet-bzr/"))

;(load-file (concat cedet-root-path "cedet-devel-load.el"))
;(add-to-list 'load-path (concat cedet-root-path "contrib"))

;; ---------------------------------
;; --- el-get package management ---
;; ---------------------------------

;; overlay newer gnus packages over emacs defaults
(push "~/.emacs.d/el-get/gnus/lisp/" load-path)

;; load el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; configure el-get
(setq el-get-install-branch "master"
      el-get-install-skip-emacswiki-recipes t
      el-get-git-shallow-clone t
      )

(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max)) (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-recipes")

;; BEGIN PACKAGE LIST to el-get
(setq my-el-get-packages '(el-get))

;; general emacs behaviour extensions
(push 'bm my-el-get-packages)
(push 'column-marker my-el-get-packages)
(push 'folding my-el-get-packages)
(push 'goto-last-change my-el-get-packages)
(push 'rainbow-delimiters my-el-get-packages)
(push 'rebox2 my-el-get-packages)
(push 'smex my-el-get-packages)
(push 'smooth-scrolling my-el-get-packages)
(push 'yasnippet my-el-get-packages )
(push 'multiple-cursors my-el-get-packages)
(push 'flymake my-el-get-packages)
(push 'ag my-el-get-packages)
(push 'ws-butler my-el-get-packages)
(push 'grandshell my-el-get-packages)
(push 'leuven-theme my-el-get-packages)
(push 'ggtags my-el-get-packages)
;(push 'helm-gtags my-el-get-packages)
(push 'google-this my-el-get-packages)
(push 'diminish my-el-get-packages)
(push 'tramp my-el-get-packages)

(push 'auto-complete my-el-get-packages)
(push 'auto-complete-auctex my-el-get-packages)
;(push 'auto-complete-css my-el-get-packages)
;(push 'auto-complete-yasnippet my-el-get-packages)
(push 'auto-complete-c-headers my-el-get-packages)

;; system naviation modes
(push 'dired+ my-el-get-packages)
(push 'openwith my-el-get-packages)

;; text modes
(push 'auctex my-el-get-packages)
(push 'markdown-mode my-el-get-packages)
(push 'org-mode my-el-get-packages)
(push 'yaml-mode my-el-get-packages)

;; programming modes
(push 'apache-mode my-el-get-packages)
(push 'cmake-mode my-el-get-packages)
(push 'cperl-mode my-el-get-packages)
;(push 'csharp-mode my-el-get-packages)
(push 'css-mode my-el-get-packages)
(push 'cedet my-el-get-packages)
(push 'ecb my-el-get-packages)
(push 'lua-mode my-el-get-packages)
(push 'php-mode my-el-get-packages)
(push 'protobuf-mode my-el-get-packages)
(push 'python-mode my-el-get-packages)
(push 'cython-mode my-el-get-packages)
(push 'tt-mode my-el-get-packages)
(push 'thrift-mode my-el-get-packages)
(push 'processing-mode my-el-get-packages)
(push 'scala-mode2 my-el-get-packages)
(push 'mmm-mode my-el-get-packages)
(push 'ess my-el-get-packages) ; for R

;; version control
(push 'dsvn my-el-get-packages)
(push 'magit my-el-get-packages)
(push 'magit-svn my-el-get-packages)

;; email and news reader
;(push 'gnus my-el-get-packages)
;(push 'bbdb my-el-get-packages)
;(push 'tc my-el-get-packages ) ;; trivial cite
;(push 'gnus-notify my-el-get-packages)

;; END PACKAGE LIST for el-get

;; install missing packages from list above
(el-get 'sync my-el-get-packages)
;; remove everything not in the list above
(el-get-cleanup my-el-get-packages)

;; --------------------------
;; --- Start emacs server ---
;; --------------------------

(server-start)

;; ---------------------------------------------------
;; --- Load theme and override faces via customize ---
;; ---------------------------------------------------

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'grandshell t)
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

;; -----------------------------------
;; --- Load some custom extensions ---
;; -----------------------------------

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; --- autoload lilypond major mode ---

(add-to-list 'load-path "~/.emacs.d/lilypond-2.12.1/")
(autoload 'LilyPond-mode "lilypond-mode" "LilyPond Editing Mode" t)

(add-to-list 'auto-mode-alist '("\\.ly$" . LilyPond-mode))
(add-to-list 'auto-mode-alist '("\\.ily$" . LilyPond-mode))
(add-to-list 'auto-mode-alist '("\\.lytex$" . latex-mode))
(add-hook 'LilyPond-mode-hook (lambda () (turn-on-font-lock)))

;; --- set up hunspell for flyspell-mode ---

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

(add-hook 'org-mode-hook
          (lambda ()
            (local-unset-key [(meta shift up)])
            (local-unset-key [(meta shift down)])
            (local-set-key [(control shift up)] 'org-move-subtree-up)
            (local-set-key [(control shift down)] 'org-move-subtree-down)
            (local-set-key [(control shift left)] 'org-promote-subtree)
            (local-set-key [(control shift right)] 'org-demote-subtree)
            (local-set-key [(control return)] 'org-insert-subheading)
            ))

(setq org-default-notes-file "~/synca/01-OrgTassen/TODO.org")

(global-set-key (kbd "<f1>") 'org-todo-list)
(global-set-key (kbd "\C-cc") 'org-capture)

;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((sql . t) (shell . t)))

;; save the clock history across Emacs sessions
(org-clock-persistence-insinuate)

;; -- load Dired+ when dired is loaded

(require 'dired-copy-paste)

(define-key dired-mode-map "\C-w" 'dired-copy-paste-do-cut)
(define-key dired-mode-map "\M-w" 'dired-copy-paste-do-copy)
(define-key dired-mode-map "\C-y" 'dired-copy-paste-do-paste)

(require 'dired-fixups)

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

;; whitespace cleaning butler mode
(ws-butler-global-mode 1)

;; cap'n'proto

(autoload 'capnp-mode "capnp-mode" "Capnp Mode" t)

(add-to-list 'auto-mode-alist '("\\.capnp$" . capnp-mode))

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

(folding-add-to-marks-list 'lua-mode "-- {{{" "-- }}}" nil t)

;; -----------------------------
;; --- General Customization ---
;; -----------------------------

;; put all temporary files into /tmp
(defconst emacs-tmp-dir (format "%s/%s%s/" temporary-file-directory "emacs" (user-uid)))
(setq backup-directory-alist `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix emacs-tmp-dir)
(setq tramp-auto-save-directory emacs-tmp-dir)
(setq tramp-persistency-file-name (format "%s/tramp" emacs-tmp-dir))
(setq image-dired-dir (format "%s/image-dired" emacs-tmp-dir))

;; turn on paren matching
(show-paren-mode t)
(setq show-paren-style 'mixed)

;; disable toolbar
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

;; make all "yes or no" prompts show "y or n" instead
(fset 'yes-or-no-p 'y-or-n-p)

;; hook for cperl-mode to automatically set my favorite style
;;(add-hook 'cperl-mode-hook (lambda () (cperl-set-style "C++")))

;; "filename [mode]" in title bar
(setq frame-title-format '("%f [mode: %m]"))

;; in every buffer, the line which contains the cursor will be fully highlighted
;(global-hl-line-mode 1)
;; enable inline images:
;(iimage-mode)

;; --------------------------------
;; --- Some custom key bindings ---
;; --------------------------------

(global-set-key "\M-g" 'goto-line)

; quick comment and uncommenting
(global-set-key (kbd "C-c SPC") 'comment-or-uncomment-region)

; kills all them buffers except scratch.
(defun nuke-all-buffers ()
  "kill all buffers, leaving *scratch* only"
  (interactive)
  (mapcar (lambda (x) (kill-buffer x)) (buffer-list))
  (delete-other-windows))

(global-set-key (kbd "C-x K") 'nuke-all-buffers)

; set keys f9-f12 to insert German umlauts and sz
(global-set-key (kbd "<f9>") (lambda() (interactive) (insert ?\ä)))
(global-set-key (kbd "<S-f9>") (lambda() (interactive) (insert ?\Ä)))
(global-set-key (kbd "<f10>") (lambda() (interactive) (insert ?\ö)))
(global-set-key (kbd "<S-f10>") (lambda() (interactive) (insert ?\Ö)))
(global-set-key (kbd "<f11>") (lambda() (interactive) (insert ?\ü)))
(global-set-key (kbd "<S-f11>") (lambda() (interactive) (insert ?\Ü)))
(global-set-key (kbd "<f12>") (lambda() (interactive) (insert ?\ß)))

; magit status

(global-set-key (kbd "<C-f12>") 'magit-status)

; auto-load magit-svn-mode if git-svn repo is detected.
(add-hook 'magit-mode-hook
          (lambda()
            ;(require 'magit-svn)
            ;(if (magit-svn-get-ref-info) (magit-svn-mode))
            ))

;; Git-Commit-Mode: flyspell
(add-hook 'git-commit-mode-hook 'turn-on-flyspell)

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

;; hippie-expand is dabbrev expand on steroids

(global-set-key "\M-/" 'hippie-expand)

(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line))

;; special bindings for latex quickies

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
  (local-set-key "\C-b" (lambda () (interactive) (insert "\\mathbb{")))
  (local-set-key "\C-f" (lambda () (interactive) (insert "\\mathfrak{")))
  (local-set-key "\C-\M-o" (lambda () (interactive) (insert "\\operatorname{")))
  (local-set-key [M-S-down] (lambda () (interactive) (reftex-toc)))
  (local-set-key "\C-\M-r" (lambda () (interactive) (reftex-reference)))
  (local-set-key "\C-\M-c" (lambda () (interactive) (reftex-citation)))
  ;; show frames in section list -> very useful for beamer presentations
  (setq reftex-section-levels
        (cons '("begin{frame}" . 3) reftex-section-levels))
  ;; The following makes \C-c\C-c not ask, just do the default action. Adds C-c-a for asking
  (setq TeX-command-force "LaTeX")
  ;; 'a' for ask, change to anything you want
  (local-set-key "\C-c\C-a" (lambda (arg) (interactive "P")
                            (let ((TeX-command-force nil)) (TeX-command-master arg))))
  ;; auto folding of tikzpicture and algorithm environments in tex files
  (TeX-fold-mode 0)
  (add-hook 'find-file-hook 'TeX-fold-buffer t)
)

(add-hook 'tex-mode-hook 'my-latex-key-bindings)
(add-hook 'latex-mode-hook 'my-latex-key-bindings)
(add-hook 'TeX-mode-hook 'my-latex-key-bindings)
(add-hook 'LaTeX-mode-hook 'my-latex-key-bindings)

(add-to-list 'auto-mode-alist '("\\.tikz$" . latex-mode))

;; enable google-this mode

;; google this word
;; default keymap: C-c / [key], where key is
;; RET -> interactive query
;; w -> google word under cursor
;; s -> google symbol under cursor

(google-this-mode 1)
;; hide "Google" minor mode
(diminish 'google-this-mode)

;; -----------------------------
;; --- reftex customizations ---
;; -----------------------------

;; disable query for \ref or \pageref style
(setq reftex-ref-macro-prompt nil)

;; additional label styles
(setq reftex-label-alist
      '(
        ("theorem" ?t "thm:" "~\\ref{%s}" t   ("theorem" "th.") -2)
        ("lemma"   ?t "lem:" "~\\ref{%s}" t   ("lemma"   "lem") -2)
        ))

;; --------------------
;; --- flymake mode ---
;; --------------------

(eval-after-load "flymake"
  '(progn
     ;; compile tex using pdflatex
     (defun flymake-get-tex-args (file-name)
       (list "~/.emacs.d/flymake-pdflatex" (list "-file-line-error" "-interaction=nonstopmode" "-shell-escape" file-name)))

     ;; severe logging
     ;(setq flymake-log-level 9)

     ;; changes timeout
     (setq flymake-no-changes-timeout 5)

     ;; dont run on enters
     (setq flymake-start-syntax-check-on-newline nil)

     ;; scan complete files for matching include lines
     (setq flymake-check-file-limit nil)

     ;; fixes unbalanced braces in LaTeX files
     (push '("^\\(.*?\.tex\\):\\([0-9]*?\\):\\(.*?\\):\\(.*?\\)" nil 2 3 4) flymake-err-line-patterns)
     (push '("^\\(.*?\.tikz\\):\\([0-9]*?\\):\\(.*?\\):\\(.*?\\)" nil 2 3 4) flymake-err-line-patterns)
     (push '("Runaway argument?" nil nil nil) flymake-err-line-patterns)
     (push '("Emergency stop." nil nil nil) flymake-err-line-patterns)
     (push '("Package tikz Error:" nil nil nil) flymake-err-line-patterns)

     ;; disable master search for numeric endings
     (setq flymake-allowed-file-name-masks
           (delete '("[0-9]+\\.tex\\'" flymake-master-tex-init flymake-master-cleanup)
                   flymake-allowed-file-name-masks)) ; don't use multipart tex files

     ;; enable master search for -fig.tex endings
     (add-to-list 'flymake-allowed-file-name-masks
                  '("fig\\.tex\\'" flymake-master-tex-init flymake-master-cleanup))

     (add-to-list 'flymake-allowed-file-name-masks
                  '("\\.tikz\\'" flymake-master-tex-init flymake-master-cleanup))
     ))

;; -----------------------------
;; --- bm line bookmark mode ---
;; -----------------------------

(global-set-key (kbd "<M-f2>") 'bm-toggle)
(global-set-key (kbd "<f2>")   'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)

;; ------------------------
;; --- Smooth Scrolling ---
;; ------------------------

;; Scroll line by line
(setq redisplay-dont-pause t)
;; number of lines at the top and bottom of a window.
(setq scroll-margin 2)
;; Controls if scroll commands move point to keep its screen position unchanged.
(setq scroll-preserve-screen-position nil)

(require 'smooth-scrolling)
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

;; ---------------------------------
;; --- Window Movement Shortcuts ---
;; ---------------------------------

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

;; -------------------
;; --- rebox2 mode ---
;; -------------------

(require 'rebox2)

;; customisation of rebox
(rebox-register-template
 71 999 '("??! box123456"))

(rebox-register-template
 272 999
 '("/*!"
   " * box123456"
   " */"))

;; set styles
(setq rebox-style-loop '(71 272))

;; ---------------------------
;; --- CEDET Configuration ---
;; ---------------------------

;; select which submodes we want to activate

; activates CEDET's context menu that is bound to right mouse button;
;(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
; activates use of separate styles for tags decoration
;(add-to-list 'semantic-default-submodes 'global-semantic-decoration-mode)
; activates highlighting of first line for current tag (function, class, etc.);
;(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
; activates displaying of possible name completions in the idle time
;(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode)
; activates highlighting of local names that are the same as name of tag under cursor
(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)
; activates automatic parsing of source code in the idle time
;(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
; enables automatic bookmarking of tags that you edited
;(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
;(add-to-list 'semantic-default-submodes 'global-semantic-show-parser-state-mode)
; shows which elements weren't processed by current parser's rules;
;(add-to-list 'semantic-default-submodes 'global-semantic-show-unmatched-syntax-mode)
; activates mode when name of current tag will be shown in top line of buffer;
;(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
; enables global support for Semanticdb
;(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
;(add-to-list 'semantic-default-submodes 'global-semantic-idle-breadcrumbs-mode)
; activates displaying of information about current tag in the idle time.
;(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)
; shows changes in the text that weren't processed by incremental parser yet.
;(add-to-list 'semantic-default-submodes 'global-semantic-highlight-edits-mode)

(setq qt4-base-dir "/usr/include/qt4")

(defvar semantic-lex-c-preprocessor-symbol-file '())
(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt4-base-dir "/Qt/qconfig.h"))
(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt4-base-dir "/Qt/qconfig-large.h"))
(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt4-base-dir "/Qt/qglobal.h"))

;; Activate semantic
(setq semanticdb-default-save-directory "~/.cache/emacs/semanticdb/")
(semantic-mode 1)

; load semantic databases
(require 'semantic/ia)
(require 'semantic/bovine/gcc) ; or depending on you compiler

;; if you want to enable support for gnu global
;(semanticdb-enable-gnu-global-databases 'c-mode)
;(semanticdb-enable-gnu-global-databases 'c++-mode)

; load eassist
(add-to-list 'load-path "~/.emacs.d/el-get/cedet/contrib")
;(require 'eassist)

;; enable ctags for some languages:
;;  Unix Shell, Perl, Pascal, Tcl, Fortran, Asm
;(when (cedet-ectag-version-check)
;  (semantic-load-enable-primary-exuberent-ctags-support))

;; (setq-mode-local c-mode semanticdb-find-default-throttle
;;                  '(project unloaded system recursive))

;; customisation of modes
(defun my-cedet-hook ()
  ;; SRecode
  ;(global-srecode-minor-mode 1)

  ;; add knowledge of qt to emacs
  (semantic-add-system-include qt4-base-dir 'c++-mode)
  (semantic-add-system-include (concat qt4-base-dir "/Qt") 'c++-mode)
  (semantic-add-system-include (concat qt4-base-dir "/QtGui") 'c++-mode)
  (semantic-add-system-include (concat qt4-base-dir "/QtCore") 'c++-mode)
  (semantic-add-system-include (concat qt4-base-dir "/QtTest") 'c++-mode)
  (semantic-add-system-include (concat qt4-base-dir "/QtNetwork") 'c++-mode)
  (semantic-add-system-include (concat qt4-base-dir "/QtSvg") 'c++-mode)

  ;; whatever the symbol you are typing, this hot key automatically complete it for you.
  (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
  ;; another way to complete the symbol you are typing
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol)

  ;; when you typed . or -> after an object name, use this key to show possible public member functions or data members.
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  ;; visit the header file under cursor
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)

  ;; switch between files
  (local-set-key [f3] 'ff-find-other-file)

  ;;
  ;; load eassist contrib library
  ;(local-set-key "\C-ct" 'eassist-switch-h-cpp)
  ;(local-set-key "\C-xt" 'eassist-switch-h-cpp)
  ;(local-set-key "\C-ce" 'eassist-list-methods)
  ;;
  (local-set-key "\C-cr" 'semantic-symref)
  ;; rename local variable under cursor
  (local-set-key "\C-c\C-r" 'semantic-symref-rename-local-variable)

  ;; jump to the definition of the symbol under cursor
  ;(local-set-key "\C-c<" 'semantic-ia-fast-jump)
  ;;  show the document of the symbol under cursor
  ;(local-set-key "\C-cq" 'semantic-ia-show-doc)
  ;; show a summary about the symbol under cursor
  ;(local-set-key "\C-cs" 'semantic-ia-show-summary)
  ;; toggle between the implementation and a prototype of symbol under cursor
  ;(local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)

  ;; unfold the block under cursor
  ;(local-set-key "\C-c+" 'semantic-tag-folding-show-block)
  ;; fold the block under cursor
  ;(local-set-key "\C-c-" 'semantic-tag-folding-fold-block)
  ;; unfold all
  ;(local-set-key "\C-c\C-c+" 'semantic-tag-folding-show-all)
  ;; fold all
  ;(local-set-key "\C-c\C-c-" 'semantic-tag-folding-fold-all)

  ;; show emacs code browser
  ;(local-set-key "\C-cb" 'ecb-activate)

  (ggtags-mode 1)

  ;; auto-complete integration
  ;(add-to-list 'ac-sources 'ac-source-gtags)
  ;(add-to-list 'ac-sources 'ac-source-semantic)
  ;(add-to-list 'ac-sources 'ac-source-c-headers)

  ;; use rebox2 mode
  (local-set-key [(shift meta q)] 'rebox-cycle)

  ;; flyspell mode for comments
  (flyspell-prog-mode)

  ;; org-table mode support for comments
  (orgtbl-mode)

  ;; change paragraph definition to correctly wrap doxygen \param and \tparam
  ;; lines.
  (setq paragraph-start "\\(//+[!]?\\|\\**\\)[ ]*\\([ ]*$\\|[@\\\\]\\(param\\|tparam\\|return\\|pre\\)\\)\\|\f")

  ;; add C++11 keywords
  (font-lock-add-keywords
   'c++-mode '(
               ("\\<\\(alignof\\|alignas\\|constexpr\\|decltype\\|noexcept\\|nullptr\\|static_assert\\|thread_local\\|override\\|final\\)\\>" . 'font-lock-keyword-face)
               ("\\<\\(char[0-9]+_t\\)\\>" . 'font-lock-keyword-face)))

  (qt-cedet-setup)
  )

(add-hook 'c-mode-common-hook 'my-cedet-hook)
(add-hook 'lisp-mode-hook 'my-cedet-hook)
(add-hook 'scheme-mode-hook 'my-cedet-hook)
(add-hook 'emacs-lisp-mode-hook 'my-cedet-hook)
(add-hook 'erlang-mode-hook 'my-cedet-hook)

;; EDE
(global-ede-mode 1)
(ede-enable-generic-projects)

;; CMake Projects
(if (file-exists-p "~/Dropbox/stxxl/CMakeLists.txt")
    (ede-cpp-root-project "stxxl"
                          :file "~/Dropbox/stxxl/CMakeLists.txt"
                          :include-path '("/include/")
                          ))

(if (file-exists-p "~/Dropbox/parallel-string-sorting/CMakeLists.txt")
    (ede-cpp-root-project "parallel-string-sorting"
                          :file "~/Dropbox/parallel-string-sorting/CMakeLists.txt"
                          :compile-command "cd b && make -j4 && ctest && cd .."
                          ))

(if (file-exists-p "~/Dropbox/divsufsort-lcp-pss/CMakeLists.txt")
    (ede-cpp-root-project "divsufsort-lcp-pss"
                          :file "~/Dropbox/divsufsort-lcp-pss/CMakeLists.txt"
                          :compile-command "cd b && make -j4 && cd .."
                          ))

(if (file-exists-p "~/thrill/CMakeLists.txt")
    (ede-cpp-root-project "thrill"
                          :file "~/thrill/CMakeLists.txt"
                          :include-path '("/extlib/gtest/" "/extlib/cereal/")
                          :compile-command "cd build && make -j4 && ctest -V"
                          ))

(if (file-exists-p "~/tbt/CMakeLists.txt")
    (ede-cpp-root-project "tbt"
                          :file "~/tbt/CMakeLists.txt"
                          :include-path '("/extlib/cereal/include/" "/extlib/websocketpp/" "/extlib/soci/src/core/" "/extlib/capnproto/c++/src/" "/b/")
                          :compile-command "cd b && make -j4 && ctest && cd .. && doxygen"
                          ))

(if (file-exists-p "~/tbt/charter/CMakeLists.txt")
    (ede-cpp-root-project "charter"
                          :file "~/tbt/charter/CMakeLists.txt"
                          :include-path '("../" "/qcustomplot/src/")
                          :compile-command "cd ../b && make -j4 && ctest && charter/app/charter"
                          ))

(if (file-exists-p "~/tbt/viz/CMakeLists.txt")
    (ede-cpp-root-project "viz"
                          :file "~/tbt/viz/CMakeLists.txt"
                          :include-path '("../" "/qcustomplot/src/")
                          :compile-command "cd ../b && make -j4 && cd viz && ctest && app/viz"
                          ))

(if (file-exists-p "~/synca/Web/panthema.net/panthema/src/CMakeLists.txt")
    (ede-cpp-root-project "panthema"
                          :file "~/synca/Web/panthema.net/panthema/src/CMakeLists.txt"
                          :compile-command "cd ../build && make"
                          ))

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

;; mark 80th column on some modes

(add-hook 'c-mode-common-hook (lambda () (column-marker-1 80)))
(add-hook 'cmake-mode-hook (lambda () (column-marker-1 80)))

;; --------------------------------
;; --- ECB - Emacs Code Browser ---
;; --------------------------------

(setq ecb-tip-of-the-day nil) ;; no ecb tip of the day
(setq stack-trace-on-error t)

;; --------------------
;; --- ido and smex ---
;; --------------------

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

(global-set-key (kbd "M-x") 'smex)

;; ---------------------
;; --- auto-complete ---
;; ---------------------

;(require 'auto-complete-config)
;(ac-config-default)

;; never start automatically
;(setq ac-auto-start nil)
;; trigger auto-complete on TAB
;(ac-set-trigger-key "TAB")

;; -----------------
;; --- yasnippet ---
;; -----------------

(setq yas-snippet-dirs
      '("~/.emacs.d/snippets/"              ;; personal snippets
        ))

(require 'yasnippet)
(yas-reload-all)
(yas-global-mode 1)

;; --------------------
;; --- Java support ---
;; --------------------

(add-hook 'java-mode-hook '(lambda () (setq tab-width 4)))

;; -------------------------------------
;; --- OpenWith program associations ---
;; -------------------------------------

(setq openwith-associations '())

(add-to-list 'openwith-associations '("\\.pdf\\'" "evince" (file)))
(add-to-list 'openwith-associations '("\\.\\(?:mpe?g\\|avi\\|wmv\\)\\'" "mplayer" ("-idx" file)))
(add-to-list 'openwith-associations '("\\.ods\\'" "libreoffice" (file)))
(add-to-list 'openwith-associations '("\\.xls\\'" "libreoffice" (file)))
(add-to-list 'openwith-associations '("\\.odt\\'" "libreoffice" (file)))
(add-to-list 'openwith-associations '("\\.doc\\'" "libreoffice" (file)))

;; ------------------------------
;; --- Compile CMake Projects ---
;; ------------------------------

(require 'compile)
(setq compilation-disable-input nil)
(setq compilation-last-buffer nil)
(setq compilation-scroll-output t)
(setq mode-compile-always-save-buffer-p t)

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

;; -----------------------------------
;; --- Grand Unified Debugger mode ---
;; -----------------------------------

(add-hook 'gud-mode-hook
          (lambda ()
            (define-key gud-mode-map [f4] 'gud-run)
            (define-key gud-mode-map [f5] 'gud-step)
            (define-key gud-mode-map [f6] 'gud-next)
            (define-key gud-mode-map [f7] 'gud-until)
            (define-key gud-mode-map [f8] 'gud-finish)
            ))

;; --------------------------
;; --- Processing Hotkeys ---
;; --------------------------

(defun processing-mode-init ()
  (local-set-key [f5] 'processing-sketch-run)
  )

(add-hook 'processing-mode-hook 'processing-mode-init)

;; ------------------------
;; --- Multiple Cursors ---
;; ------------------------

(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)
(global-set-key (kbd "C-c !") 'mc/mark-all-dwim)

(add-hook 'multiple-cursors-mode-hook
          (lambda ()
            (define-key mc/keymap (kbd "<return>") nil)
            ))

;; --------------------------
;; --- Make eshell Usable ---
;; --------------------------

(define-key comint-mode-map (kbd "<up>") 'comint-previous-input)
(define-key comint-mode-map (kbd "<down>") 'comint-next-input)

;; ------------------------------------------------
;; --- Increment and Decrement Numbers at Point ---
;; ------------------------------------------------
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

;; -------------------------------------------
;; --- Custom Minor Mode for Global Keymap ---
;; -------------------------------------------

;; http://emacs.stackexchange.com/questions/352/how-to-override-major-mode-bindings

(defvar my-keymap-mode-map (make-sparse-keymap)
  "Keymap while my-keymap-mode is active.")

(define-minor-mode my-keymap-mode
  "A minor mode so that my key settings override annoying major modes."
  nil
  :lighter ""
  my-keymap-mode-map)

(defadvice load (after give-my-keybindings-priority)
  "Try to ensure that my keybindings always have priority."
  (if (not (eq (car (car minor-mode-map-alist)) 'my-keymap-mode))
      (let ((mykeys (assq 'my-keymap-mode minor-mode-map-alist)))
        (assq-delete-all 'my-keymap-mode minor-mode-map-alist)
        (add-to-list 'minor-mode-map-alist mykeys))))
(ad-activate 'load)

(defun turn-on-my-keymap-mode ()
  "Turns on my-keymap-mode."
  (interactive) (my-keymap-mode t))

(defun turn-off-my-keymap-mode ()
  "Turns off my-keymap-mode."
  (interactive) (my-keymap-mode -1))

;; ---- list of global key bindings ----

;; ag- or rgrep-based project-wide search
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
(define-key my-keymap-mode-map (kbd "C-c C-s") 'my-ag-grep)

;; window handling
(define-key my-keymap-mode-map "\M-`" 'delete-other-windows)
(define-key my-keymap-mode-map "\M-2" 'new-frame)
(define-key my-keymap-mode-map "\M-3" 'delete-frame)

;; loading the buffer list
(define-key my-keymap-mode-map [C-x C-b] 'buffer-menu)
(define-key my-keymap-mode-map [M-S-up] 'ibuffer)

;; fast nagivation in buffer stack
(define-key my-keymap-mode-map [M-S-left] 'previous-buffer)
(define-key my-keymap-mode-map [M-S-right] 'next-buffer)

;; F4 -> launch a terminal (just about anywhere)
(defun my-terminal (&optional arg)
  "Launch terminal in current directory."
  (interactive)
  ;(start-process "terminal" "*scratch*" "/usr/bin/urxvt")
  (if
      ;; if buffer is under tramp
      (file-remote-p default-directory)
      (shell)
    (start-process "terminal" nil "/usr/bin/urxvt")
    )
)
(define-key my-keymap-mode-map [f4] 'my-terminal)

;; globally activate keymap
(define-globalized-minor-mode
  global-my-keymap-mode my-keymap-mode turn-on-my-keymap-mode)

(global-my-keymap-mode)

;; Turn off the minor mode in the minibuffer
(add-hook 'minibuffer-setup-hook 'turn-off-my-keymap-mode)

;; modify ibuffer keymap: mouse click opens a file
(defun my-ibuffer-keys ()
  "Modify keymaps used by `ibuffer'."
  (local-set-key (kbd "<down-mouse-1>") 'ibuffer-visit-buffer)
  )

(add-hook 'ibuffer-hook 'my-ibuffer-keys)
