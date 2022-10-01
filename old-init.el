(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-fold-env-spec-list
   '(("[tikzpicture]"
      ("tikzpicture"))
     ("[algorithm]"
      ("algorithm"))
     ("[algorithm2e]"
      ("algorithm2e"))))
 '(LaTeX-fold-macro-spec-list nil)
 '(LaTeX-fold-math-spec-list nil)
 '(TeX-fold-env-spec-list nil)
 '(TeX-fold-macro-spec-list nil)
 '(TeX-fold-math-spec-list nil)
 '(TeX-save-query nil)
 '(TeX-source-correlate-mode t)
 '(auth-sources '("~/.gnus.d/authinfo" "~/.gnus.d/authinfo.gpg" "~/.netrc"))
 '(bibtex-entry-format
   '(opts-or-alts required-fields numerical-fields whitespace realign last-comma delimiters sort-fields))
 '(cperl-continued-brace-offset -4)
 '(cperl-continued-statement-offset 4)
 '(cperl-extra-newline-before-brace nil)
 '(cperl-extra-newline-before-brace-multiline nil)
 '(cperl-indent-level 4)
 '(cperl-indent-parens-as-block t)
 '(cperl-label-offset -4)
 '(cperl-merge-trailing-else nil)
 '(custom-safe-themes
   '("4ba6aa8a2776688ef7fbf3eb2b5addfd86d6e8516a701e69720b705d0fbe7f08" default))
 '(doc-view-continuous t)
 '(font-latex-fontify-sectioning 1.0)
 '(font-latex-match-reference-keywords
   '(("printbibliography" "[{")
     ("addbibresource" "[{")
     ("autoref" "[{")
     ("cref" "[{")
     ("Cref" "[{")
     ("crefrange" "[{")
     ("Crefrange" "[{")))
 '(fringe-mode '(nil . 0) nil (fringe))
 '(gdb-many-windows t)
 '(ggtags-highlight-tag 10000.0)
 '(ggtags-highlight-tag-delay 10000.0)
 '(ggtags-update-on-save nil)
 '(git-commit-fill-column 1000)
 '(gnus-init-file "~/.emacs.d/gnus-init.el")
 '(ispell-highlight-face 'flyspell-incorrect)

 '(reftex-default-bibliography '("bibliography/references.bib"))
 '(reftex-ref-macro-prompt nil t)
 '(reftex-ref-style-default-list '("Cleveref"))
 '(rtags-jump-to-first-match nil)
 '(safe-local-variable-values
   '((eval add-to-list
           (make-variable-buffer-local 'LaTeX-fold-math-spec-list)
           '("[tabular]"
             ("tabular")))
     (c-tab-always-indent . t)
     (nxml-child-indent . 4)
     (rebox-min-fill-column . 100)
     (rebox-min-fill-column . 110)
     (rebox-min-fill-column . 120)))
 '(sieve-buffer "*sieve-man*")
 '(sieve-manage-default-port "4190")
 '(srecode-map-save-file "~/.emacs.d/srecode/srecode-map")
 '(vc-handled-backends '(svn)))

;; -----------------------------------------------------------------------------
;; --- el-get package management
;; -----------------------------------------------------------------------------

;; BEGIN PACKAGE LIST to el-get

