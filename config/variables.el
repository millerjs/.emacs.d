;; ======== Variables ========
(setq-default c-basic-offset     4)
(setq inhibit-startup-message    t)   ; Don't want any startup message
(setq make-backup-files          nil) ; Don't want any backup files
(setq auto-save-list-file-name   nil) ; Don't want any .saves files
(setq auto-save-default          nil) ; Don't want any auto saving
(setq search-highlight           t)   ; Highlight search object
(setq query-replace-highlight    t)   ; Highlight query object
(setq mouse-sel-retain-highlight t)   ; Keep mouse high-lighting
;; (setq recenter-positions         '(0.25 0.5 .75 top bottom))
(setq recenter-positions         '(0.5 0.25 .75 top bottom))
(setq direx:open-icon "▼ ")
(setq direx:closed-icon "▶ ")
(add-to-list 'completion-ignored-extensions ".pyc")