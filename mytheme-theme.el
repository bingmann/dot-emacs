;; ------------------------
;; --- My Overlay Theme ---
;; ------------------------

(deftheme mytheme "My Overlay Theme")

(let ((class '((class color) (min-colors 89)))
      (background "black")
      (alt-background "#222")
      (strong "#eee")
      (bright "#eee")
      (normal "gray")
      (faint "#888")
      (dark "#888")
      (faintest "#333")
      (very-dark "#333")
      (darkest "black")
      (contrast-background "#331133")
      (red-brightest "#ffbbbb")
      (red-bright "#f25a5a")
      (red "red")
      (red-dark "#5a0000")
      (red-darkest "#1a0000")
      (pink-brightest "#ffbfd7")
      (pink-brighter "#ff8fb7")
      (pink "#ff5f87")
      (pink-darker "#aa2255")
      (orange "#efc334")
      (yellow "#f6df92")
      (yellow-darker "#a86")
      (yellow-dark "#643")
      (green-bright "#dcf692")
      (green "#acfb5a")
      (green-darker "#77bb33")
      (cyan "#5af2ee")
      (turquoise "#3affa3")
      (malachite "#3aff83")
      (blue-bright "#dcdff2")
      (blue "#b2baf6")
      (blue-darker "#5555dd")
      (magenta-bright "#f09fff")
      (magenta "#c350ff")
      (magenta-dark "#34004A")
      (magenta-darkest "#1B0026")
      (violet "#78537A")
      (violet-darkest "#110011")
      (violet-red "#d020a7")
      )

(custom-theme-set-faces
 'mytheme

 ;; standard faces
 `(default ((t (:foreground "white" :background "black"))))
 `(bold ((,class (:weight bold))))
 `(italic ((,class (:slant italic))))
 `(bold-italic ((,class (:slant italic :weight bold))))
 `(underline ((,class (:underline t))))
 `(shadow ((,class (:foreground ,normal))))
 `(link ((,class (:foreground ,turquoise :underline t))))

 ;; gui elements and interaction
 `(cursor ((t (:background "palegoldenrod"))))
 `(fringe ((t (:background "gray10"))))
 `(border ((,class (:background ,alt-background))))
 `(region ((t (:background "blue3"))))
 `(secondary-selection ((t (:background "SkyBlue4"))))
 `(minibuffer-prompt ((t (:foreground "cyan"))))

 ;; mode line style
 `(mode-line ((t (:foreground "white" :background "gray10"))))
 `(mode-line-buffer-id ((t (:foreground "white" :background "gray10"))))
 `(mode-line-inactive ((t (:foreground "white" :background "gray10"))))
 `(mode-line-mousable ((t (:foreground "white" :background "gray10"))))
 `(mode-line-mousable-minor-mode ((t (:foreground "white" :background "gray10"))))
 `(modeline ((t (:foreground "white" :background "gray10"))))
 `(modeline-mousable ((t (:foreground "white" :background "gray10"))))
 `(modeline-mousable-minor-mode ((t (:foreground "white" :background "gray10"))))

 ;; bookmark mode
 `(bm-face ((t (:background "#604000"))))
 `(bm-fringe-face ((t (:background "DarkOrange1"))))

 ;; org mode
 `(org-link ((t (:inherit link :foreground "cyan1" :underline t))))
 `(org-table ((t (:foreground "deep sky blue"))))

 ;; dired+ mode
 `(diredp-dir-priv ((t (:foreground "#74FFFF"))))
 `(diredp-file-name ((t (:foreground "white"))))
 `(diredp-dir-name ((t (:foreground "#7474FFFFFFFF"))))



 ;; magit `next'
 `(magit-diff-added ((t (:foreground "#33ff33"))))
 `(magit-diff-added-highlight ((t (:inherit magit-diff-added :weight normal))))
 `(magit-diff-removed ((t (:inherit diff-changed :foreground "red"))))
 `(magit-diff-removed-highlight ((t (:inherit magit-diff-removed :weight normal))))
 `(magit-section-highlight ((t (:foreground "pale goldenrod"))))

 ;; cedet
 `(semantic-complete-inline-face ((t (:underline "yellow"))))
 `(semantic-decoration-on-fileless-includes ((t (:background "#009000"))))
 `(semantic-decoration-on-private-members-face ((t (:background "#200000"))))
 `(semantic-decoration-on-protected-members-face ((t (:background "#000020"))))
 `(semantic-decoration-on-unknown-includes ((t (:background "#900000"))))
 `(semantic-decoration-on-unparsed-includes ((t (:background "#555500"))))
 `(semantic-highlight-edits-face ((t (:background "gray20"))))
 `(semantic-highlight-func-current-tag-face ((t (:background "gray20"))))
 `(semantic-regtest-reference-button-face ((t (:forground "ForestGreen" :bold t))))
 `(semantic-regtest-test-button-face ((t (:forground "blue" :bold t))))
 `(semantic-tag-boundary-face ((((class color) (background dark)) (:overline "#0000a0"))))
 `(semantic-unmatched-syntax-face ((t (:background "#300000"))))
 `(senator-momentary-highlight-face ((t (:background "gray30"))))


 ;; general font lock faces
 `(font-lock-builtin-face ((t (:foreground "LightSteelBlue"))))
 `(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face :foreground "chocolate1"))))
 `(font-lock-comment-face ((t (:foreground "chocolate1"))))
 `(font-lock-constant-face ((t (:foreground "Aquamarine"))))
 `(font-lock-doc-face ((t (:inherit font-lock-string-face))))
 `(font-lock-function-name-face ((t (:foreground "LightSkyBlue"))))
 `(font-lock-keyword-face ((t (:foreground "Cyan1"))))
 `(font-lock-preprocessor-face ((t (:foreground "Orchid"))))
 `(font-lock-string-face ((t (:foreground "LightSalmon"))))
 `(font-lock-type-face ((t (:foreground "PaleGreen"))))
 `(font-lock-variable-name-face ((t (:foreground "LightGoldenrod"))))
 `(font-lock-warning-face ((((class color) (min-colors 88) (background dark)) (:foreground "Red" :weight bold))))

 ;; 80-column marker
 `(column-marker-1 ((t (:background "dark red" :weight bold))))

 ;; isearch
 `(isearch ((t (:foreground "brown4" :background "palevioletred2"))))
 `(isearch-fail ((,class (:background ,background :inherit font-lock-warning-face :inverse-video t))))

 ;; ido
 `(ido-first-match ((t (:foreground "gold" :weight bold))))
 `(ido-only-match ((t (:foreground "green"))))
 `(ido-subdir ((t (:foreground "yellow"))))

 ;; cperl-mode
 `(cperl-array-face ((t (:foreground "#5555ff" :weight bold))))
 `(cperl-hash-face ((t (:foreground "orange" :slant italic :weight bold))))


   `(highlight ((,class (:inverse-video nil :background "#222299"))))
   `(match ((,class (:foreground ,blue :background ,background :inverse-video t))))
   `(lazy-highlight ((,class (:foreground ,cyan :background ,background :inverse-video t))))
   `(trailing-whitespace ((,class (:background ,red :underline nil))))

   `(which-func ((,class (:foreground ,blue :background nil :weight bold))))

   `(header-line ((,class (:inherit mode-line :foreground ,magenta :background nil))))
   `(widget-button ((,class (:underline t))))
   `(widget-field ((,class (:background ,alt-background :box (:line-width 1 :color ,normal)))))

   `(success ((,class (:foreground ,green))))
   `(warning ((,class (:foreground ,orange))))
   `(error ((,class (:foreground ,red))))

   `(show-paren-match ((,class (:foreground "#FFE200" :background nil :slant italic :weight bold))))
   `(show-paren-mismatch ((,class (:background ,background :inherit font-lock-warning-face :inverse-video t))))

   `(custom-variable-tag ((,class (:foreground ,blue))))
   `(custom-group-tag ((,class (:foreground ,blue))))
   `(custom-state-tag ((,class (:foreground ,green))))

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; mode specific faces

   ;; diff
   `(diff-added ((,class (:foreground ,green))))
   `(diff-changed ((,class (:foreground ,violet))))
   `(diff-removed ((,class (:foreground ,orange))))
   `(diff-header ((,class (:foreground ,cyan :background nil))))
   `(diff-file-header ((,class (:foreground ,blue :background nil))))
   `(diff-hunk-header ((,class (:foreground ,magenta))))
   `(diff-refine-removed ((,class (:inherit magit-diff-removed-highlight :foreground ,red-brightest))))
   `(diff-refine-added ((,class (:inherit magit-diff-added-highlight :foreground ,blue-bright))))

   ;; diff-hl
   `(diff-hl-change ((,class (:foreground ,blue :background ,blue-darker))))
   `(diff-hl-delete ((,class (:foreground ,pink :background ,pink-darker))))
   `(diff-hl-insert ((,class (:foreground ,green :background ,green-darker))))

   ))














;; (custom-theme-set-faces
;;  'mytheme

;;  '(TeX-fold-unfolded-face ((t (:background "#080a1d"))))
;;  '(diff-file-header ((t (:background "grey20" :weight bold))))
;;  '(diff-file-header-face ((t (:background "grey60" :weight bold))) t)
;;  '(diff-header ((t (:background "grey10"))))
;;  '(highlight ((t (:background "#222277"))))
;;  '(hl-line ((t (:background "#112233"))))
;;  '(lazy-highlight ((t (:background "paleturquoise4"))))
;;  '(link ((t (:underline t :foreground "cyan1"))))
;;  '(link-visited ((t (:underline t :foreground "violet"))))
;;  '(show-paren-match ((t (:foreground "magenta" :slant italic))))
;;  '(show-paren-match-face ((t (:foreground "#0090FF" :background "black"))) t)
;;  '(show-paren-mismatch-face ((t (:foreground "white" :background "purple"))) t)
;;  '(trailing-whitespace ((t (:background "red1")))))

;;  '(diff-added ((t (:inherit diff-changed :foreground "#33ff33"))))
;;  '(diff-changed ((t nil)) t)
;;  '(diff-changed-face ((t nil)) t)
;;  '(diff-removed ((t (:inherit diff-changed :foreground "#ff3333"))))
;;  '(diff-removed-face ((t (:inherit diff-changed :background "#553333"))) t)





;;    ;; magit `next'
;;    `(magit-section ((,class (:inherit nil :weight bold))))
;;    `(magit-section-highlight ((,class (:foreground ,bright))))
;;    `(magit-section-heading ((,class (:foreground ,blue-bright))))
;;    `(magit-branch-local ((,class (:foreground ,turquoise))))
;;    `(magit-branch-remote ((,class (:foreground ,yellow))))
;;    `(magit-hash ((,class (:foreground "white"))))
;;    `(magit-diff-file-heading ((,class (:foreground ,yellow))))
;;    `(magit-diff-hunk-heading ((,class (:foreground ,magenta))))
;;    `(magit-diff-hunk-heading-highlight ((,class (:inherit magit-diff-hunk-heading :weight bold))))
;;    `(magit-diff-context ((,class (:foreground ,normal))))
;;    `(magit-diff-context-highlight ((,class (:inherit magit-diff-context :foreground ,bright))))
;;    `(magit-diff-added ((,class (:foreground ,orange))))
;;    `(magit-diff-added-highlight ((,class (:inherit magit-diff-added :weight bold))))
;;    `(magit-diff-removed ((,class (:foreground ,red-bright))))
;;    `(magit-diff-removed-highlight ((,class (:inherit magit-diff-removed :weight bold))))



;; ;;  '(bold ((t (:bold t))))
;; ;;  '(bold-sitalic ((t (:italic t :bold t))))
;; ;;  '(font-latex-sectioning-5-face ((((class color) (background dark)) (:foreground "#00c000"))))
;; ;;  '(font-latex-slide-title-face ((t (:inherit (variable-pitch font-lock-type-face) :weight bold))))
;; ;;  '(font-latex-warning-face ((((class color) (background dark)) (:foreground "#c00000"))))
;; ;;  '(gnus-button ((t (:underline t))) t)
;; ;;  '(gnus-group-mail-1 ((t (:foreground "#e1ffe1" :weight bold :height 140 :family "Courier"))) t)
;; ;;  '(gnus-group-mail-1-empty ((t (:inherit gnus-group-mail-1 :weight normal))) t)
;; ;;  '(gnus-group-mail-1-empty-face ((t (:inherit gnus-group-mail-1 :weight normal))) t)
;; ;;  '(gnus-group-mail-1-face ((t (:in2herit gnus-group-mail-1 :weight bold))) t)
;; ;;  '(gnus-group-mail-2 ((t (:foreground "DarkSeaGreen1" :weight bold :height 140 :family "Courier"))) t)
;; ;;  '(gnus-group-mail-2-empty ((t (:inherit gnus-group-mail-2 :weight normal))) t)
;; ;;  '(gnus-group-mail-2-empty-face ((t (:inherit gnus-group-mail-2 :weight normal))) t)
;; ;;  '(gnus-group-mail-2-face ((t (:inherit gnus-group-mail-2 :weight bold))) t)
;; ;;  '(gnus-group-mail-3 ((t (:foreground "aquamarine1" :weight bold :height 140 :family "Courier"))) t)
;; ;;  '(gnus-group-mail-3-empty ((t (:inherit gnus-group-mail-3 :weight normal))) t)
;; ;;  '(gnus-group-mail-3-empty-face ((t (:inherit gnus-group-mail-3 :weight normal))) t)
;; ;;  '(gnus-group-mail-3-face ((t (:inherit gnus-group-mail-3 :weight bold))) t)
;; ;;  '(gnus-header-content ((t (:foreground "SpringGreen1" :height 140 :family "Courier"))) t)
;; ;;  '(gnus-header-from ((t (:foreground "PaleGreen1" :height 140 :family "Courier"))) t)
;; ;;  '(gnus-header-name ((t (:foreground "SpringGreen2" :height 140 :family "Courier"))) t)
;; ;;  '(gnus-header-newsgroups ((t (:foreground "yellow" :height 140 :family "Courier"))))
;; ;;  '(gnus-header-subject ((t (:foreground "DeepSkyBlue" :height 140 :family "Courier"))) t)
;; ;;  '(gnus-summary-cancelled ((t (:background "black" :foreground "yellow" :height 140 :family "Courier"))) t)
;; ;;  '(gnus-summary-high-ancient ((t (:foreground "SkyBlue" :weight bold :height 140 :family "Courier"))) t)
;; ;;  '(gnus-summary-low-ancient ((t (:foreground "SkyBlue" :slant italic :height 140 :family "Courier"))) t)
;; ;;  '(gnus-summary-normal-ancient ((t (:foreground "SkyBlue" :height 140 :family "Courier"))) t)
;; ;;  '(gnus-summary-normal-read ((t (:foreground "PaleGreen" :height 140 :family "Courier"))) t)
;; ;;  '(gnus-summary-normal-unread ((t (:weight bold :height 140 :family "Courier"))) t)
;; ;;  '(gnus-summary-selected ((t (:underline t :height 140 :family "Courier"))))
;; ;;  '(widget-button ((t (:underline t))))

;; ;; '(rainbow-delimiters-depth-1-face ((t (:foreground "white"))))
;; ;; '(rainbow-delimiters-depth-2-face ((t (:foreground "sandy brown"))))
;; ;; '(rainbow-delimiters-depth-3-face ((t (:foreground "indian red"))))
;; ;; '(rainbow-delimiters-depth-4-face ((t (:foreground "medium aquamarine"))))
;; ;; '(rainbow-delimiters-depth-5-face ((t (:foreground "saddle brown"))))
;; ;; '(rainbow-delimiters-depth-6-face ((t (:foreground "dark khaki"))))
;; ;; '(rainbow-delimiters-depth-7-face ((t (:foreground "cadet blue"))))
;; )

(provide-theme 'mytheme)
