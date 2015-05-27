;; ======== Checkers ========
(setq python-check-command "flake8")

;; ======== Colors ========
(eval-after-load 'flycheck
  '(progn
     (set-face-foreground 'flycheck-error    "brightwhite")
     (set-face-foreground 'flycheck-warning  "blue")

     (set-face-background 'flycheck-error    "magenta")
     (set-face-background 'flycheck-warning  "red")
     )
  )
