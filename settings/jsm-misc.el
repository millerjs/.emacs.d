;; Disable backup saving
(setq auto-save-default nil)
(setq make-backup-files nil)

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

(setq atomic-chrome-buffer-open-style 'frame)


(defun jsm-gist-jira ()
  "Create a new gist for the current jira org heading"
  (interactive)
  (shell-command "gist"))


(provide 'jsm-misc)
