;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Custom macros
(fset 'jsm-magit-copy-filename "\C-rmodified   \C-m\C-[f\C-f\C-f\C-f\C-@\C-e\C-[w")
(fset 'close-buffers-not-rails "\C-[xclose-all-buffers\C-mno\C-m")


(defun jsm-shell-command-on-region-or-line ()
  "Run selected text in a terminal or use the current line."
  (interactive)
  (shell-command
    (if (use-region-p)
        ;; current selection
        (buffer-substring (region-beginning) (region-end))
        ;; current line
        (thing-at-point 'line t))))

(provide 'jsm-misc)
