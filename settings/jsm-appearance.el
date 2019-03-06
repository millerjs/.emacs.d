;;; jsm-appearance.el --- Change the way emacs looks -*-lexical-binding: t-*-

;; Version: 0.0.0
;; Author: Joshua Miller <jsmiller@uchicago.edu>

;;; Commentary:
;;

;;; Code:


(require 'indent-guide)

;; ======================================================================
;; Org Mode

(custom-set-faces
 '(org-block-begin-line  ((t ( :foreground "color-245" :background "black" :bold nil))))
 '(org-document-info     ((t ( :foreground "magenta" :bold nil))))
 '(org-document-title     ((t ( :foreground "magenta" :bold nil))))
 )


(defun jsm-presentation-start ()
  (add-hook 'window-configuration-change-hook
          (lambda () (set-window-margins (car (get-buffer-window-list (current-buffer) nil t)) 2 2))))

(defun jsm-presentation-stop ()
  (set-window-margins nil 0))


(setq org-src-fontify-natively t)


;; MMM Mode

(eval-after-load 'mmm-mode
  '(progn
     (set-face-background 'mmm-special-submode-face "color-250")
     (set-face-italic     'mmm-default-submode-face nil)
     (set-face-background 'mmm-default-submode-face "black")))


;; Ripgrep
(eval-after-load 'ripgrep-search-mode
  '(progn
     (set-face-foreground 'ripgrep-hit-face "ForestGreen")))


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
     (set-face-foreground 'flycheck-info     "orange")
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
(set-face-background 'show-paren-match (face-background 'default))
(set-face-foreground 'show-paren-match "blue")
(set-face-attribute  'show-paren-match nil :weight 'extra-bold)


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

(setq indent-guide-char "│")
(setq indent-guide-recursive t)
(setq default-frame-alist
      (append (list '(width  . 81) '(height . 40)) default-frame-alist))


;; =======================================================================
;; Colors

(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))

;; ido
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(custom-set-faces
 '(col-highlight ((t (:background "color-233"))))
 '(hl-line ((t (:background "color-233"))))
 '(lazy-highlight ((t (:background "black" :foreground "white" :underline t))))
 '(neo-dir-link-face ((t (:foreground "color-21"))))
 '(neo-file-link-face ((t (:foreground "color-245")))))


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

;; Fonts
(set-face-foreground 'font-lock-builtin-face          "brightblue")
(set-face-foreground 'font-lock-comment-face          "magenta")
(set-face-foreground 'font-lock-constant-face         "brightblue")
(set-face-foreground 'font-lock-keyword-face          "brightgreen")
(set-face-foreground 'font-lock-string-face           "green")
(set-face-foreground 'font-lock-variable-name-face    "green")
(set-face-italic     'font-lock-comment-face          t)
(set-face-foreground 'font-lock-type-face             "ForestGreen")
(set-face-foreground 'font-lock-function-name-face    "Blue1")
(set-face-foreground 'minibuffer-prompt               "medium blue")

;; Window
(set-face-attribute 'vertical-border nil :background  "color-233")
(set-face-attribute 'vertical-border nil :foreground  "050505gray")
(set-face-background 'mode-line                       "color-235")
(set-face-foreground 'mode-line                       "white")
(setq split-height-threshold 1200)
(setq split-width-threshold  2000)

;; Region
(set-face-background 'region                          "color-18")

;; Smartparens
(set-face-background 'sp-pair-overlay-face            "black")


;; Magit
(custom-set-faces
 '(magit-diff-hunk-heading-highlight ((((type tty)) (                          :background "color-235" ))))
 '(magit-diff-hunk-heading           ((((type tty)) (                          :background "color-234" ))))
 '(magit-diff-added                  ((((type tty)) ( :foreground "green"      :background "color-232" ))))
 '(magit-diff-added-highlight        ((((type tty)) ( :foreground "green"      :background "color-232" ))))
 '(magit-diff-context-highlight      ((((type tty)) ( :foreground "default"    :background "color-232" ))))
 '(magit-diff-file-heading           ((((type tty)) (                          :background "color-232" ))))
 '(magit-diff-removed                ((((type tty)) ( :foreground "red"                                ))))
 '(magit-diff-removed-highlight      ((((type tty)) ( :foreground "IndianRed"  :background "color-232" ))))
 '(magit-section-highlight           ((((type tty)) ( :foreground "default"    :background "color-232" )))))

(custom-set-variables)

;; ======================================================================
;; Geometry

(setq neo-window-width 50)

;; Toggle window dedication

(defun toggle-window-dedicated ()
  "Toggle whether the current active window is dedicated or not."
  (interactive)
  (message
   (if (let (window (get-buffer-window (current-buffer)))
         (set-window-dedicated-p window
                                 (not (window-dedicated-p window))))
       "Window '%s' is dedicated"
     "Window '%s' is normal")
   (current-buffer)))

;; =======================================================================
;; GUI Overrides

(when (display-graphic-p)
  (add-to-list 'default-frame-alist '(font .          "Source Code Pro"))
  (set-background-color                               "gray2")
  (set-face-attribute 'default (selected-frame) :height 105)
  (set-face-attribute 'default (selected-frame) :height 105)
  )

(set-face-attribute 'font-lock-keyword-face nil :weight 'bold)
(set-face-foreground 'font-lock-builtin-face        "blue2")
(set-face-foreground 'font-lock-constant-face       "blue1")
(set-face-foreground 'font-lock-keyword-face        "OliveDrab1")
(set-face-foreground 'popup-face                    "color-235") (setq)
(set-foreground-color                               "white")
(setq popup-menu-face                               "gray")
(setq popup-menu-selection-face                     "gray12")
(setq ring-bell-function 'ignore)
(tool-bar-mode -1)

(provide 'jsm-appearance)
;;; appearance.el ends here
