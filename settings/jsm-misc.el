;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Custom macros
(fset 'jsm-magit-copy-filename "\C-rmodified   \C-m\C-[f\C-f\C-f\C-f\C-@\C-e\C-[w")


(provide 'jsm-misc)
