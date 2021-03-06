
;;; variables.el --- Basically any variable definition that doesn't fit elsewhere. -*-lexical-binding: t-*-

;; Version: 0.0.0
;; Author: Joshua Miller <jsmiller@uchicago.edu>

;;; Commentary:
;;

;;; Code:


(ac-config-default)
(global-auto-complete-mode t)
(setq ac-auto-show-menu    t)
(setq ac-auto-start        t)
(setq ac-ignore-case       'smart)
(setq ac-use-menu-map      t)
(setq ac-use-fuzzy         t)

(setq-default c-basic-offset                 4)
(setq inhibit-startup-message                t)   ; no startup message
(setq make-backup-files                      nil) ; no backup files
(setq auto-save-list-file-name               nil) ; no .saves files
(setq auto-save-default                      nil) ; no auto saving
(setq search-highlight                       t)   ; Highlight search object
(setq query-replace-highlight                t)   ; Highlight query object
(setq mouse-sel-retain-highlight             t)   ; Keep mouse high-lighting
(setq recenter-positions                     '(0.45 0.25 .75 top bottom))
(setq direx:open-icon                        "▼  ")
(setq direx:closed-icon                      "▶  ")
(add-to-list 'completion-ignored-extensions  ".pyc")
(add-to-list 'completion-ignored-extensions  ".o")
(setq even-window-heights nil)

;; Org mode

(setq org-return-follows-link t)

;; ======================================================================
;; Flycheck

(setq flycheck-check-syntax-automatically
      '(mode-enabled save idle-change new-line))


;; ======================================================================
;; Backups

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves/"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

;; ======================================================================
;; Linum

(setq linum-relative-format "%3s› ")

;; ======================================================================
;; Autocomplete

;; Popup menu
(setq ac-menu-height       20)
(setq ac-auto-start        1)
(setq ac-show-menu-immediately-on-auto-complete t)

;; Popup menu delay
(setq jsm-ac-delay         1.0)
(setq ac-auto-show-menu    jsm-ac-delay)
(setq ac-delay             jsm-ac-delay)
(setq ac-quick-help-delay  (+ jsm-ac-delay 0.1))
(setq ac-persist-help      t)
(setq ac-quick-help-height 10)
(setq ac-menu-height       10)
(setq ac-quick-help-prefer-pos-tip t)


;; ======================================================================
;; yasnippet

(setq yas-buffer-local-condition t)

(provide 'jsm-variables)
;;; jsm-variables.el ends here
