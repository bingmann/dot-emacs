;; IMAP, gmail:
(setq elmo-imap4-default-server "mail.hmtg.de"
      elmo-imap4-default-user "timo@bingmann.com"
      elmo-imap4-default-authenticate-type 'clear
      elmo-imap4-default-port '993
      elmo-imap4-default-stream-type 'ssl

      ;;for non ascii-characters in folder-names
      elmo-imap4-use-modified-utf7 t
      )

(setq wl-from "Timo Bingmann <timo@tbingmann.de>"

      wl-local-domain "local"

      wl-default-folder "%INBOX"
      wl-draft-folder   "%Drafts"
      wl-trash-folder   "%Trash"
      wl-fcc            "%INBOX"
      wl-queue-folder   "%Queue"

      ;; multiple e-mail addresses
      wl-user-mail-address-list (quote ("timo@tbingmann.de" "bingmann@kit.edu"))

      ;; mark sent messages as read (sent messages get sent back to you and
      ;; placed in the folder specified by wl-fcc)
      wl-fcc-force-as-read t

      ;;for when auto-compleating foldernames
      wl-default-spec "%"

      ;; use "Fwd: " not "Forward: "
      wl-forward-subject-prefix "Fwd: "

      ;; keep the folder pane (left)
      wl-stay-folder-window t

      ;; toggle on/off with 'i'
      wl-folder-window-width 20

      ;; move .folders file
      wl-folders-file "~/.emacs.d/wl-folders"

      ;; move .addresses file
      wl-address-file "~/.emacs.d/wl-addresses"

      ;; list of folders to poll
      wl-biff-check-folder-list '("%INBOX")

      ;; interval to check for new messages
      wl-biff-check-interval 30

      ;; check folders
      ;wl-folder-check-async  t
      wl-auto-check-folder-name 'none
      wl-auto-check-folder-list '("^\\.")
      wl-auto-uncheck-folder-list nil

      wl-folder-notify-deleted t
      wl-fldmgr-add-complete-with-current-folder-list t
      ;wl-folder-info-save t
      ;wl-folder-many-unsync-threshold  100
      wl-highlight-folder-by-numbers 1

      ;; fetching large messages
      elmo-message-fetch-confirm t
      elmo-message-fetch-threshold 2500000

      ;; customizing summary view
      wl-summary-width nil
      wl-summary-weekday-name-lang "en"
      ;;wl-summary-line-format "%n%T%P%M/%D(%W)%h:%m %t%[%17(%c %f%) %] %s"
      wl-summary-line-format "%T%P%M/%D(%W)%h:%m %[ %17f %]%[%1@%] %t%C%s"

      ;; dont ask for range in sync commands
      wl-ask-range nil

      ;; scroll by 6 lines
      wl-message-scroll-amount 6
      
      ;; Open new frame for draft buffer.
      wl-draft-use-frame t

      ;; Hide wanderlust splash
      wl-demo-display-logo nil

      ;; Only save draft when I tell it to (C-x C-s or C-c C-s):
      wl-auto-save-drafts-interval 60

      ;; prevent WL from splitting large attachments into many messages
      mime-edit-split-message nil

      )

