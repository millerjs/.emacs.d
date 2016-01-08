;;; editing.el --- Custom editing shortcuts -*-lexical-binding: t-*-

;; Version: 0.0.0
;; Author: Joshua Miller <jsmiller@uchicago.edu>

;;; Commentary:
;;

;;; Code:

;; =======================================================================
;; Decorations

(fset 'jsm-insert-divider  "\C-e\C-m\C-u70=\C-x\C-m\C-m.\C-x\C-m\C-?")


;; =======================================================================
;; Delimeters

(defun jsm-parens-wrap (&optional arg)
  (interactive "p")
  (sp-select-next-thing-exchange arg)
  (execute-kbd-macro (kbd "(")))


;; =======================================================================
;; Comments

(defun jsm-comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if
there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))


;; =======================================================================
;; Alignment

(defun jsm-align-repeat (start end regexp)
  "Repeat alignment with respect to
     the given regular expression."
  (interactive "r\nsAlign regexp: ")
  (align-regexp start end
                (concat "\\(\\s-*\\)" regexp) 1 1 t))

