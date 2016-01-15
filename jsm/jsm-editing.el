;;; editing.el --- Custom editing shortcuts -*-lexical-binding: t-*-

;; Version: 0.0.0
;; Author: Joshua Miller <jsmiller@uchicago.edu>

;;; Commentary:
;;

;;; Code:


;; ======================================================================
;; Whitespace

;; Kill end of line, remove whitespace
(fset 'jsm-kill-newline "\C-e\C-k\C-xw\C-?\C-e")


;; ======================================================================
;; Decorations

(fset 'jsm-insert-divider "\C-a\C-m\C-x\C-m\C-p\C-u70=\C-x\C-m\C-n")


;; ======================================================================
;; Comments

(defun jsm-comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))


;; ======================================================================
;; Alignment

(defun jsm-align-repeat (start end regexp)
  "Repeat alignment with respect to the given regular expression."
  (interactive "r\nsAlign regexp: ")
  (align-regexp start end
                (concat "\\(\\s-*\\)" regexp) 1 1 t))


(provide 'jsm-editing)
;;; jsm-editing.el ends here
