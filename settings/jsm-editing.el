;;; jsm-editing.el --- Custom editing shortcuts -*-lexical-binding: t-*-

;; Version: 0.0.0
;; Author: Joshua Miller <jsmiller@uchicago.edu>

;;; Commentary:
;;

;;; Code:

;; ======================================================================
;; Insertions

(defun insert-date ()
  "Insert the current date."
  (interactive)
  (insert (shell-command-to-string "echo -n $(date +%Y-%m-%d)")))

;; ======================================================================
;; Selection

(require 'expand-region)

(defun er/jsm-python-mode-expansions ()
  "Because python has paragraphs, add mark-paragraph to expansion."
  (make-variable-buffer-local 'er/try-expand-list)
  (setq er/try-expand-list (append
                            er/try-expand-list
                            '(mark-paragraph
                              mark-page))))


;; ======================================================================
;; Transforms

;; from https://github.com/magnars/.emacs.d
(defun transpose-params ()
  "Presumes that params are in the form (p, p, p) or {p, p, p} or [p, p, p]"
  (interactive)
  (let* ((end-of-first (cond
                        ((looking-at ", ") (point))
                        ((and (looking-back ",") (looking-at " ")) (- (point) 1))
                        ((looking-back ", ") (- (point) 2))
                        (t (error "Place point between params to transpose."))))
         (start-of-first (save-excursion
                           (goto-char end-of-first)
                           (move-backward-out-of-param)
                           (point)))
         (start-of-last (+ end-of-first 2))
         (end-of-last (save-excursion
                        (goto-char start-of-last)
                        (move-forward-out-of-param)
                        (point))))
    (transpose-regions start-of-first end-of-first start-of-last end-of-last)))

;; from http://whattheemacsd.com/editing-defuns.el-02.html
(defun move-line-down ()
  "Move entire line down one line"
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines 1))
    (forward-line)
    (move-to-column col))
  (forward-line 1))

(defun move-line-up ()
  "Move entire line up one line"
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines -1))
    (move-to-column col))
  (forward-line -1))


;; ======================================================================
;; YASnippet

;; (add-to-list 'yas-snippet-dirs (expand-file-name "snippets" user-emacs-directory))
(yas-reload-all)


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
