;;; jump-lines.el --- Jump lines by custom line-no. -*-lexical-binding: t-*-

;; Version: 0.0.0
;; Author: Joshua Miller <jsmiller@uchicago.edu>

;;; Commentary:
;;

;;; Code:


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
