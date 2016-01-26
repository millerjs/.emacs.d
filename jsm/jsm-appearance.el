;;; appearance.el --- Change the way emacs looks -*-lexical-binding: t-*-

;; Version: 0.0.0
;; Author: Joshua Miller <jsmiller@uchicago.edu>

;;; Commentary:
;;

;;; Code:


;; ======================================================================
;; Flycheck

(eval-after-load 'flycheck
  '(progn
     ;; (custom-set-faces
     ;;  '(flycheck-error ((((class color)) (:underline "white"))))
     ;;  '(flycheck-warning ((((class color)) (:underline "white")))))

     (set-face-bold       'flycheck-error    0)
     (set-face-foreground 'flycheck-error    "red")
     (set-face-background 'flycheck-error    nil)
     (set-face-foreground 'flycheck-warning  "orange")
     (set-face-background 'flycheck-warning  nil)))



;; =======================================================================
;; Parens

(defadvice jsm-show-long-parens (after show-matching-paren-offscreen activate)
  "If the matching paren is offscreen, show the matching line in
        the echo area. Has no effect if the character before
        point is not of the syntax class ')'."
  (interactive)
  (let* ((cb (char-before (point)))
         (matching-text
          (and cb (char-equal (char-syntax cb) ?\) )
               (blink-matching-open))))
    (when matching-text (message matching-text))))

(setq show-paren-delay .1)
(set-face-background 'show-paren-match-face (face-background 'default))
(set-face-foreground 'show-paren-match-face "blue")
(set-face-attribute  'show-paren-match-face nil :weight 'extra-bold)


;; =======================================================================
;; Tabs

(defun jsm-indent-setup ()
  (c-set-offset 'arglist-intro '+))

(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq default-tab-width 4)
(setq whitespace-display-mappings
      '((space-mark 32 [32] [46])
        (newline-mark 10 [10096 10])))

(custom-set-faces
 '(whitespace-space    ((t ( :foreground "gray75" :bold t))))
 '(whitespace-tab      ((t ( :foreground "grey"   :background "color-233"))))
 '(whitespace-trailing ((t ( :foreground "red"    :background "color-234"))))
 '(whitespace-empty    ((t ( :foreground "black"  :background "black")))))

(setq whitespace-style '(face empty tabs tab-mark lines-trailing))


;; =======================================================================
;; Alignment/Indent

(set-default 'truncate-lines 0)
(set-face-foreground 'indent-guide-face "color-237")

(setq indent-guide-char "❘")
(setq indent-guide-recursive t)
(setq default-frame-alist
      (append (list '(width  . 81)  ; Width set to 81 characters
                    '(height . 40)) ; Height set to 60 lines
              default-frame-alist))


;; =======================================================================
;; Colors


;; Auto complete
(set-face-background 'ac-candidate-face               "color-234")
(set-face-background 'ac-selection-face               "color-18")
(set-face-background 'popup-tip-face                  "color-232")
(set-face-foreground 'ac-candidate-face               "color-243")
(set-face-foreground 'popup-tip-face                  "color-243")


;; Rust faces
(set-face-foreground 'font-lock-doc-face              "color-65")
(set-face-foreground 'font-lock-preprocessor-face     "brightblue")
(set-face-italic     'font-lock-preprocessor-face     t)
(set-face-italic     'font-lock-doc-face              t)


;; Ace jump
(set-face-background 'ace-jump-face-background        "black")
(set-face-background 'ace-jump-face-foreground        "color-18")
(set-face-foreground 'ace-jump-face-background        "color-238")
(set-face-foreground 'ace-jump-face-foreground        "brightwhite")

;; Fonts
(set-face-foreground 'font-lock-builtin-face          "brightblue")
(set-face-foreground 'font-lock-comment-face          "magenta")
(set-face-foreground 'font-lock-constant-face         "brightblue")
(set-face-foreground 'font-lock-keyword-face          "brightgreen")
(set-face-foreground 'font-lock-string-face           "green")
(set-face-foreground 'font-lock-variable-name-face    "green")
(set-face-foreground 'neo-file-link-face              "color-244")
(set-face-italic     'font-lock-comment-face          t)

;; Window
(set-face-attribute 'vertical-border nil :background  "color-233")
(set-face-attribute 'vertical-border nil :foreground  "gray")
(set-face-background 'mode-line                       "color-233")
(set-face-foreground 'mode-line                       "white")

;; Region
(set-face-background 'region                          "color-18")

;; Smartparens
(set-face-background 'sp-pair-overlay-face            "black")

;; Magit
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add             "green")
     (set-face-foreground 'magit-diff-del             "red")
     (when (not window-system)
       (set-face-background 'magit-item-highlight     "blue")
       (set-face-foreground 'magit-item-highlight     "green")
       (set-face-foreground 'magit-diff-file-header   "black"))))


;; =======================================================================
;; GUI Overrides

(when (display-graphic-p)
  (add-to-list 'default-frame-alist '(font .          "Source Code Pro"))
  (set-background-color                               "gray7")
  (set-face-attribute 'default (selected-frame) :height 105)
  (set-face-attribute 'default (selected-frame) :height 105))

(set-face-attribute 'default t :font                "Source Code Pro")
(set-face-attribute 'font-lock-keyword-face nil :weight 'bold)
(set-face-foreground 'font-lock-builtin-face        "blue2")
(set-face-foreground 'font-lock-constant-face       "blue1")
(set-face-foreground 'font-lock-keyword-face        "OliveDrab1")
(set-face-foreground 'popup-face                    "white") (setq)
(set-foreground-color                               "white")
(setq mac-command-modifier 'meta)
(setq popup-menu-face                               "gray")
(setq popup-menu-selection-face                     "gray12")
(setq ring-bell-function 'ignore)
(tool-bar-mode -1)

(provide 'jsm-appearance)
;;; jsm-appearance.el ends here
