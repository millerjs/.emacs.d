;; Ignore emacs buffers
(defun emacs-buffer-p (name) (string-match-p "\\*.*\\*" name))

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


(defun window-partial ()
  (max 1 (/ (1- (window-height (selected-window))) 4)))


(defun scroll-up-partial ()
  (interactive)
  (scroll-up (window-partial)))


(defun scroll-down-partial ()
  (interactive)
  (scroll-down (window-partial)))

(setq recenter-positions '(0.25 0.5 0.3 0.67 top bottom))
