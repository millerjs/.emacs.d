;; ======== Checkers ========
(setq python-check-command "flake8")

;; ======== Colors ========
(eval-after-load 'flycheck
  '(progn
     ;; (custom-set-faces
     ;;  '(flycheck-error ((((class color)) (:underline "white"))))
     ;;  '(flycheck-warning ((((class color)) (:underline "white")))))

     (set-face-foreground 'flycheck-error  "color-160")
     (set-face-background 'flycheck-error  "color-232")
     (set-face-foreground 'flycheck-warning  "color-162")
     (set-face-background 'flycheck-warning  "color-232")

     )
  )
