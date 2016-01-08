;;; variables.el --- Basically any variable definition that doesn't fit elsewhere. -*-lexical-binding: t-*-

;; Version: 0.0.0
;; Author: Joshua Miller <jsmiller@uchicago.edu>

;;; Commentary:
;;

;;; Code:

(setq ac-auto-show-menu 0.0)
(setq ac-ignore-case 'smart)
(setq ac-use-menu-map t)
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