;; message:
(setq wl-message-ignored-field-list
      '(".")
      wl-message-visible-field-list
      '("^\\(To\\|Cc\\):"
	"^Subject:"
	"^\\(From\\|Reply-To\\):"
	"^\\(Posted\\|Date\\):"
	"^Organization:"
        "^Message-Id:"
	"^X-\\(Face\\(-[0-9]+\\)?\\|Weather\\|Fortune\\|Now-Playing\\):")
      wl-message-buffer-prefetch-depth 0
      wl-message-sort-field-list
      (append wl-message-sort-field-list
	      '("^Reply-To" "^Posted" "^Date" "^Organization")))

;; HTML Mail
(require 'w3m)
(require 'mime-w3m)

;; Automatic refiling of messages into 00-archive
(defun djcb-wl-summary-refile (&optional folder)
  "Refile the current message to FOLDER; if FOLDER is nil, use the default"
  (interactive)
  (wl-summary-refile (wl-summary-message-number) folder)
  (wl-summary-next)
  (message (concat "refiled to " folder)))

(define-key wl-summary-mode-map (kbd "z")
  '(lambda()(interactive)(djcb-wl-summary-refile "%INBOX/00-archive")))

;; suggested by Masaru Nomiya on the WL mailing list
(defun djcb-wl-draft-subject-check ()
  "check whether the message has a subject before sending"
  (if (and (< (length (std11-field-body "Subject")) 1)
        (null (y-or-n-p "No subject! Send current draft?")))
      (error "Abort.")))

(add-hook 'wl-mail-send-pre-hook 'djcb-wl-draft-subject-check)

;; note, this check could cause some false positives; anyway, better
;; safe than sorry...
(defun djcb-wl-draft-attachment-check ()
  "if attachment is mention but none included, warn the the user"
  (save-excursion
    (goto-char 0)
    (unless ;; don't we have an attachment?
      (re-search-forward "^Content-Disposition: attachment" nil t) 
     (when ;; no attachment; did we mention an attachment?
        (re-search-forward "attach" nil t)
        (unless (y-or-n-p "Possibly missing an attachment. Send current draft?")
          (error "Abort."))))))

(add-hook 'wl-mail-send-pre-hook 'djcb-wl-draft-attachment-check)

;; show notify-send popup on new mail
(defun djcb-popup (title msg &optional icon sound)
  "Show a popup if we're on X, or echo it otherwise; TITLE is the title
of the message, MSG is the context. Optionally, you can provide an ICON and
a sound to be played"
  (interactive)
  ;when sound (shell-command(concat "mplayer -really-quiet " sound " 2> /dev/null")))
  (if (eq window-system 'x)
      (shell-command (concat "notify-send "
                             (if icon (concat "-i " icon) "")
                             " '" title "' '" msg "'"))
    ;; text only version
    (message (concat title ": " msg))))

;; my mail notification
(defun my-mail-notify (message &optional header)
  "Notify through that new mail has arrived."
  (djcb-popup "Wanderlust"
              (format "New mail: %s. %s"
                      header
                      (substring message 0 (min 30 (length message))))
              "/usr/share/icons/gnome/32x32/status/mail-unread.png"
              "/usr/share/sounds/ubuntu/stereo/phone-incoming-call.ogg")
  (wl-summary-sync-update))

(add-hook 'wl-biff-notify-hook 'my-mail-notify)

;; Set mail-icon to be shown universally in the modeline.
(setq global-mode-string
      (cons
       '(wl-modeline-biff-status
         wl-modeline-biff-state-on
         wl-modeline-biff-state-off)
       global-mode-string))

;; prefer plain text display
(setq mime-view-type-subtype-score-alist
      '(((text . plain) . 4)
        ((text . enriched) . 3)
        ((text . html) . 2)
        ((text . richtext) . 1)))

;; multiple SMTP accounts

(require 'signature)

;; choose template with C-c C-j
(setq wl-template-alist
      '(("tbingmann"
         (wl-from . "Timo Bingmann <timo@tbingmann.de>")
         ("From" . wl-from)
         )
        ("kit"
         (wl-from . "Timo Bingmann <bingmann@kit.edu>")
         ("From" . wl-from)
         (signature-file-name . "~/.emacs.d/signatures/kit")
         (signature-insert-at-eof . t)
         (signature-delete-blank-lines-at-eof . t)
         )
        ))

;; Cycle through templates with arrow keys
(define-key wl-template-mode-map (kbd "<right>") 'wl-template-next)
(define-key wl-template-mode-map (kbd "<left>") 'wl-template-prev)
(define-key wl-template-mode-map (kbd "<up>") 'wl-template-next)
(define-key wl-template-mode-map (kbd "<down>") 'wl-template-prev)

(setq wl-message-id-domain "mail.hmtg.de"
      wl-smtp-posting-server "mail.hmtg.de"
      wl-smtp-posting-port 2401
      wl-smtp-connection-type 'ssl
      wl-smtp-authenticate-type "plain"
      wl-smtp-posting-user "timo@bingmann.com"
      wl-message-id-domain "mail.hmtg.de")
      
;; config from From: header
(setq wl-draft-config-matchone t)
(setq wl-draft-config-alist
      '(("^From: .*timo@tbingmann\\.de"
         )
        ("^From: .*bingmann@kit\\.edu"
         (wl-smtp-posting-server . "smtp.rz.uni-karlsruhe.de")
         (wl-smtp-posting-port . 587)
         (wl-smtp-connection-type . 'starttls)
         (wl-smtp-authenticate-type . "plain")
         (wl-smtp-posting-user . "timo.bingmann@kit.edu")
         (wl-message-id-domain . "kit.edu")
;         (smtp-use-gnutls . t)
;         (ssl-program-name . "gnutls-cli")
;         (ssl-program-arguments . '("--port" service
;                                    "--insecure"
;                                    ;"--x509cafile" "/etc/ssl/certs/ca-certificates.crt"
;                                    host))
;         (signature-file-name . "~/.emacs.d/signatures/kit")
         )
        ))


;; Swap a and A in summary mode, so citing original message is on a and no-cite on A.
;; I want the most common action (for me) to be the one with fewer keypresses
(define-key wl-summary-mode-map (kbd "A") 'wl-summary-reply)
(define-key wl-summary-mode-map (kbd "a") 'wl-summary-reply-with-citation)

;; more modes in when editing mail
;(add-hook 'mime-edit-mode-hook 'turn-on-flyspell)
;(add-hook 'mime-edit-mode-hook 'turn-on-auto-fill)
