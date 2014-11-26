;; ======== Tabs ========
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq default-tab-width 4)

;; ======== Whitespace ========
(setq whitespace-display-mappings
       ;; all numbers are Unicode codepoint in decimal. try (insert-char 182 ) to see it
      '(
        (space-mark 32 [32] [46])
        (newline-mark 10 [8676 10]) ; 10 newline ⇤
        (tab-mark 9 [9655 9] [92 9]) ; 9 TAB, 9655 WHITE RIGHT-POINTING TRIANGLE 「▷」
        ))
(setq whitespace-style (quote (spaces tabs newline space-mark tab-mark newline-mark)))

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
