;(require 'site-gentoo)

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
 '(ede-project-placeholder-cache-file "~/.emacs.d/projects.ede")
 '(ede-simple-save-directory "~/.emacs.d/ede-simple")
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(scroll-bar-mode (quote right))
 '(size-indication-mode t)
 '(srecode-map-save-file "~/.emacs.d/srecode/srecode-map")
 '(semanticdb-default-save-directory "~/.emacs.d/semanticdb")
 '(vc-handled-backends nil))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 117 :width normal :foundry "Misc" :family "Fixed"))))
)

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

;; --- autoload actionscript mode ---

(autoload 'actionscript-mode "actionscript-mode-connors" "ActionScript Mode" t)
(add-to-list 'auto-mode-alist '("\\.as$" . actionscript-mode))

;; --- autoload haxe mode ---

(autoload 'haxe-mode "haxe-mode" "haXe Mode" t)
(add-to-list 'auto-mode-alist '("\\.haxe$" . haxe-mode))

;; --- autoload template toolkit mode ---

(autoload 'tt-mode "tt-mode" "Template Toolkit Mode" t)

;; --- autoload protocol buffers mode ---

(autoload 'protobuf-mode "protobuf-mode" "Protocol Buffers Mode" t)

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
(add-to-list 'auto-mode-alist '("\\.dox\\'" . c++-mode))

; protocol buffer files
(add-to-list 'auto-mode-alist '("\\.proto\\'" . protobuf-mode))

;; -----------------------------
;; --- General Customization ---
;; -----------------------------

; hook for cperl-mode to automatically set my default style
(add-hook 'cperl-mode-hook (lambda () (cperl-set-style "C++")))

; "filename [mode]" in title bar
(setq frame-title-format '("%f [mode: %m]"))

(require 'color-theme)

(defun color-theme-tb-dark ()
  "Dark color theme created by Timo, Aug 2010"
  (interactive)
  (color-theme-install
   '(color-theme-tb-dark
     ((foreground-color . "white")
      (background-color . "black") 
      (background-mode . dark))
     (default ((t (:height 117 :width normal :foundry "Misc" :family "Fixed"))))
     (bold ((t (:bold t))))
     (bold-italic ((t (:italic t :bold t))))

     ; override some unbareable defaults with dark background
     (cperl-array-face ((t (:foreground "#5555ff" :weight bold))))
     (cperl-hash-face ((t (:foreground "orange" :slant italic :weight bold))))
     (semantic-tag-boundary-face ((((class color) (background dark)) (:overline "#0000a0"))))

     ; dark mode-line
     (hl-line ((t (:background "#112233"))))
     (mode-line ((t (:foreground "#ffffff" :background "#333333"))))
     )
   )
  )

(color-theme-tb-dark)

;; --------------------------------
;; --- Some custom key bindings ---
;; --------------------------------

(global-set-key "\M-g" 'goto-line)

; set keys f9-f12 to insert German umlauts and sz
(global-set-key (kbd "<f9>") (lambda() (interactive) (insert ?\ä)))
(global-set-key (kbd "<S-f9>") (lambda() (interactive) (insert ?\Ä)))
(global-set-key (kbd "<f10>") (lambda() (interactive) (insert ?\ö)))
(global-set-key (kbd "<S-f10>") (lambda() (interactive) (insert ?\Ö)))
(global-set-key (kbd "<f11>") (lambda() (interactive) (insert ?\ü)))
(global-set-key (kbd "<S-f11>") (lambda() (interactive) (insert ?\Ü)))
(global-set-key (kbd "<f12>") (lambda() (interactive) (insert ?\ß)))

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
(add-hook 'latex-mode-hook
	  (lambda ()
	    (local-set-key "\C-\M-z" (lambda () (interactive) (insert "\\mathbb{Z}")))
	    (local-set-key "\C-\M-n" (lambda () (interactive) (insert "\\mathbb{N}")))
	    (local-set-key "\C-\M-q" (lambda () (interactive) (insert "\\mathbb{Q}")))
	    (local-set-key "\C-\M-f" (lambda () (interactive) (insert "\\mathbb{F}")))
	    (local-set-key "\C-\M-r" (lambda () (interactive) (insert "\\mathbb{R}")))
	    (local-set-key "\C-\M-k" (lambda () (interactive) (insert "\\mathbb{K}")))
	    (local-set-key "\C-\M-c" (lambda () (interactive) (insert "\\mathbb{C}")))
	    (local-set-key "\C-f" (lambda () (interactive) (insert "\\mathfrak{")))
	    (local-set-key "\C-\M-o" (lambda () (interactive) (insert "\\operatorname{")))
	    ))

;; ---------------------------
;; --- CEDET Configuration ---
;; ---------------------------

(defun list-all-subfolders (folder)
  (let ((folder-list (list folder)))
    (dolist (subfolder (directory-files folder))
      (let ((name (concat folder "/" subfolder)))
	(when (and (file-directory-p name)
		   (not (equal subfolder ".."))
		   (not (equal subfolder ".")))
	  (set 'folder-list (append folder-list (list name))))))
    folder-list))

(global-ede-mode 1)
(semantic-load-enable-excessive-code-helpers)

(require 'semantic-ia)
(setq semanticdb-default-save-directory "~/.emacs.d/semanticdb")

(semantic-add-system-include "/usr/include/" 'c-mode)
(semantic-add-system-include "/usr/include/" 'c++-mode) 
(semantic-add-system-include "/usr/lib/gcc/i686-pc-linux-gnu/4.3.4/include/" 'c-mode)
(semantic-add-system-include "/usr/lib/gcc/i686-pc-linux-gnu/4.3.4/include/" 'c++-mode)
(semantic-add-system-include "/usr/lib/gcc/i686-pc-linux-gnu/4.3.4/include/g++-v4/" 'c++-mode)

(setq qt4-base-dir "/usr/include/qt4/")
(dolist (folder (list-all-subfolders qt4-base-dir))
  (semantic-add-system-include folder 'c++-mode)
  (add-to-list 'auto-mode-alist (cons folder 'c++-mode)))
(semanticdb-enable-gnu-global-databases 'c++-mode)
(semanticdb-enable-gnu-global-databases 'c-mode)

(defun semantic-symref-no-prompt ()
  "Copy of semantic-symref without prompt"
  (interactive)
  (require 'semantic/symref/list)
  (semantic-fetch-tags)
  (let ((ct (semantic-current-tag))
	(res nil)
	)
    (when (not ct) (error "Place cursor inside tag to be searched for"))
    (message "Gathering References...")
    (setq res (semantic-symref-find-references-by-name (semantic-tag-name ct)))
    (semantic-symref-produce-list-on-results res (semantic-tag-name ct)))
  )

(add-hook 'c-mode-common-hook
	  (lambda ()
	    (local-set-key [(control return)] 'semantic-ia-complete-symbol)
	    (local-set-key [(meta return)] 'semantic-ia-complete-symbol-menu)
	    (local-set-key "\C-c<" 'semantic-ia-fast-jump)
	    (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
	    (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
	    (local-set-key "\C-c?" 'semantic-symref-no-prompt)
	    ))

;; -----------------------------------------
;; --- FlySpell fuer Deutsch und English ---
;; -----------------------------------------

(setq flyspell-issue-welcome-flag nil)
(setq flyspell-default-dictionary "american")

(defun ispell-set-deutsch ()
  "switch ispell language to deutsch"
  (interactive)
  (ispell-change-dictionary "deutsch8"))

(defun ispell-set-english ()
  "switch ispell language to english"
  (interactive)
  (ispell-change-dictionary "american"))

(defun ispell-set-british ()
  "switch ispell language to british"
  (interactive)
  (ispell-change-dictionary "british"))

(defvar toggle-ispell-english-deutsch t
  "state of english/deutsch8 toggle. t means english, nil means deutsch8")
(make-variable-buffer-local 'toggle-ispell-english-deutsch)

(defun toggle-ispell-language ()
  "Toggle ispell-language between english and deutsch8"
  (interactive)
  (cond (toggle-ispell-english-deutsch
         (setq toggle-ispell-english-deutsch nil)
         (ispell-set-deutsch))
        (t
         (setq toggle-ispell-english-deutsch t)
         (ispell-set-english))))
