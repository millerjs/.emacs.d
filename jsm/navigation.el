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

(defun move-middle-line  () (interactive)
   (forward-word 1)
   (backward-word 1)

   (setq l (what-cursor-position))
   (setq l (replace-regexp-in-string ".+=" "" l))
   (setq m (string-to-number l))

   (move-end-of-line 1)
   (setq l (what-cursor-position))
   (setq l (replace-regexp-in-string ".+=" "" l))
   (setq n (/ (string-to-number l) 2))
   (move-to-column (+ n m))

)


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


(defun jump-forward (cmd)
  "Jumps forward lines as noted by line numbering. a2 goes
  forward 27 lines"
  (interactive "s")
  (setq parsed (s-match "\\([a-z0-9]\\)*" cmd))
  (setq lines-n (- (aref (-first-item parsed) 0) 96))
  (setq lines-mult (- (max (string-to-number (nth 1 parsed)) 1) 1))
  (next-line (+ lines-n (* lines-mult 26))))


(defun jump-backward (cmd)
  "Jumps backward lines as noted by line numbering. a2 goes
  backward 27 lines"
  (interactive "s")
  (setq parsed (s-match "\\([a-z0-9]\\)*" cmd))
  (setq lines-n (- (aref (-first-item parsed) 0) 96))
  (setq lines-mult (- (max (string-to-number (nth 1 parsed)) 1) 1))
  (previous-line (+ lines-n (* lines-mult 26))))


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
