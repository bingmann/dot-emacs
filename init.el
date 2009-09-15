(require 'site-gentoo)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(c-basic-offset 4)
 '(c-default-style (quote ((java-mode . "java") (awk-mode . "awk") (other . "k&r"))))
 '(c-offsets-alist (quote ((inline-open . 0) (innamespace . 0))))
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(scroll-bar-mode (quote right))
 '(size-indication-mode t))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 122 :width normal :foundry "misc" :family "fixed")))))

;; --------------------------------
;; --- Some custom key bindings ---
;; --------------------------------

(global-set-key "\M-g" 'goto-line)

; set keys f9-f12 to insert German umlauts and sz
(load-library "iso-insert")
(global-set-key (kbd "<S-f9>") 'insert-A-umlaut)
(global-set-key (kbd "<f9>") 'insert-a-umlaut)
(global-set-key (kbd "<S-f10>") 'insert-O-umlaut)
(global-set-key (kbd "<f10>") 'insert-o-umlaut)
(global-set-key (kbd "<S-f11>") 'insert-U-umlaut)
(global-set-key (kbd "<f11>") 'insert-u-umlaut)
(global-set-key (kbd "<f12>") 'insert-ss)

;; -----------------------------------
;; --- Load some custom extensions ---
;; -----------------------------------

(add-to-list 'load-path "~/.emacs.d/")

;; --- autoload lilypond major mode ---

(add-to-list 'load-path "~/.emacs.d/lilypond-2.12.1/")
(autoload 'LilyPond-mode "lilypond-mode" "LilyPond Editing Mode" t)

(add-to-list 'auto-mode-alist '("\\.ly$" . LilyPond-mode))
(add-to-list 'auto-mode-alist '("\\.ily$" . LilyPond-mode))
(add-hook 'LilyPond-mode-hook (lambda () (turn-on-font-lock)))

;; --- autoload actionscript mode ---

(autoload 'actionscript-mode "actionscript-mode-connors" "ActionScript Mode" t)
(add-to-list 'auto-mode-alist '("\\.as$" . actionscript-mode))

;; --- autoload template toolkit mode ---

(autoload 'tt-mode "tt-mode" "Template Toolkit Mode" t)

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

;; ---------------------------
;; --- Extra Customization ---
;; ---------------------------

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

