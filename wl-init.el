;; IMAP, gmail:
(setq elmo-imap4-default-server "mail.hmtg.de"
      elmo-imap4-default-user "timo@bingmann.com"
      elmo-imap4-default-authenticate-type 'clear
      elmo-imap4-default-port '993
      elmo-imap4-default-stream-type 'ssl

      ;;for non ascii-characters in folder-names
      elmo-imap4-use-modified-utf7 t)

;; SMTP
(setq wl-smtp-connection-type 'ssl
      wl-smtp-posting-port 2401
      wl-smtp-authenticate-type "plain"
      wl-smtp-posting-user "timo@bingmann.com"
      wl-smtp-posting-server "mail.hmtg.de"
      wl-local-domain "hmtg.de"
      wl-message-id-domain "mail.hmtg.de")

(setq wl-from "Timo Bingmann <timo@tbingmann.de>"

      wl-default-folder "%INBOX"
      wl-draft-folder   "%Drafts"
      wl-trash-folder   "%Trash"
      wl-fcc            "%Sent"
      wl-queue-folder   "%Queue"

      ;; mark sent messages as read (sent messages get sent back to you and
      ;; placed in the folder specified by wl-fcc)
      wl-fcc-force-as-read t

      ;;for when auto-compleating foldernames
      wl-default-spec "%"

      ;; use "Fwd: " not "Forward: "
      wl-forward-subject-prefix "Fwd: "

      ;; show the folder pane (left)
      wl-stay-folder-window t

      ;; toggle on/off with 'i'
      wl-folder-window-width 25

      ;; move .folders file
      wl-folders-file "~/.emacs.d/wl-folders"

      ;; move .addresses file
      wl-address-file "~/.emacs.d/wl-addresses"

      ;; list of folders to poll
      wl-biff-check-folder-list '("%INBOX")

      ;; interval to check for new messages
      wl-biff-check-interval 60

      elmo-message-fetch-confirm t
      elmo-message-fetch-threshold 2500000

      wl-summary-width nil
      wl-summary-weekday-name-lang "en"
      ;;wl-summary-line-format "%n%T%P%M/%D(%W)%h:%m %t%[%17(%c %f%) %] %s"
      wl-summary-line-format "%T%P%M/%D(%W)%h:%m %[ %17f %]%[%1@%] %t%C%s"
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

;; Automatically Archive Message
(defun cjk-archive-message ()
  (interactive)

  (let ((folder wl-summary-buffer-elmo-folder)
        (msg-no (wl-summary-message-number))
        date entity year)

    (setq entity (elmo-message-entity folder msg-no))
    (setq date (elmo-message-entity-field entity 'date 'string))

    (when (eq date "")
      (setq date (elmo-message-entity-field entity 'received 'string)))

    (string-match "\\([1-9][0-9]\\{3\\}\\)" date)
    (setq year (match-string 1 date))
    (when (eq year nil)
      (error "no valid date header field"))

    (setq folder (concat ".Archive." year))

    (if (funcall (symbol-function 'wl-summary-refile) msg-no folder)
        (message "Refiled message to folder %s" folder)
      (message "Error refiling message to folder %s" folder))))


