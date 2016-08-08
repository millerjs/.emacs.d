;;; navigation.el --- Custom ways to get around -*-lexical-binding: t-*-

;; Version: 0.0.0
;; Author: Joshua Miller <jsmiller@uchicago.edu>

;;; Commentary:
;;

;;; Code:


;; =======================================================================
;; Navigation related options

(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)


;; =======================================================================
;; Inter-buffer navigation

(defun close-all-buffers ()
  (interactive)
    (mapc 'kill-buffer (buffer-list)))

(defun emacs-buffer-p (name)
  (string-match-p "\\*.*\\*" name))


(defun next-non-emacs-buffer (&optional original)
  "Similar to next-buffer, but ignores emacs buffer such as *scratch*, *messages* etc."
  (interactive)
  (let ((tmp-orig (or original (buffer-name))))
    (next-buffer)
    (if (and
         (not (eq (buffer-name) tmp-orig))
         (emacs-buffer-p (buffer-name)))
        (next-non-emacs-buffer tmp-orig))))


(defun previous-non-emacs-buffer (&optional original)
  "Similar to previous-buffer, but ignores emacs buffer such as *scratch*, *messages* etc."
  (interactive)
  (let ((tmp-orig (or original (buffer-name))))
    (previous-buffer)
    (if (and
         (not (eq (buffer-name) tmp-orig))
         (emacs-buffer-p (buffer-name)))
        (previous-non-emacs-buffer tmp-orig))))


;; ======================================================================
;; Intra-buffer navigation

(defun move-middle-line  ()
  "Move to middle of current line."
  (interactive)
  (move-beginning-of-line 1)
  (forward-midpoint))

(defun backward-midpoint ( )
  "Move backward to midpoint between current position and beginning of line."
  (interactive)
  (backward-char (/ (- (point) (line-beginning-position)) 2)))

(defun forward-midpoint ( )
  "Move forward to midpoint between current position and end of line."
  (interactive)
  (forward-char (/ (- (line-end-position) (point)) 2)))


(defun length-of-line ()
  "Returns the length of the line"
  (setq start (what-cursor-position))
  (setq start (string-to-number (replace-regexp-in-string ".+=" "" start)))
  (move-end-of-line 1)
  (setq end (what-cursor-position))
  (setq end (replace-regexp-in-string ".+=" "" end))
  (move-to-column start)
  (string-to-number end)
)


(defun window-partial ()
  "Get partial size of window for partial scrolls"
  (max 1 (/ (1- (window-height (selected-window))) 4)))


(defun scroll-up-partial ()
  "Scroll partially up the current buffer"
  (interactive)
  (scroll-up (window-partial)))


(defun scroll-down-partial ()
  "Scroll partially down the current buffer"
  (interactive)
  (scroll-down (window-partial)))


;; ======================================================================
;; YASnippet

(require 'yasnippet)
(define-key yas-keymap (kbd "TAB") 'yas-next-field)
(define-key yas-keymap (kbd "<tab>") 'yas-next-field)


;; ======================================================================

(provide 'jsm-navigation)
;;; jsm-navigation.el ends here
