;; ======== Tabs ========
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq default-tab-width 4)

;; ======== Whitespace ========
(require 'whitespace)
(setq whitespace-display-mappings
       ;; all numbers are Unicode codepoint in decimal. try (insert-char 182 ) to see it
      '(
        (space-mark 32 [32] [46])
        (newline-mark 10 [10096 10]) ; 10 newline ⇤
        ;; (tab-mark 9 [8230 9] [91 9]) ; 8677
        ;; (tab-mark 9 [8230 9]) ; 8677
        ;; (tab-mark 9 [9655 9] [92 9]) ; 9 TAB, 9655 WHITE RIGHT-POINTING TRIANGLE 「▷」

        )
)

(defun my-indent-setup ()
  (c-set-offset 'arglist-intro '+))
    (add-hook 'c-mode-hook 'my-indent-setup)

(custom-set-faces
 '(whitespace-space ((t (:bold t :foreground "gray75"))))
 '(whitespace-tab ((t (:foreground "grey" :background "color-233"))))
 '(whitespace-trailing ((t (:foreground "red" :background "color-234"))))
 '(whitespace-empty ((t (:foreground "black" :background "black"))))
 )

(setq whitespace-style '(face empty tabs tab-mark lines-trailing))
(global-whitespace-mode t)

;; ======== Go fmt ========
(add-hook 'before-save-hook #'gofmt-before-save)

;; ======== Indent Guide ========
(setq indent-guide-char "❘")
(set-face-foreground 'indent-guide-face "color-237")
(setq indent-guide-recursive t)


;; ======== Alignment ========
(defun align-repeat (start end regexp)
  "Repeat alignment with respect to
     the given regular expression."
  (interactive "r\nsAlign regexp: ")
  (align-regexp start end
                (concat "\\(\\s-*\\)" regexp) 1 1 t))

(setq default-frame-alist (append (list
                                   '(width  . 81)  ; Width set to 81 characters
                                   '(height . 40)) ; Height set to 60 lines
                                  default-frame-alist))

;; ======== Headers ========
(global-set-key (kbd "C-x C-h") 'make-header) ; [Ctrl]-[x] [Ctrl]-[h]
(global-set-key (kbd "C-x h") 'make-header) ; [Ctrl]-[x] [Ctrl]-[h]

(defun make-header ()
  (interactive)
  (goto-char (line-beginning-position))
  (insert "========")
  (just-one-space)
  (goto-char (line-end-position))
  (just-one-space)
  (insert "========")
  (defvar end (line-end-position))
  (comment-or-uncomment-region-or-line))


;; =======================================================================
;; Colors
;; =======================================================================

;; Ace jump
(set-face-foreground 'ace-jump-face-foreground "brightyellow")
(set-face-background 'ace-jump-face-foreground "black")
(set-face-foreground 'ace-jump-face-background "color-238")
(set-face-background 'ace-jump-face-background "black")

;; Flymake
(custom-set-faces
 '(flymake-errline ((((class color)) (:underline "red"))))
 '(flymake-warnline ((((class color)) (:underline "yellow")))))

;; Fonts
(set-face-foreground 'font-lock-comment-face "magenta")
(set-face-foreground 'font-lock-string-face "green")
(set-face-foreground 'font-lock-variable-name-face "green")
(set-face-foreground 'font-lock-keyword-face "brightgreen")
(set-face-foreground 'font-lock-constant-face "brightblue")
(set-face-foreground 'font-lock-builtin-face "brightblue")
(set-face-foreground 'neo-file-link-face "color-244")

;; Window
(set-face-background 'mode-line "color-233")
(set-face-foreground 'mode-line "white")
(set-face-attribute 'vertical-border nil :foreground "gray")
(set-face-attribute 'vertical-border nil :background "color-233")

;; Region
(set-face-background 'region "blue")

;; Smartparens
(set-face-background 'sp-pair-overlay-face "black")

;; Magit
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green")
     (set-face-foreground 'magit-diff-del "red")
     (when (not window-system)
       (set-face-background 'magit-item-highlight "blue")
       (set-face-foreground 'magit-item-highlight "green")
       (set-face-foreground 'magit-diff-file-header "black")
       )
     )
  )

(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG$" . diff-mode))
(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "black")
     (set-face-foreground 'diff-removed "black")
     (set-face-background 'diff-added "black")
     (set-face-background 'diff-removed "black")))


;; =======================================================================
;; GUI Overrides
;; =======================================================================

(when (display-graphic-p)
  (setq ring-bell-function 'ignore)
  (setq popup-menu-face "gray")
  (setq popup-menu-selection-face "gray12")
  (set-background-color "gray7")
  (set-foreground-color "white")
  (add-to-list 'default-frame-alist '(font .  "Source Code Pro"))
  (set-face-attribute 'default t :font "Source Code Pro")
  (setq mac-command-modifier 'meta)
  (set-face-attribute 'default (selected-frame) :height 105)
  (set-face-foreground 'font-lock-keyword-face  "OliveDrab1")
  (set-face-foreground 'popup-face  "white") (setq)
  (set-face-attribute 'font-lock-keyword-face nil :weight 'bold)
  (set-face-foreground 'font-lock-constant-face "blue1")
  (set-face-foreground 'font-lock-builtin-face "blue2")
  (tool-bar-mode -1)
  (set-face-attribute 'default (selected-frame) :height 105)
)
