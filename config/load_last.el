;; ======== Checkers ========
(setq python-check-command "flake8")

;; ======== Colors ========
(eval-after-load 'flycheck
  '(progn
     (set-face-foreground 'flycheck-error    "brightwhite")
     (set-face-background 'flycheck-error    "magenta")
     (set-face-foreground 'flycheck-warning  "blue")
     (set-face-background 'flycheck-warning  "red")
     )
  )

(add-to-list 'completion-ignored-extensions ".pyc")

(defcustom direx:ignored-files-regexp
  (concat "\\(?:" (regexp-opt completion-ignored-extensions) "\\|#\\)$")
(setq direx:ignored-files-regexp
  (concat "\\(?:" (regexp-opt completion-ignored-extensions) "\\|#\\)$")

(princ-list completion-ignored-extensions)
