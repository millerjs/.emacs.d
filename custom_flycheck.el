
;; ======== Checkers ========
(setq python-check-command "flake8")

;; ======== Colors ========
(eval-after-load 'flycheck
    '(progn 
       (set-face-foreground 'flycheck-error    "blue")
       (set-face-foreground 'flycheck-warning  "blue")
       (set-face-foreground 'flycheck-info     "blue")

       (set-face-background 'flycheck-error    "red")
       (set-face-background 'flycheck-warning  "red")
       (set-face-background 'flycheck-info     "red")
    ))
