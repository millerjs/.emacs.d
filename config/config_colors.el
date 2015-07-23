;; ======== Flymake ========
(custom-set-faces
 '(flymake-errline ((((class color)) (:underline "red"))))
 '(flymake-warnline ((((class color)) (:underline "yellow")))))

;; ======== Fonts ========
(set-face-foreground 'font-lock-comment-face "magenta")
(set-face-foreground 'font-lock-string-face "green")
(set-face-foreground 'font-lock-variable-name-face "green")
(set-face-foreground 'font-lock-keyword-face "brightgreen")
(set-face-foreground 'font-lock-constant-face "brightblue")
(set-face-foreground 'font-lock-builtin-face "brightblue")
(set-face-foreground 'neo-file-link-face "color-244")

;; ======== Window ========
(set-face-background 'mode-line "color-233")
(set-face-foreground 'mode-line "white")
(set-face-attribute 'vertical-border nil :foreground "gray")
(set-face-attribute 'vertical-border nil :background "color-233")

;; ======== Region ========
(set-face-background 'region "blue")

;; ======== Smartparens ========
(set-face-background 'sp-pair-overlay-face "black")