;; general emacs behaviour extensions
(push 'ag my-el-get-packages)
(push 'bm my-el-get-packages)
;(push 'clang-format my-el-get-packages)
(push 'column-marker my-el-get-packages)
(push 'flymake my-el-get-packages)
(push 'folding my-el-get-packages)
(push 'ggtags my-el-get-packages)
(push 'google-this my-el-get-packages)
(push 'leuven-theme my-el-get-packages)
(push 'multiple-cursors my-el-get-packages)
(push 'rainbow-delimiters my-el-get-packages)
(push 'rebox2 my-el-get-packages)

;; system naviation modes
(push 'dired+ my-el-get-packages)
;(push 'openwith my-el-get-packages)

;; text modes
(push 'auctex my-el-get-packages)

; ;; programming modes
(push 'arduino-mode my-el-get-packages)
(push 'cperl-mode my-el-get-packages)
(push 'ess my-el-get-packages)
;(push 'json-mode my-el-get-packages)
(push 'js2-mode my-el-get-packages)
(push 'mmm-mode my-el-get-packages)
(push 'modern-cpp-font-lock my-el-get-packages)
(push 'php-mode my-el-get-packages)
;(push 'processing-mode my-el-get-packages)
(push 'projectile my-el-get-packages)
(push 'qml-mode my-el-get-packages)
;(push 'tt-mode my-el-get-packages)
(push 'groovy-emacs-mode my-el-get-packages)
;(push 'rtags my-el-get-packages)
(push 'lsp-mode my-el-get-packages)
;(push 'lsp-java my-el-get-packages)
(push 'lsp-ui my-el-get-packages)
(push 'company-lsp my-el-get-packages)

;; version control
(push 'dsvn my-el-get-packages)
(push 'magit my-el-get-packages)
;(push 'magit-svn my-el-get-packages)

;; utility packages
(push 'htmlize my-el-get-packages)
(push 'clang-format my-el-get-packages)

;; END PACKAGE LIST for el-get



;; -----------------------------------------------------------------------------
;; --- Load some custom extensions
;; -----------------------------------------------------------------------------

(add-to-list 'auto-mode-alist '("\\.qml$" . qml-mode))
(add-to-list 'auto-mode-alist '("\\.tpp$" . c++-mode))

;; --- autoload lilypond major mode ---

(add-to-list 'load-path "~/.emacs.d/lilypond-2.12.1/")
(autoload 'LilyPond-mode "lilypond-mode" "LilyPond Editing Mode" t)
;
(add-to-list 'auto-mode-alist '("\\.ly$" . LilyPond-mode))
(add-to-list 'auto-mode-alist '("\\.ily$" . LilyPond-mode))
(add-to-list 'auto-mode-alist '("\\.lytex$" . latex-mode))
(add-hook 'LilyPond-mode-hook (lambda () (turn-on-font-lock)))

; ;; --- simple generic-mode for structures wiki notes ---
;
; (require 'generic-x)
;
; (defface my-title-text-face
;   '((t (:foreground "Cyan1" :weight bold)))
;   "My custom face for wiki note titles")
;
; (define-generic-mode 'notes-mode
;   '("#")                            ; comments start with '#'
;   '()                               ; keywords
;   '(("^\\(Titel\\)=\\(.*\\)" (1 'font-lock-type-face) (2 'my-title-text-face))
;     ("^\\(.*\\)=\\(.*\\)" (1 'font-lock-type-face) (2 'font-lock-variable-name-face))
;     )
;   '("\\.txw$")                        ;; files for which to activate this mode
;   ()                                 ;; other functions to call
;   "A mode for structured wiki-like notes"
; )

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
            (local-set-key [(meta control return)] 'org-time-stamp)
            (local-set-key [f5] 'org-html-export-to-html)
            (local-set-key [f6] 'org-latex-export-to-pdf)
            ))

;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((sql . t) (shell . t)))

(setq org-priority-faces '((?A . (:foreground "red" :weight 'bold))
                           (?B . (:foreground "yellow"))
                           (?C . (:foreground "green"))
                           (?D . (:foreground "deep sky blue"))
                           (?E . (:foreground "salmon"))))

;; -----------------------------------------------------------------------------
;; --- Automatic Mode Triggers
;; -----------------------------------------------------------------------------

;; perl XS extensions recognition
(add-to-list 'auto-mode-alist '("\\.xs\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.pc\\'" . c++-mode))

;; some more c++ files
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.tcc\\'" . c++-mode))

;; doxygen mode
(defun my-dox-mode ()
  "Add some latex macro keys"
  (interactive)
  (c++-mode)
  (visual-line-mode 1)
  (flyspell-mode)
  (set-variable 'fill-column 100000)
  )
(add-to-list 'auto-mode-alist '("\\.dox\\'" . my-dox-mode))



;; -----------------------------------------------------------------------------
;; --- flymake mode
;; -----------------------------------------------------------------------------

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

;; -----------------------------------------------------------------------------
;; --- rebox2 mode
;; -----------------------------------------------------------------------------

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

;; -----------------------------------------------------------------------------
;; --- C/C++ Mode Configuration
;; -----------------------------------------------------------------------------

(defun tb-c-common-hook ()
  ;; gnu global tag lookup
  ;;(ggtags-mode 1)

  ;(local-set-key "\M-," 'rtags-find-references-at-point)
  ;(local-set-key "\M-." 'rtags-find-symbol-at-point)

  ;; use rebox2 mode
  (local-set-key [(shift meta q)] 'rebox-cycle)

  ;; add C++11 keywords to font-lock
  (require 'modern-cpp-font-lock)
  (modern-c++-font-lock-mode)

  ;; hide "mc++fl" minor mode
  (diminish 'modern-c++-font-lock-mode)

  ;; ------------------------------------------------------------
  ;; add keywords for Qt code (signals, slots, and some Q_ macros

  (setq c-protection-key
        (concat "\\<\\(public\\|public slot\\|protected"
                "\\|protected slot\\|private\\|private slot"
                "\\)\\>")
        c-C++-access-key
        (concat "\\<\\(signals\\|public\\|protected\\|private"
                "\\|public slots\\|protected slots\\|private slots"
                "\\)\\>[ \t]*:"))

  ;; modify the colour of slots to match public, private, etc ...
  (font-lock-add-keywords
   'c++-mode '(("\\<\\(slots\\|signals\\)\\>" . font-lock-type-face)))
  ;; make new font for rest of qt keywords
  (make-face 'qt-keywords-face)
  (set-face-foreground 'qt-keywords-face "MediumPurple")
  ;; qt keywords
  (font-lock-add-keywords 'c++-mode '(("\\<Q_[A-Z]*\\>" . 'qt-keywords-face)))
  (font-lock-add-keywords 'c++-mode '(("\\<SIGNAL\\|SLOT\\>" . 'qt-keywords-face)))

  ;; ---[ end Qt code ]------------------------------------------
)

(add-hook 'c-mode-common-hook 'tb-c-common-hook)

;; mark 80th column on some modes

(add-hook 'c-mode-common-hook (lambda () (column-marker-1 90)))
(add-hook 'cmake-mode-hook (lambda () (column-marker-1 90)))


;; -----------------------------------------------------------------------------
;; --- auto-complete
;; -----------------------------------------------------------------------------

;(require 'auto-complete-config)
;(ac-config-default)

;; never start automatically
;(setq ac-auto-start nil)
;; trigger auto-complete on TAB
;(ac-set-trigger-key "TAB")


;; -----------------------------------------------------------------------------
;; --- Multiple Cursors
;; -----------------------------------------------------------------------------

(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)
(global-set-key (kbd "C-c !") 'mc/mark-all-dwim)

(add-hook 'multiple-cursors-mode-hook
          (lambda ()
            (define-key mc/keymap (kbd "<return>") nil)
            ))




;; -----------------------------------------------------------------------------
;; --- Custom Minor Mode for Global Keymap
;; -----------------------------------------------------------------------------

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

;; globally activate keymap
(define-globalized-minor-mode
  global-my-keymap-mode my-keymap-mode turn-on-my-keymap-mode)

(global-my-keymap-mode)

;; Turn off the minor mode in the minibuffer
(add-hook 'minibuffer-setup-hook 'turn-off-my-keymap-mode)



;; -----------------------------------------------------------------------------

(defun replace-in-string (what with in)
  (replace-regexp-in-string (regexp-quote what) with in nil 'literal))

;; -----------------------------------------------------------------------------

;; (add-hook 'text-mode-hook
;;           '(lambda ()
;;              (setq indent-tabs-mode nil)
;;              (setq tab-width 8)
;;              (setq indent-line-function (quote insert-tab))))

(use-package
 lsp-metals
 :ensure t
 :custom
 ;; Metals claims to support range formatting by default but it supports range
 ;; formatting of multiline strings only. You might want to disable it so that
 ;; emacs can use indentation provided by scala-mode.
 (lsp-metals-server-args '("-J-Dmetals.allow-multiline-string-formatting=off"))
 :hook (scala-mode . lsp))
